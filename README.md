# best_makefile_for_cpp

* best in my current opinion of building this, there is probably a better makefile but I like this because it keeps things simple and can work great for about any project *

### This Makefile is for a project folder structure with the following criteria:

* A `src` folder is on your project root directory and holds all your `.cpp` files
* This `Makefile` is on the root directory of your project

##### should look like this
  * project_folder/
    * src/
    * Makefile
    * anything_else

### What happens when I run `make`?

* Your `.cpp` files in the `src` directory are built into object files and placed in a new folder on the root directory called `bin`
* Those objects are used to create your executable on the root directory

### What happens when I run `make clean`?

* The `bin` folder is deleted and the executable is deleted

### Limitations

* Does not check header files - run `make clean && make` if you've updated a header file with any significant changes
