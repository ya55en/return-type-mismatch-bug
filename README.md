# return-type-mismatch-bug

Reproducing crystal compiler issue:

`Function return type does not match operand type of return inst!`

## Prerequisites

- [crystal](https://crystal-lang.org/) compiler ver. 1.6.1


```
$ crystal --version
Crystal 1.6.1 [fc61bd678] (2022-10-21)

LLVM: 13.0.1
Default target: x86_64-unknown-linux-gnu

```

## Installation

- clone the repository and `cd` into its root:

```
git clone https://github.com/ya55en/return-type-mismatch-bug.git
cd return-type-mismatch-bug
```


## Execute the example spec

```
crystal spec
```

Here is what will (probably) pop up:

```
Module validation failed: Function return type does not match operand type of return inst!
  ret i8 %1, !dbg !109
 i1 (Exception)
  from /crystal/src/range.cr:450:9 in 'finish'
  from /crystal/src/compiler/crystal/codegen/codegen.cr:71:7 in 'codegen'
  from /crystal/src/compiler/crystal/compiler.cr:162:16 in 'compile'
  from /crystal/src/compiler/crystal/command/spec.cr:98:14 in 'spec'
  from /crystal/src/hash.cr:908:11 in '__crystal_main'
  from /crystal/src/crystal/main.cr:115:5 in 'main'
  from src/env/__libc_start_main.c:95:2 in 'libc_start_main_stage2'

Error: you've found a bug in the Crystal compiler. Please open an issue, including source code that will allow us to reproduce the bug: https://github.com/crystal-lang/crystal/issues

```

## Comments

I guess it is naive to give an empty arguments list to `contain_exactly`
but the compiler should probably still handle the situation in a better
way ... ?


## Contributing

1. Fork it (<https://github.com/ya55en/return-type-mismatch-bug/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


## Contributors

- [Yassen Damyanov](https://github.com/ya55en)
