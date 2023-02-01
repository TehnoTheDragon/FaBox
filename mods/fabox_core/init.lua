fabox = {}

fabox.modname = minetest.get_current_modname
fabox.worldpath = minetest.get_worldpath
fabox.directory_list = minetest.get_dir_list

fabox.directories = function(path)
    return fabox.directory_list(path, true)
end

fabox.files = function(path)
    return fabox.directory_list(path, false)
end

fabox.modpath = function(modid)
    return minetest.get_modpath(modid or fabox.modname())
end

fabox.dofile = function(path)
    return dofile(("%s/%s"):format(fabox.modpath(), path))
end

fabox.dofile("vendors/class.lua")

fabox.loader = fabox.dofile("loader.lua")

local loader = fabox.loader()
loader:add(
    loader.print("YEEEESH", "x2023"),
    loader.save(_G),
    loader.path("src/test.lua")
)
loader:load()