with Ballistics; use Ballistics;

package Fire_Control is

   type Target is record
      designation : String (1 .. 15);
      armor_rating : Float;
   end record;

   procedure Engage_Target (Shell : Projectile; Enemy : Target; Auth_Code : String);
end Fire_Control;