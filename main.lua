local framework = {};

framework.require = function(path)
    local h = http.get("https://raw.githubusercontent.com/pneumahub/ComputerCraft-Framework/main/"..path);
    if h==nil then return error("Failed to load "..path..": DOES NOT EXIST", 2) end
    local r = loadstring();
    return r and r(h) or error("Failed to load "..path..": DID NOT RETURN VALUE", 2);
end

table.find = function(self, searching)
    for i, v in pairs(self) do
        if v==searching then
            return i;
        end
    end
end

string.split = function(self, start, finish, whitelist, blacklist)
    local returning = {};
    local len = string.len(self);
    for i = math.max(start or 1, 1), math.min(finish or len, len) do
        local v = string.sub(self, i, i);
        if 
            (whitelist and table.find(whitelist, v)) or
            (blacklist and not table.find(whitelist, v)) 
        then
            table.insert(returning, v);
        end
    end
    return returning;
end

framework.object = framework.require("object.lua");

return framework;
