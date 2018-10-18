# the name of your executable
TARGET = change_me

# launches your target in terminal
RUN = ./$(TARGET)

# directory for your source files
SRC_DIR = src

# directory for your object files
BUILD_DIR = bin

# add more CompilerFLAGS as your project requires
CFLAGS = -std=c++11 -Wall -Wextra

# add libraries for your project here
LDFLAGS = 

# add library linker commands here (start with -l)
LOADLIBS = 

# add library search paths here (start with -L)
LDLIBS = 

# add include paths (start with -I)
INC = 

# finds all your objects that corrispond to your .cpp files, system agnostic version
OBJECTS := $(patsubst $(SRC_DIR)/%.cpp, $(BUILD_DIR)/%.o, $(wildcard $(SRC_DIR)/*.cpp))

.PHONY: all
# makes build directory, updates your objects, builds your executable
all: 
	mkdir -p $(BUILD_DIR)
	+$(MAKE) $(TARGET)

# updates your objects, builds your executable
$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) $(CFLAGS) -o $@ $(LOADLIBS) $(LDFLAGS) $(LDLIBS) $(INC)

# builds your objects
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) $(CFLAGS) -c $< -o $@ $(LOADLIBS) $(LDFLAGS) $(LDLIBS) $(INC)

# deletes your built objects and executable
.PHONY: clean
clean:
	-rm -rf $(BUILD_DIR) $(TARGET)

# makes build direcotry, updates your objects, builds your executable, launches your program
.PHONY: run
run: 
	+$(MAKE) all
	$(RUN)

# explains the only three options you should be using (unless you build more of your own)
.PHONY: help
help:
	@echo "`make`       - builds/updates everything, is ready to run with `$(RUN)` after completion"
	@echo "`make clean` - removes object file folder and executable"
	@echo "`make run`   - builds/updates everything, runs immediately"
