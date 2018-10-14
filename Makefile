TARGET = your_exe_name
RUN = ./$(TARGET)
SRC_DIR = src
BUILD_DIR = bin
CFLAGS = -std=c++11 -Wall -Wextra  #add more CompilerFLAGS as your project requires
LDFLAGS = # add libraries for your project here
LOADLIBS = # add library linker commands here (start with -l)
LDLIBS = # add library search paths here (start with -L)

# finds all your objects that corrispond to your .cpp files, system agnostic version
OBJECTS := $(patsubst $(SRC_DIR)/%.cpp, $(BUILD_DIR)/%.o, $(wildcard $(SRC_DIR)/*.cpp))

all: 
	mkdir -p $(BUILD_DIR)
	+$(MAKE) $(TARGET)

$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) $(CFLAGS) -o $@ $(LOADLIBS) $(LDFLAGS) $(LDLIBS)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) $(CFLAGS) -c $< -o $@ $(LOADLIBS) $(LDFLAGS) $(LDLIBS)

.PHONY: clean
clean:
	-rm -rf $(BUILD_DIR) $(TARGET)

.PHONY: run
run: 
	+$(MAKE) default
	$(RUN)

.PHONY: help
help:
	@echo "`make`       - builds/updates everything, is ready to run with `$(RUN)` after completion"
	@echo "`make clean` - removes object file folder and executable"
	@echo "`make run`   - builds/updates everything, runs immediately"
