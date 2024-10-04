# Vulkan SDK path
VULKAN_SDK = /Users/aaratha/VulkanSDK/1.3.290.0/macos

# Compiler
CXX = clang++

# Include directories
INCLUDES = -I. -I$(VULKAN_SDK)/include -I/opt/homebrew/include

# Library directories
LIBDIRS = -L$(VULKAN_SDK)/lib -L/opt/homebrew/lib

# Compiler flags
CXXFLAGS = -std=c++17 $(INCLUDES)

# Linker flags (including GLFW and Vulkan)
# Added explicit RPATH setting for both Vulkan SDK lib directory
LDFLAGS = $(LIBDIRS) `pkg-config --static --libs glfw3` -lvulkan \
          -Wl,-rpath,$(VULKAN_SDK)/lib

# Source files
SRCS = main.cpp

# Output executable
TARGET = a.out

# Vulkan-specific environment variables
VULKAN_ENV_VARS = \
	export VULKAN_SDK=$(VULKAN_SDK) && \
	export PATH=$(VULKAN_SDK)/bin:$$PATH && \
	export DYLD_LIBRARY_PATH=$(VULKAN_SDK)/lib:$$DYLD_LIBRARY_PATH && \
	export VK_ICD_FILENAMES=$(VULKAN_SDK)/share/vulkan/icd.d/MoltenVK_icd.json && \
	export VK_LAYER_PATH=$(VULKAN_SDK)/share/vulkan/explicit_layer.d

# Build target
all: clean $(TARGET)

$(TARGET): $(SRCS)
	$(VULKAN_ENV_VARS) && $(CXX) $(CXXFLAGS) -o $(TARGET) $(SRCS) $(LDFLAGS)

# Run the application
run: $(TARGET)
	$(VULKAN_ENV_VARS) && ./$(TARGET)

# Clean up
clean:
	rm -f $(TARGET)
