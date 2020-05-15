# Xcode compile time optimization
---
Steps
PreProcessor -> Compiler -> Assembler -> Linker -> Loader

Pre processor - Discovers dependencies, expand macros  etc
Compiler - Code into machine code
Assembler - produces Mach-O file
Linker - Object Files + dylib, .a , .tbd => Single Executable file
Loader - bring the program into memory
----
## Compilation Mode
Debug Configuration — Incremental Mode (The driver divides the work it has to do between multiple frontend processes), 
Release Configuration — Whole Module (Driver dispatches to single block of code)

## Optimization Mode
-Onone stands for No optimization, -Osize stands for Optimized for Size, -O stands for Optimized for Speed.

##Simplify expressions taking long time
-Xfrontend -warn-long-expression-type-checking=100

## Remove dSYM file from Debug
Debug Information Format
DWARF, Release Configuration DWARF with dSYM file

## Final classes
## Remove warnings in the app


##Run script:
Make sure that run scripts run only on first time

Small change in function does not rerun the dependent files
Adding new file or function rebuilds dependent file
Any change in dependent framework, rebuilds everything 

