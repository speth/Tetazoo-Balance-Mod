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
   local oldUIFile = UIFile
   function UIFile(filespec)
      for i, v in MyUnitIdTable do
         if string.find(filespec, v .. '_icon') then
            local curfile =  MyIconPath .. filespec
            if DiskGetFileInfo(curfile) then
               return curfile
            else
               WARN('Blueprint icon for unit '.. control.Data.id ..' could not be found, check your file path and icon names!')
            end
         end
      end
      return oldUIFile(filespec)
   end
end 