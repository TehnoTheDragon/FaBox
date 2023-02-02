local Vector2 = class "Vector2" {}

function Vector2:_init(...)
    local args = {...}
    local argc = #args
    
    if argc == 1 then
        self.x = args[1]
        self.y = args[1]
    elseif argc == 2 then
        self.x = args[1]
        self.y = args[2]
    end
end

function Vector2:__add(value)
    if type(value) == "number" then
        self.x = self.x + value
        self.y = self.y + value
    else
        self.x = self.x + value.x
        self.y = self.y + value.y
    end
end

function Vector2:__sub(value)
    if type(value) == "number" then
        self.x = self.x - value
        self.y = self.y - value
    else
        self.x = self.x - value.x
        self.y = self.y - value.y
    end
end

function Vector2:__mul(value)
    if type(value) == "number" then
        self.x = self.x * value
        self.y = self.y * value
    else
        self.x = self.x * value.x
        self.y = self.y * value.y
    end
end

function Vector2:__div(value)
    if type(value) == "number" then
        self.x = self.x / value
        self.y = self.y / value
    else
        self.x = self.x / value.x
        self.y = self.y / value.y
    end
end

function Vector2:__pow(value)
    if type(value) == "number" then
        self.x = self.x ^ value
        self.y = self.y ^ value
    else
        self.x = self.x ^ value.x
        self.y = self.y ^ value.y
    end
end

function Vector2:__tostring()
    return ("%.f, %.f"):format(self.x, self.y)
end

function Vector2:__eq(value)
    return self.x == value.x and self.y == value.y
end

function Vector2:__lt(value)
    return self.x < value.x and self.y < value.y
end

function Vector2:__le(value)
    return self.x <= value.x and self.y <= value.y
end

_G.Vector2 = Vector2