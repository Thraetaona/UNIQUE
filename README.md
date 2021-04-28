<div align="center">

  <h1><code>UNIQUE</code></h1>

  <img src="" alt="Logo">

  <p>
    <strong>Unary Integral Quantities Unique Emulation on FPGA using VHDL</strong>
  </p>

  <p>
    <a href="https://github.com/Thraetaona/UNIQUE/actions"><img alt="GitHub Actions CI status" src="https://github.com/Thraetaona/UNIQUE/workflows/UNIQUE/badge.svg"></a>
  </p>

  <h3>
    <a href="https://Thraetaona.github.io/UNIQUE/">Website</a>
    <span> | </span>
    <a href="https://github.com/Thraetaona/UNIQUE/issues">Issue Tracker</a>
    <span> | </span>
    <a href="https://github.com/Thraetaona/UNIQUE/actions">CI</a>
    <span> | </span>
    <a href="https://github.com/Thraetaona/UNIQUE/projects">Roadmap</a>
    <span> | </span>
    <a href="https://github.com/Thraetaona/UNIQUE/releases">Releases</a>
  </h3>
  
</div>

***

## Abstract
UNIQUE is an acronym for "**U**nary **I**ntegral **Q**uantities **U**nique **E**mulation". \
As a more detailed explanation this means Uniquely<sup>1</sup> Emulating<sup>2</sup> Unary<sup>3</sup> Integral<sup>4</sup> Quantities<sup>5</sup>

<sub>
1- because unary is a bijective (one-to-one correspondence) numeral system.  Also the idea itself is novel and unique. <br>
2- Given that we are designing a unary architecture on a binary system (FPGA). <br>
3- Base-1 numeral system. <br>
4- Integral in this context means consisting of a whole number or an undivided quantity.  Not the notion of anti-derivatives in calculus. <br>
5- Technical info such as the method used to represent negative unary numbers is covered below and in the commented areas of the code. <br>
</sub>

### Foreword

Note that there is some dispute regarding the legitimacy of the unary numeral system; key points being:
1. Given the pattern of positional numeral systems (i.e. decimal (base-10) using `{0, 1, 2, 3, 4, 5, 6, 7, 8, 9}` and binary (base-2) using `{0, 1}`) it is expected for unary (base-1) to use only `{0}` for representation, using this definition, the decimal numeric sequence `{-1, 0, 1, 2, 3}` should be the unary numeric sequence `{-0, 0, 0, 00, 000}`, but all of these values are equal which means that unary can't be used to represent more than a single number, that is, 0.  So the only choice is to use a *symbol* (e.g. tally marks '|', a letter like A or another number such as 1).
2. Simply the absence of said symbol could be considered a second state meaning that it can be the same as the binary numeral system with only a simple renaming of 1 and 0 to the mere presence and absence of a chosen symbol.
3. It is not exactly clear if 0 can be properly represented in unary; one way is to be implicit and represent 0 by nothing at all (Null), or to "shift" (Add up) every number set by 1, so that `{0, 1, 2, 3, n}` in decimal is now `{1, 11, 111, 1111, n+1}` in unary, however this only makes sense when dealing with non-negative numbers, because now -1 is basically the previous 0 and we are forced to use null/nothing to represent it.  However, this partly dates back to the history of tally marks and the recent use of 0, [more info here](https://en.wikipedia.org/wiki/0#History).

On the other hand, the above statements could be countered with these:
1. Unary is not a positional numeral system given that the value of a digit does not depend on its position, for instance "1<sub>1</sub>1<sub>2</sub>1<sub>3</sub>" does not differ from "1<sub>3</sub>1<sub>1</sub>1<sub>2</sub>" (Subscripts here are used to identify the position of each digit, similar to abc and cab whereas a, b and c are all equal (to 1 in this case))
2. Since the only purpose of the absence of a symbol is to represent 0 and nothing else (Also given that 0 could be represented in other ways as discussed earlier); and considering that 0 (null in unary) is not a natural number in the first place, there shouldn't be any requirement for it to be included in the representations of natural numbers either.  As for the "second" state, by that reasoning we might also have a "third" state for binary digits (bits), 1, 0 and # (Or undefined), this confusion is natural and not exactly related to pure mathematics because we are mostly talking about this in an actual hardware implementation, and emulating unary within current digital processors will often require some workarounds due to these hardware limits.
3.  Because unary is a bijective numeral system (i.e. each number has one and only one representation), unlike in decimal, where "ten", for example, could be written in many ways such as "010", "0010", etc whereas it's one-to-one correspondence counterpart (bijective base-10) replaces zero with a symbol such as 'a' (and 0 (zero) itself is represented just like in unary).  Also as pointed out earlier, this is related to the recent use of 0 and the history of unary.

Ultimately this makes unary a **non-standard** numeral system, so expect a few assumptions to take place throughout the code. \
It is worth mentioning that the view on unary is mostly historical (e.g. studying the evolution of numeric systems in ancient civilizations) or to simplify teaching (e.g. learning how to count using sticks or tally marks) and not much about actual calculations in mathematics.



***

## Features
