local framework = {};

framework.require = function(path)
    local h = http.get("https://raw.githubusercontent.com/pneumahub/ComputerCraft-Framework/"..path);
    if h==nil then return error("Failed to load "..path..": DOES NOT EXIST", 2) end
    local r = loadstring();
    return r and r() or error("Failed to load "..path..": DID NOT RETURN VALUE", 2);
end

return framework;
