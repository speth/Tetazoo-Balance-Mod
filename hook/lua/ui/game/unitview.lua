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
   
   local function IsMyUnit(bpid)
      for i, v in MyUnitIdTable do
         if v == bpid then
            return true
         end
      end
      return false
   end
   
   local oldUpdateWindow = UpdateWindow
   function UpdateWindow(info)
      oldUpdateWindow(info)
      if IsMyUnit(info.blueprintId) and DiskGetFileInfo(MyIconPath .. '/icons/units/' .. info.blueprintId.. '_icon.dds') then
         controls.icon:SetTexture(MyIconPath .. '/icons/units/' .. info.blueprintId .. '_icon.dds')
      end
   end
end