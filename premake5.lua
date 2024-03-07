workspace "OpenGL"
	configurations { "Debug", "Release" }
	architecture "x86_64"

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
		"deps/glfw/include",	-- Only needed for Windows atm
	}

	filter { "system:linux" }
		links { "glfw" }
	filter { "system:windows" }
		-- TODO: Link pre-built binaries
		libdirs { "deps/glfw/lib/windows" }
		links { "glfw3.lib" }
	filter {  }

	filter { "configurations:Debug" }
		defines { "DEBUG" }
		symbols "On"
	filter { "configurations:Release" }
		defines { "NDEBUG" }
		optimize "On"
	filter {  }
