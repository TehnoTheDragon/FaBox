local CLASS_NOT_ALLOWED_TO_OVERRIDE = {
    "__index", "__newindex", "__type", "__name", "__extends"
}

local function create_object(class)
    local class_metatable = getmetatable(class)
    local extends = class_metatable.__extends

    local object_metatable = {
        __index = function(self, key)
            local value = rawget(class, key)
            if value == nil then
                for index, extend in pairs(extends) do
                    value = rawget(extend, key)
                    if value ~= nil then
                        break
                    end
                end
            end
            return value
        end,
        __name = class_metatable.__name,
        __type = "object",
        __tostring = function()
            return "object " .. class_metatable.__name
        end
    }
    for key, value in pairs(class_metatable) do
        if key:sub(1, 3) == "@__" then
            object_metatable[key:sub(2, -1)] = value
        end
    end

    local object = setmetatable({}, object_metatable)
    assert(object._init ~= nil, string.format("[%s] constructor is not defined!", tostring(class)))  
    return object
end

local function init_object(object, ...)
    return object:_init(...) or object
end

local function create_class(name, extends)
    return setmetatable({}, {
        __index = function(self, key)
            return rawget(self, key)
        end,
        __newindex = function(self, key, value)
            local is_metamethod = key:sub(1, 2) == "__"
            if is_metamethod then
                for _, not_allowed_name in pairs(CLASS_NOT_ALLOWED_TO_OVERRIDE) do
                    if key == not_allowed_name then
                        return
                    end
                end
                
                local class_metatable = getmetatable(self)
                rawset(class_metatable, "@" .. key, value)
                setmetatable(self, class_metatable)
            else
                rawset(self, key, value)
            end
        end,
        __extends = extends,
        __name = name,
        __type = "class",
        __tostring = function()
            return "class " .. name
        end,
        __call = function(self, ...)
			return init_object(create_object(self), ...)
		end
    })
end

local class = function(name)
    return function(extends)
        return create_class(name, extends)
    end
end

_G.class = class
return class