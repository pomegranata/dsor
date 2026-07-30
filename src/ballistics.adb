package body Ballistics is
   function Calculate_Energy (Missile : Projectile) return Float is
   begin
      return (0.5 * Missile.mass_kg * (Missile.velocity_mps * Missile.velocity_mps));
   end Calculate_Energy;
end Ballistics;