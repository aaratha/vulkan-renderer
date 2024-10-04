#!/usr/bin/env sh

/Users/aaratha/VulkanSDK/1.3.290.0/macos/bin/glslc shaders/simple_shader.vert -o shaders/simple_shader.vert.spv
/Users/aaratha/VulkanSDK/1.3.290.0/macos/bin/glslc shaders/simple_shader.frag -o shaders/simple_shader.frag.spv

make && ./a.out
