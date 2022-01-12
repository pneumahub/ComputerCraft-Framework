local framework = {};

framework.require = function(path)
    local h = http.get("https://raw.githubusercontent.com/pneumahub/ComputerCraft-Framework/main/"..path);
    if h==nil then return error("Failed to load "..path..": DOES NOT EXIST", 2) end
    local r = loadstring();
    return r and r(h) or error("Failed to load "..path..": DID NOT RETURN VALUE", 2);
end

framework.find = function(self, searching)
    for i, v in pairs(self) do
        if v==searching then
            return i;
        end
    end
end

framework.split = function(self, seperator)
    local returning = {};
    local len = string.len(self);
    local tracking = '';
    for i = 1, len do
        local v = string.sub(self, i, i);

        if v == seperator then
            table.insert(returning, tracking);
            tracking = '';
        else
            tracking = tracking .. v;
            if i == len then
                table.insert(returning, tracking);
            end
        end
    end
    return returning;
end

framework.object = framework.require("object.lua");

return framework;
