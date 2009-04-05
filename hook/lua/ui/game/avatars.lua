do
    TBM_oldCreateAvatar = CreateAvatar
    function CreateAvatar(unit)
        local bg = TBM_oldCreateAvatar(unit)
        if bg.Blueprint.BuildIcon then
            bg.icon:SetTexture(bg.Blueprint.BuildIcon)
        end

        return bg
    end
end
