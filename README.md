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
1- because unary is a bijective numeral system.  Also the idea itself is novel and unique. <br>
2- Given that we are designing a unary architecture on a binary system (FPGA). <br>
3- Base-1 numeral system. <br>
4- Integral in this context means consisting of a whole number or an undivided quantity.  Not the notion of anti-derivatives. <br>
5- Technical info such as the method used to represent negative unary numbers is covered below and in the commented areas of the code. <br>
</sub>

### Foreword

Note that there is some dispute regarding the legitimacy of the unary numeral system; key points being:
1. Given the pattern of positional numeral systems (i.e. decimal (base-10) using `{0, 1, 2, 3, 4, 5, 6, 7, 8}` and binary (base-2) using `{0, 1}`) it is expected for unary (base-1) to use `{0}` for representation, using this definition, the decimal numeric sequence `{-1, 0, 1, 2, 3}` should be the unary numeric sequence `{-0, 0, 0, 00, 000}`, but all of these values are equal which means that unary can't be used to represent more than a single number, that is, 0.  So the only choice is to use a *symbol* (Like tally marks or another number such as 1).
2. Simply the absence of a symbol (e.g. '1' or '|') could be considered a second state meaning that it can be the same as the binary numeral system with only a simple renaming of 1 and 0 to the mere presence and absence of a chosen symbol.
3. It is not exactly clear if 0 can be properly represented in unary; one way is to be implicit and represent 0 by nothing at all (Null), or to "shift" (Add up) every number set by 1, so that `{0, 1, 2, 3}` in decimal is now `{1, 2, 3, 4}` in unary, however this only makes sense when dealing with non-negative numbers, because now -1 is basically the previous 0 and we are forced to use null or nothing to represent it.  However, this partly dates back to the history of tally marks and the recent use of 0, [more info here](https://en.wikipedia.org/wiki/0#History).



***

## Features
