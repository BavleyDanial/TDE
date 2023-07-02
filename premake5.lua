workspace "TDE"
	architecture "x64"
	startproject "DunnSandbox"

	configurations
	{
		"Debug",
		"Release"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "DunnEngine"
	location "DunnEngine"
	kind "StaticLib"
	language "C++"
	targetdir ("Bin/" .. outputdir .. "/%{prj.name}")
	objdir ("BinInt/" .. outputdir .. "/%{prj.name}")
	defines "SFML_STATIC"

	files
	{
		"%{prj.name}/Source/**.h",
		"%{prj.name}/Source/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/Source",
		"%{prj.name}/Vendor/spdlog/include",
        "%{prj.name}/Vendor/SFML/include"
	}

	libdirs {"DunnEngine/Vendor/SFML/lib" }

	filter "system:windows"
		cppdialect "C++17"
		systemversion "latest"
		filter "configurations:Debug"
		defines "DE_DEBUG"
		runtime "Debug"
		symbols "On"
		
		links
		{
			"sfml-graphics-s-d.lib",
			"opengl32.lib",
			"freetype.lib",
			"sfml-window-s-d.lib",
			"winmm.lib",
			"gdi32.lib",
			"sfml-audio-s-d.lib",
			"flac.lib",
			"vorbisenc.lib",
			"vorbisfile.lib",
			"vorbis.lib",
			"ogg.lib",
			"sfml-system-s-d.lib"
		}
	filter "configurations:Release"
		defines "DE_RELEASE"
		runtime "Release"
		optimize "On"

		links
		{
			"sfml-graphics-s.lib",
			"opengl32.lib",
			"freetype.lib",
			"sfml-window-s.lib",
			"winmm.lib",
			"gdi32.lib",
			"sfml-audio-s.lib",
			"flac.lib",
			"vorbisenc.lib",
			"vorbisfile.lib",
			"vorbis.lib",
			"ogg.lib",
			"sfml-system-s.lib"
		}
project "DunnSandbox"
	location "DunnSandbox"
	kind "ConsoleApp"
	language "C++"
	targetdir ("Bin/" .. outputdir .. "/%{prj.name}")
	objdir ("BinInt/" .. outputdir .. "/%{prj.name}")
	defines "SFML_STATIC"
	files
	{
		"%{prj.name}/Source/**.h",
		"%{prj.name}/Source/**.cpp"
	}
	includedirs
	{
		"DunnEngine/Vendor/spdlog/include",
        "DunnEngine/Vendor/SFML/include",
		"DunnEngine/Source"
	}
	libdirs { "SFML", "DunnEngine/Vendor/SFML/lib" }

	filter "system:windows"
		cppdialect "C++17"
		systemversion "latest"
	filter "configurations:Debug"
		defines "DE_DEBUG"
		runtime "Debug"
		symbols "On"
		links
		{
			"DunnEngine",
			"sfml-graphics-s-d.lib",
			"opengl32.lib",
			"freetype.lib",
			"sfml-window-s-d.lib",
			"winmm.lib",
			"gdi32.lib",
			"sfml-audio-s-d.lib",
			"flac.lib",
			"vorbisenc.lib",
			"vorbisfile.lib",
			"vorbis.lib",
			"ogg.lib",
			"sfml-system-s-d.lib"
		}
	filter "configurations:Release"
		defines "DE_RELEASE"
		runtime "Release"
		optimize "On"
		links
		{
			"DunnEngine",
			"sfml-graphics-s.lib",
			"opengl32.lib",
			"freetype.lib",
			"sfml-window-s.lib",
			"winmm.lib",
			"gdi32.lib",
			"sfml-audio-s.lib",
			"flac.lib",
			"vorbisenc.lib",
			"vorbisfile.lib",
			"vorbis.lib",
			"ogg.lib",
			"sfml-system-s.lib"
		}