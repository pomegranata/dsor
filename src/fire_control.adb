with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
package body Fire_Control is
   procedure Engage_Target (Shell : Projectile;
                              Enemy : Target; Auth_Code : String) is
   kinetic_energy : Float := 0.0;
   begin
      Put_Line (" ");
      Put_Line ("========================================");
      Put_Line ("[ ENGAGEMENT SEQUENCE ]");
      Put_Line ("========================================");

      Put_Line ("PAYLOAD NAME:        " & Shell.payload_name);

      Put ("PAYLOAD MASS:      ");
      Put (Item => Shell.mass_kg, Fore => 4, Aft => 2, Exp => 0);
      Put_Line (" kg.");

      Put ("PAYLOAD VELOCITY:    ");
      Put (Item => Shell.velocity_mps, Fore => 4, Aft => 2, Exp => 0);
      Put_Line (" m/s.");

      Put_Line ("ENEMY DESIGNATION:   " & Enemy.designation);

      begin
         Put_Line ("----------------------------------------");
         Put_Line ("[ AUTHENTICATION PROTOCOL ]");
         Put_Line ("----------------------------------------");

         kinetic_energy := Ballistics.Calculate_Energy (Shell);

         if Auth_Code = "GHOST-ACTUAL" then
            Put_Line ("AUTHORITY: " & Auth_Code);
            Put_Line ("Valid authorization. Firing sequence unlocked.");

            Put_Line ("----------------------------------------");
            Put_Line ("[ COMBAT LOG ]");

            Put ("MISSILE KINETIC ENERGY: ");
            Put (Item => kinetic_energy, Fore => 4, Aft => 2, Exp => 0);
            Put_Line (" Joules.");

            Put ("ENEMY ARMOR RATING: ");
            Put (Item => Enemy.armor_rating, Fore => 4, Aft => 2, Exp => 0);
            Put_Line (" Armor");

            if kinetic_energy > Enemy.armor_rating then
               Put_Line ("Missile kinetic energy is " &
                           "above the target's armor.");
               Put_Line ("Armor pierced. Target destroyed.");
            else
               Put_Line ("Missile kinetic energy is " &
                           "below the target's armor.");
               Put_Line ("Impact failed. Armor held");
            end if;
         else
            Put_Line ("AUTHORITY: " & Auth_Code);
            Put_Line ("ERROR: Invalid authorization. Firing sequence locked");
         end if;
      end;
      Put_Line ("========================================");
   end Engage_Target;
end Fire_Control;