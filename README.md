# libasm
Small project to get familiar with x86_64 NASM assembly language. The compiler used is NASM.

## Functions

Functions are defined like labels but their declaration and utilisation are different from an Os to another. On OSX, you have to add an underscore in front of the function name.
> "Symbols shared between modules will be prefixed by underscores."

To define a function on OSX:
```nasm
global _my_func     ; Make function accessible on other files
section .text

_my_func:
    mov rax, 8
    ret
```

## Compilation and linking

You need two steps to get a binary from your NASM x64 code:
- Compilation
- Linking

Just replace elements within `<>` to make it works with your code and your machine!

### MacOs

```nasm
nasm -f macho64 <asm_file> -o <asm_file>.o
ld  -L <path_to_lib> -lSystem <asm_file>.o -o <bin_file>
./<bin_file>
```
> You can have library errors if you don't add `-L` / `-l` flags.

Exemple that works on my system:
```nasm
nasm -f macho64 hello_world.asm -o hello_world.o
ld hello_world.o -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem -o hello_world
./hello_world
```

Possible options for old macos versions :
- `-macosz_version_min <version>`
- `-no_pie`

### Debugging

You can generate debugging elements in your code to help you using a debugger by adding those flags:
- `-F dwarf`
- `-g`
> `-g` is automatically added in `2.03.01` version nasm and latter if `-F` is given.

Then launch a debugger:
```bash
lldb my_program
```
