--
-- Main Premake5 file for building Mono project.
-- Copyright (c) 2020-2024 by Danil (Kenny) Dukhovenko, All rights reserved.
-- 
-- Requirement:
--  - ForceEngine.lua
--  - Mono clonned in ForceDeb/Mono. Use SetupMono.bat for that from ForceDev/Scripts folder.
--
-- mono-2.0-sgen.dll can be found in MonoSDK or in Force binaries.
--
-- NOTE: This is thunk library, only with linkage .lib to MonoSDK. All source code contains in
-- ForceDev/Mono, etc.
-- Read more in ForceEngine.lua::About __NULL_IMPORT_DESCRIPTOR why i made this dicision.
--

-- Mono C++ Project
project "Mono"
	kind          "StaticLib"
	language      "C++"
	cppdialect    "C++11"
	staticruntime "on"
	targetdir     ("%{ForceDir.BinLib}/" .. BuildDir .. "/%{prj.name}/Lib")
	objdir        ("%{ForceDir.BinLib}/" .. BuildDir .. "/%{prj.name}/Obj")

	files {
		"%{IncludeDir.Mono}/**.h",
		"src/**.cpp"
	}

	includedirs {
		"%{IncludeDir.Vulkan}"
	}

	filter "system:windows" 
		systemversion "latest"

	filter "configurations:Debug" 
		runtime "Debug"
		symbols "on"
		links {
			"%{Library.Dbg.Mono}"
		}

	filter "configurations:Release" 
		runtime  "Release"
		optimize "on"
		links {
			"%{Library.Rel.Mono}"
		}