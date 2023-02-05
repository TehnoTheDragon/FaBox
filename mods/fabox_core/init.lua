fabox = {
    recipes = {};
    recipe_types = {};
}

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

fabox.name = function(name, namespace)
    return namespace == nil and ("%s:%s"):format(fabox.modname(), name) or ("%s:%s/%s"):format(fabox.modname(), namespace, name)
end

fabox.dofile("vendors/class.lua")

fabox.loader = fabox.dofile("loader.lua")

local loader = fabox.loader()
loader:add {
    loader.save(_G),
    loader.relative("src"),

    -- Math
    loader.path("vector2.lua"),
    loader.path("vector3.lua"),

    -- Minetest Wrapper
    loader.path("CraftItem.lua"),
    loader.path("RecipeType.lua"),
    loader.path("Node.lua"),
    loader.path("MapGen.lua"),

    -- Overrides
    loader.relative("src/overrides"),
    loader.path("builtin_item_entity.lua"),
    loader.path("hand.lua"),
}:load()