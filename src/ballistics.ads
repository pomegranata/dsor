package Ballistics is
   
   type Projectile is record
      payload_name : String (1 .. 10);
      mass_kg : Float;
      velocity_mps : Float;
   end record;

   function Calculate_Energy (Missile : Projectile) return Float;
end Ballistics;