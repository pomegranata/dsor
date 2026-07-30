package body Reactor_Core is
   function Check_Stability (Stability : Power_Grid) return Boolean is
   begin
      if Stability.core_temp < 5000 then
         return True;
      else
         return False;
      end if;
   end Check_Stability;
end Reactor_Core;