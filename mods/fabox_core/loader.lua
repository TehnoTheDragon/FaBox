local OBJECT_TYPE = {
    PATHS = 0,
    SET_RELATIVE = 1,
    PATH = 2,
    SAVE_IN = 3,
    PRINT = 4,
}

local function extractNameFromPath(path)
    local name = ""
    for i = path:len(), 1, -1 do
        local char = path:sub(i, i)
        if char == '/' or char == '\\' then
            break
        else
            name = name .. char
        end
    end

    -- removes extension name
    path = name
    name = ""
    for i = path:len(), 1, -1 do
        local char = path:sub(i, i)
        if char == '.' then
            break
        else
            name = name .. char
        end
    end
    return name
end

local loader = class "Fabox-Loader" {}

function loader.paths(...)
    return {type = OBJECT_TYPE.PATHS, value = {...}}
end

function loader.relative(path)
    return {type = OBJECT_TYPE.SET_RELATIVE, value = path}
end

function loader.path(path)
    return {type = OBJECT_TYPE.PATH, value = path}
end

function loader.save(table)
    return {type = OBJECT_TYPE.SAVE_IN, value = table}
end

function loader.print(...)
    return {type = OBJECT_TYPE.PRINT, value = table.concat({...}, " ")}
end

function loader:_init()
    self._list = {}
end

function loader:add(object, ...)
    table.insert(self._list, object)

    local _next = {...}
    if #_next > 0 then
        for _, object in pairs(_next) do
            table.insert(self._list, object)
        end
    end
end

function loader:load()
    local currentRelative = ""
    local saveIn = nil

    local function action(type, value)
        if type == OBJECT_TYPE.PATHS then
            for idx, object in pairs(value) do
                action(object.type, object.value)
            end
        elseif type == OBJECT_TYPE.SET_RELATIVE then
            currentRelative = value
        elseif type == OBJECT_TYPE.PATH then
            local newPath = ("%s/%s"):format(currentRelative, value)
            local returnedValue = fabox.dofile(newPath)
            if saveIn == nil and returnedValue ~= nil then
                minetest.log(("[Loader]: %s returned value but not saved!"):format(newPath))
            elseif saveIn ~= nil then
                saveIn[extractNameFromPath(newPath)] = returnedValue
            end
        elseif type == OBJECT_TYPE.SAVE_IN then
            saveIn = value
        elseif type == OBJECT_TYPE.PRINT then
            minetest.log(("[%s]: %s"):format("Loader", value))
        end
    end

    for idx, object in pairs(self._list) do
        action(object.type, object.value)
    end
end

return loader