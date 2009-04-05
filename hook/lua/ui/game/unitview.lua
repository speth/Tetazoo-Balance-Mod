do
    local oldUpdateWindow = UpdateWindow
    function UpdateWindow(info)
        oldUpdateWindow(info)
        local bp = __blueprints[info.blueprintId]
        if bp and bp.BuildIcon then
            controls.icon:SetTexture(bp.BuildIcon)
      end
   end
end
