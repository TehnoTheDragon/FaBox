local Vector3 = class "Vector3" {}

function Vector3:_init(...)
    local args = {...}
    local argc = #args
    
    if argc == 1 then
        self.x = args[1]
        self.y = args[1]
        self.z = args[1]
    elseif argc == 3 then
        self.x = args[1]
        self.y = args[2]
        self.z = args[3]
    end
end

function Vector3:__add(value)
    if type(value) == "number" then
        self.x = self.x + value
        self.y = self.y + value
        self.z = self.z + value
    else
        self.x = self.x + value.x
        self.y = self.y + value.y
        self.z = self.z + value.z
    end
end

function Vector3:__sub(value)
    if type(value) == "number" then
        self.x = self.x - value
        self.y = self.y - value
        self.z = self.z - value
    else
        self.x = self.x - value.x
        self.y = self.y - value.y
        self.z = self.z - value.z
    end
end

function Vector3:__mul(value)
    if type(value) == "number" then
        self.x = self.x * value
        self.y = self.y * value
        self.z = self.z * value
    else
        self.x = self.x * value.x
        self.y = self.y * value.y
        self.z = self.z * value.z
    end
end

function Vector3:__div(value)
    if type(value) == "number" then
        self.x = self.x / value
        self.y = self.y / value
        self.z = self.z / value
    else
        self.x = self.x / value.x
        self.y = self.y / value.y
        self.z = self.z / value.z
    end
end

function Vector3:__pow(value)
    if type(value) == "number" then
        self.x = self.x ^ value
        self.y = self.y ^ value
        self.z = self.z ^ value
    else
        self.x = self.x ^ value.x
        self.y = self.y ^ value.y
        self.z = self.z ^ value.z
    end
end

function Vector3:__tostring()
    return ("%.f, %.f, %.f"):format(self.x, self.y, self.z)
end

function Vector3:__eq(value)
    return self.x == value.x and self.y == value.y and self.z == value.z
end

function Vector3:__lt(value)
    return self.x < value.x and self.y < value.y and self.z < value.z
end

function Vector3:__le(value)
    return self.x <= value.x and self.y <= value.y and self.z <= value.z
end

_G.Vector3 = Vector3