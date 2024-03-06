workspace "OpenGL"
	configurations { "Debug", "Release" }

project "OpenGL"
	kind "ConsoleApp"
	language "C++"

	targetdir "target/%{cfg.system}/%{cfg.buildcfg}"
	objdir "target/%{cfg.system}/%{cfg.buildcfg}/obj"

	files {
		"src/**.h",
		"src/**.cpp",
		"deps/glad/src/glad.c",
	}

	includedirs {
		"deps/glad/include",
	}

	filter { "system:linux" }
		links { "glfw" }
	filter { "system:windows" }
		-- TODO: Link pre-built binaries
		-- TODO: Add GLFW include dirs
	filter {  }

	filter { "configurations:Debug" }
		defines { "DEBUG" }
		symbols "On"
	filter { "configurations:Release" }
		defines { "NDEBUG" }
		optimize "On"
	filter {  }
