with Ada.Text_IO; use Ada.Text_IO;
with Reactor_Core; use Reactor_Core;
with Comms_Relay; use Comms_Relay;
with Ballistics; use Ballistics;
with Fire_Control; use Fire_Control;

procedure Dsor is
   Core : Power_Grid := (core_temp => 4200,
                        output_mw => 100.45 ,
                        is_stable => True);

   Communication : Signal := (destination  => "Mars Base Alpha",
                                encryption   => "AES25",
                                power_source => Core);
   
   -- High kinetic energy (approx 11,250,000 Joules)
   Heavy_Sabot : Projectile := (payload_name => "APFSDS-T  ", 
                                mass_kg      => 10.0, 
                                velocity_mps => 1500.0);
                                
   -- Low kinetic energy (approx 200,000 Joules)
   Light_Shell : Projectile := (payload_name => "HE-FRAG   ", 
                                mass_kg      => 2.5, 
                                velocity_mps => 400.0);

   -- [ ENEMY PROFILES ]
   Heavy_Bunker  : Target := (designation  => "Command Node   ", 
                              armor_rating => 10000000.0);
                              
   Light_Vehicle : Target := (designation  => "Scout Rover    ", 
                              armor_rating => 150000.0);
begin
   Put_Line ("========================================");
   Put_Line ("[ UPLINK ESTABLISHED: SYSTEM ONLINE ]");
   Put_Line ("========================================");
   
   Comms_Relay.Broadcast_Signal (Communication);

   Fire_Control.Engage_Target (Shell => Heavy_Sabot,
                                 Enemy => Heavy_Bunker,
                                 Auth_Code => "GHOST-ACTUAL");

   Fire_Control.Engage_Target (Shell => Light_Shell,
                                 Enemy => Light_Vehicle,
                                 Auth_Code => "GHOST-ACTUAL");

   Fire_Control.Engage_Target (Shell => Light_Shell,
                                 Enemy => Heavy_Bunker,
                                 Auth_Code => "GHOST-ACTUAL");
   
   Fire_Control.Engage_Target (Shell => Heavy_Sabot,
                                 Enemy => Light_Vehicle,
                                 Auth_Code => "ROGUE-ACTUAL");
end Dsor;
