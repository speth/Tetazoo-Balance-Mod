do
    local oldFileNameFn = GetUnitIconFileNames

    function GetUnitIconFileNames(blueprint)
        if blueprint.BuildIcon then
            return blueprint.BuildIcon, blueprint.BuildIcon, blueprint.BuildIcon, blueprint.BuildIcon
        else
            return oldFileNameFn(blueprint)
        end
    end
end
