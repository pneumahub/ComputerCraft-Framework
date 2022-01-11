local framework = {};

framework.require = function(path)
    local r = loadstring(http.get("https://raw.githubusercontent.com/pneumahub/ComputerCraft-Framework/"..path).readAll());
    return r and r() or error("Failed to load "..path);
end

return framework;
