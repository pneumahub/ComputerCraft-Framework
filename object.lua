return function(internalTable)
    internalTable = internalTable or {};
    local interface = setmetatable(internalTable, {
        __index = function(self, index)
            local split = string.split(index, '');
            if self ~= internalTable and split[1] == '_' and split[2] == '_' then
                return
            end
            return rawget(internalTable, index).Value;
        end,
        __newindex = function(self, index, new)
            local split = string.split(index, '');
            if self[index] == nil then
                return error("Failed to assign "..tostring(new)..' to '..index..': MEMBER DOES NOT EXIST');
            end
            return rawget(internalTable, index);
        end
    });
    return interface, internalTable;
end
