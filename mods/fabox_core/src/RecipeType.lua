local RecipeType = class "RecipeType" {}

function RecipeType:_init(type, pattern)
    type = fabox.name(type, "recipe_type")
    if fabox.recipe_types[type] then
        error(("Recipe Type \"%s\" already exist!"):format(type))
    end

    self._type = type
    self._pattern = pattern

    fabox.recipes[type] = {}
    fabox.recipe_types[type] = self
end

function RecipeType:validate(definition)
    local pattern = self._pattern

    for k, v in pairs(pattern) do
        if definition[k] == nil and v ~= "optional" then
            error(("Not all fields are presented. field \"%s\" is not presented"):format(k))
            return false
        end
    end

    for k, v in pairs(definition) do
        if pattern[k] == nil then
            error(("The definition has field which is not present in pattern. field name: \"%s\""):format(k))
            return false
        else
            local expectType = pattern[k]
            local actualType = type(v)
            local isValid = false
            local isMethod = false

            if type(expectType) ~= "function" then
                isValid = expectType == actualType or expectType == "optional"
            else
                isValid = expectType(v)
                isMethod = true
            end

            if not isValid then
                if isMethod then
                    error(("The definition field \"%s\" is invalid"):format(actualType, expectType))
                else
                    error(("The definition field \"%s\" type got, expected \"%s\""):format(actualType, expectType))
                end
                return false
            end
        end
    end

    return true
end

function RecipeType:register(definition)
    if self:validate(definition) then
        table.insert(fabox.recipes[self._type], definition)
    end
end

fabox.register_recipe = function(type, definition)
    local recipeType = fabox.recipe_types[type]
    assert(recipeType ~= nil, ("Recipe type \"%s\" does not exist!"):format(type))
    recipeType:register(definition)
end

fabox.get_recipes = function(type)
    local recipeType = fabox.recipe_types[type]
    assert(recipeType ~= nil, ("Recipe type \"%s\" does not exist!"):format(type))
    return fabox.recipes[type]
end

return RecipeType