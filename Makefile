TARGET = your_exe_name
RUN = ./$(TARGET)
SRC_DIR = src
BUILD_DIR = bin
CFLAGS = -std=c++11 -Wall -Wextra  #add more CompilerFLAGS as your project requires
LDFLAGS = # add libraries for your project here
LOADLIBS = # add library linker commands here (start with -l)
LDLIBS = # add library search paths here (start with -L)

# not all computers will have the same 'find'
# SOURCES := $(shell find $(SRC_DIR) -name '*.cpp')
# OBJECTS := $(addprefix $(BUILD_DIR)/, $(SOURCES:$(SRC_DIR)/%.cpp=%.o))

# this is a more reliable way to find all objects across systems
OBJECTS := $(patsubst $(SRC_DIR)/%.cpp, $(BUILD_DIR)/%.o, $(wildcard $(SRC_DIR)/*.cpp))


default: 
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
	@echo "`make`       - builds/updates everything, is ready to run with `./$(TARGET)` after completion"
	@echo "`make clean` - removes object file folder and executable"
	@echo "`make run`   - builds/updates everything, runs immediately"
