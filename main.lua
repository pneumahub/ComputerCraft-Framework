local framework = {};

framework.require = function(path)
    local h = http.get("https://raw.githubusercontent.com/pneumahub/ComputerCraft-Framework/main/"..path);
    if h==nil then return error("Failed to load "..path..": DOES NOT EXIST", 2) end
    local r = loadstring(h);
    return r and r(h) or error("Failed to load "..path..": DID NOT RETURN VALUE", 2);
end

return framework;
