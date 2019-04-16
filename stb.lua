-- scaffold geniefile for stb

stb_script = path.getabsolute(path.getdirectory(_SCRIPT))
stb_root = path.join(stb_script, "stb")

stb_includedirs = {
	path.join(stb_script, "config"),
	stb_root,
}

stb_libdirs = {}
stb_links = {}
stb_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { stb_includedirs }
	end,

	_add_defines = function()
		defines { stb_defines }
	end,

	_add_libdirs = function()
		libdirs { stb_libdirs }
	end,

	_add_external_links = function()
		links { stb_links }
	end,

	_add_self_links = function()
		links { "stb" }
	end,

	_create_projects = function()

project "stb"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		stb_includedirs,
	}

	defines {}

	files {
		path.join(stb_script, "config", "**.h"),
		path.join(stb_root, "**.h"),
		path.join(stb_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
