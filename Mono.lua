--
-- Main Premake5 file for building Mono project.
-- Copyright (c) 2020-2022 by Danil (Kenny) Dukhovenko, All rights reserved.
-- 
-- mono-2.0-sgen.dll can be found in MonoSDK or in Force binaries.
--

-- Mono C++ Project
project "Mono"
	kind          "StaticLib"
	language      "C++"
	cppdialect    "C++11"
	staticruntime "on"
	targetdir     ("%{ForceDir.BinLib}/" .. BuildDir .. "/%{prj.name}")
	objdir        ("%{ForceDir.BinLib}/" .. BuildDir .. "/%{prj.name}")

	files {
		"include/mono-2.0/mono/**.h"
	}

	includedirs {
		"include/mono-2.0"
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