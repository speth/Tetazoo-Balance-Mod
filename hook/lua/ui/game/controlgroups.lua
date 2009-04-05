do
    GetModByName = function( name )
        for i, mod in __active_mods do
            if name==mod.name then
                return mod
            end
        end
    end

    function OnSelectionSetChanged(name, units, applied)
        if not validGroups[name] then return end
        local function CreateGroup(units, label)
            local bg = Bitmap(controls.container, UIUtil.SkinnableFile('/game/avatar/avatar-control-group_bmp.dds'))
            
            bg.icon = Bitmap(bg)
            bg.icon.Width:Set(28)
            bg.icon.Height:Set(20)
            LayoutHelpers.AtCenterIn(bg.icon, bg, 0, -4)
            
            bg.label = UIUtil.CreateText(bg.icon, label, 18, UIUtil.bodyFont)
            bg.label:SetColor('ffffffff')
            bg.label:SetDropShadow(true)
            LayoutHelpers.AtRightIn(bg.label, bg.icon)
            LayoutHelpers.AtBottomIn(bg.label, bg, 5)
            
            bg.icon:DisableHitTest()
            bg.label:DisableHitTest()
            
            bg.units = units
            
            bg.UpdateGroup = function(self)
                self.units = ValidateUnitsList(self.units)
                
                if table.getsize(self.units) > 0 then
                    local sortedUnits = {}
                    sortedUnits[1] = EntityCategoryFilterDown(categories.COMMAND, self.units)
                    sortedUnits[2] = EntityCategoryFilterDown(categories.EXPERIMENTAL, self.units)
                    sortedUnits[3] = EntityCategoryFilterDown(categories.TECH3 - categories.FACTORY, self.units)
                    sortedUnits[4] = EntityCategoryFilterDown(categories.TECH2 - categories.FACTORY, self.units)
                    sortedUnits[5] = EntityCategoryFilterDown(categories.TECH1 - categories.FACTORY, self.units)
                    sortedUnits[6] = EntityCategoryFilterDown(categories.FACTORY, self.units)
                    
                    local iconID = ''
                    for _, unitTable in sortedUnits do
                        if table.getn(unitTable) > 0 then
                            iconID = unitTable[1]:GetBlueprint().BlueprintId
                            break
                        end
                    end
                    
                    local NewTextureDir = GetModByName("Tetazoo Balance Mod").location
                    if not NewTextureDir then
                        NewTextureDir = GetModByName("DEV Tetazoo Balance Mod DEV").location
                    end

                    if iconID != '' and DiskGetFileInfo('/textures/ui/common/icons/units/'..iconID..'_icon.dds') then
                        self.icon:SetTexture('/textures/ui/common/icons/units/'..iconID..'_icon.dds')
                    elseif iconID != '' and NewTextureDir and DiskGetFileInfo(NewTextureDir ..'/textures/ui/common/icons/units/'..iconID..'_icon.dds') then
                        self.icon:SetTexture(NewTextureDir..'/textures/ui/common/icons/units/'..iconID..'_icon.dds')
                    else
                        self.icon:SetTexture('/textures/ui/common/icons/units/default_icon.dds')
                    end
                else
                    self:Destroy()
                    controls.groups[self.name] = nil
                end
            end
            bg.name = label
            bg.HandleEvent = function(self,event)
                if event.Type == 'ButtonPress' or event.Type == 'ButtonDClick' then
                    if event.Modifiers.Shift and event.Modifiers.Ctrl then
                        Selection.FactorySelection(self.name)
                    elseif event.Modifiers.Shift then
                        Selection.AppendSetToSelection(self.name)
                    else
                        Selection.ApplySelectionSet(self.name)
                    end
                end
            end
            
            bg:UpdateGroup()
            
            return bg
        end
        if not controls.groups[name] and units then
            PlaySound(Sound({Bank = 'Interface', Cue = 'UI_Economy_Click'}))
            controls.groups[name] = CreateGroup(units, name)
            local unitIDs = {}
            for _, unit in units do
                table.insert(unitIDs, unit:GetEntityId())
            end
            SimCallback({Func = 'OnControlGroupAssign', Args = unitIDs})
        elseif controls.groups[name] and not units then
            controls.groups[name]:Destroy()
            controls.groups[name] = nil
        elseif controls.groups[name] then
            controls.groups[name].units = units
            controls.groups[name]:UpdateGroup()
            local unitIDs = {}
            for _, unit in units do
                table.insert(unitIDs, unit:GetEntityId())
            end        
            SimCallback({Func = 'OnControlGroupAssign', Args = unitIDs})
        end
        import(UIUtil.GetLayoutFilename('controlgroups')).LayoutGroups()
    end
    




end