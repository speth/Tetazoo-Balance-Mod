do
   local MyUnitIdTable = {
      'drb4301',

      'tab0301',
      'tab0302',
      'tab0303',
      'tab0201',
      'tab0202',
      'tab0203',

      'trb0301',
      'trb0302',
      'trb0303',
      'trb0201',
      'trb0202',
      'trb0203',

      'teb0301',
      'teb0302',
      'teb0303',
      'teb0201',
      'teb0202',
      'teb0203',

      'tsb0301',
      'tsb0302',
      'tsb0303',
      'tsb0201',
      'tsb0202',
      'tsb0203',

   }
   --unit icon must be in /icons/units/. Put the full path to the /icons/ folder in here - note no / on the end!
   local MyIconPath = "/mods/Tetazoo Balance Mod"

   local oldFileNameFn = GetUnitIconFileNames
   
   local function IsMyUnit(bpid)
      for i, v in MyUnitIdTable do
         if v == bpid then
            return true
         end
      end
      return false
   end
   
   function GetUnitIconFileNames(blueprint)
      if IsMyUnit(blueprint.Display.IconName) then
         local iconName = MyIconPath .. "/icons/units/" .. blueprint.Display.IconName .. "_icon.dds"
         local upIconName = MyIconPath .. "/icons/units/" .. blueprint.Display.IconName .. "_icon.dds"
         local downIconName = MyIconPath .. "/icons/units/" .. blueprint.Display.IconName .. "_icon.dds"
         local overIconName = MyIconPath .. "/icons/units/" .. blueprint.Display.IconName .. "_icon.dds"
         
         if DiskGetFileInfo(iconName) == false then
            WARN('Blueprint icon for unit '.. blueprint.Display.IconName ..' could not be found, check your file path and icon names!')
            iconName = '/textures/ui/common/icons/units/default_icon.dds'
            upIconName = '/textures/ui/common/icons/units/default_icon.dds'
            downIconName = '/textures/ui/common/icons/units/default_icon.dds'
            overIconName = '/textures/ui/common/icons/units/default_icon.dds'
         end
         return iconName, upIconName, downIconName, overIconName
      else
         return oldFileNameFn(blueprint)
      end
   end
end