package Reactor_Core is
   type Power_Grid is record
      core_temp : Integer;
      output_mw : Float;
      is_stable : Boolean;
   end record;

   function Check_Stability (Stability : Power_Grid) return Boolean;
end Reactor_Core;