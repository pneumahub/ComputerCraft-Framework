local framework = {};

framework.require = function(path)
    return loadstring(http.get("https://raw.githubusercontent.com/pneumahub/ComputerCraft-Framework/"..path))();
end

return framework;
