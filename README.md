# best_makefile_for_cpp

### This Makefile is for a project folder structure with the following criteria:

* `src` folder is on the root directory and holds all your `.cpp` files
* `Makefile` is on the root directory

### What happens when I run `make`?

* Your `.cpp` files in the `src` directory are built into object files and placed in a new folder on the root directory called `bin`
* Those objects are used to create your executable on the root directory

### What happens when I run `make clean`?

* The `bin` folder is deleted and the executable is deleted

### Limitations

* Does not check header files - run `make clean && make` if you've updated a header file with any significant changes
