# Below commands are compatible with both Linux's POSIX (Including Bash) and Windows' CMD.
# 
# Notes on Active-HDL:
# Active-HDL really insists on using their GUI for every task, but they do support
# Command line based ("batch mode" as they call it) versions of their tools
# as well; while they seem to be lacking when it comes to the customizability
# offered by their GUI counterparts with questionable design choices, they
# nonetheless work with some work-arounds and greatly simplify the build process.
# 
# Notes on make:
# Double $$ are used so that the first $ allows the second $ sign to be escaped and not treated as a variable by make.
# Inline # comments have to start without any spaces behind them, because there should be no extra trailing whitespaces after a variable's value.
# Chained & commands stored in variables are to be invoked as functions, since the standard make does not support declaring custom functions.
# - used before certain commands is to prevent make from bailing out if the command has a chance of (non-critically) failing. (For example \
 mkdir returns an error under Windows if an specified directory already exists, but that's not really an issue so we use - and & in place of &&.)
# @ for make to avoid displaying the current running command (Akin to "make -s").  Output streams, however, will have to be redirected to null.
#
# Configuration variables
library_name = "UNIQUE"# Name of the project.
library_path = compile/$(library_name)# Used as a work-around to nove Active-HDL's output from top-level to a folder named "compile".

# Custom functions
# 
# As mentioned earlier, @ only hides the echo of an specified command and does not affect it's output, and unfortunately Windows' "mkdir"
# will print an error (More of a warning or information, but it can be ignored by make using -) and the only way to hide the error is to
# redirect (Append) the output of stderr to it to a file in the _current_ directory and delete the said file along with any other unneeded
# files in the __post_build step.
# Also Active-HDL requires a .lib file (With the same name as the parameter after -work or -lib) to exist in the specified directory
# even if the file is empty; since there is no other way around this the only solution is to create the said file and delete it right
# after Active-HDL is done, thus leaving the user experience unaffected and having a cleaner and more portable repository.
__pre_build = @-(mkdir compile >> ./tmp 2>&1) & echo $$null >> $(library_path).lib
__post_build = @-(rm $(library_path).lib & rm ./tmp)


# Make targets
run: build
	$(__pre_build)
	@(vsim -c -lib $(library_path) ./src/alu_tb.vhd 100ns)
	$(__post_build)

build: # Active-HDL's "-lib" argument seems to be broken at the moment so -work has to be used instead.
	$(__pre_build)
	@(vcom -2019 -O3 -protect 0 -work $(library_path) ./src/*.vhd)
	$(__post_build)

clean:
	$(__pre_build)
	@(vdel -lib $(library_path) -all)
	$(__post_build)