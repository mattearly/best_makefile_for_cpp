TARGET = your_exe_name
RUN = ./your_exe_name
SRC_DIR = src
BUILD_DIR = bin
CXXFLAGS = -std=c++11 -O2 -Wall -Wextra

# not all computers will have the same 'find'
# SOURCES := $(shell find $(SRC_DIR) -name '*.cpp')
# OBJECTS := $(addprefix $(BUILD_DIR)/, $(SOURCES:$(SRC_DIR)/%.cpp=%.o))

# this is a more reliable way to find all objects across systems
OBJECTS := $(patsubst $(SRC_DIR)/%.cpp, $(BUILD_DIR)/%.o, $(wildcard $(SRC_DIR)/*.cpp))


default: 
	mkdir -p $(BUILD_DIR)
	+$(MAKE) $(TARGET)

$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) $(CXXFLAGS) -o $(TARGET)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@ 

.PHONY: clean
clean:
	-rm -rf $(BUILD_DIR) $(TARGET)

.PHONY: run
run: 
	+$(MAKE) default
	$(RUN)

.PHONY: help
help:
	@echo \'make\' - builds/updates everything, is ready to run with \'./your_exe_name\' after completion
	@echo \'make clean\' - removes object file folder and executable
	@echo \'make run\' - builds/updates everything, runs immediately 
