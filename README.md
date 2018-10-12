# best_makefile_for_cpp

*Works great for about any cpp project*

### Default use folder structure
  * `project_root/`
    * `src/`
    * `Makefile`
    * `otherfiles`

### What happens when I run `make`?

1. creates `bin/` folder at project root
2. `.cpp` files located in `project_root/src/` are built into `.o` files and placed in `bin/`
3. `.o` files are linked together make your execuatable at project root

### What happens when I run `make clean`?

* The `bin` folder is deleted and the executable is deleted

### Limitations

* Does not check header files - run `make clean && make` if you've updated a header file with any significant changes

### Other

* `make help` - shows help menu (you probably wont need it now that you read this)
* `make run` - updates binaries and executables as neccessary and starts your program
