--- RLS: Mod to load build pictures for custom units (relies on chages to Blueprints.lua)
do
	local oldUIFile = UIFile
	function UIFile(filespec)
        if filespec and filespec:sub(1,12) == "/icons/units" and filespec:sub(-9) == "_icon.dds" then
            local bp = __blueprints[filespec:sub(14,-10)]
                if bp and bp.BuildIcon then
                    return bp.BuildIcon
                end
        end
        return oldUIFile(filespec)
    end
   
end
