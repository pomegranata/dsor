with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Reactor_Core; use Reactor_Core;

package body Comms_Relay is
   procedure Broadcast_Signal (Connection : Signal) is
   begin
      Put_Line ("Connected to destination: " & Connection.destination);
      Put_Line ("Encryption method: " & Connection.encryption);
      Put_Line ("Power core temperature: " & Integer'Image(Connection.power_source.core_temp));

      Put ("POWER CORE OUTPUT: ");
      Put (Item => Connection.power_source.output_mw, Fore => 4, Aft => 2, Exp => 0);
      Put_Line ("");
      Put_Line ("Power core stable? " & Boolean'Image(Connection.power_source.is_stable));

      if Reactor_Core.Check_Stability (Connection.power_source) then
         Put_Line ("Signal securely transmitted to " & Connection.destination);
      else
         Put_Line ("CRITICAL: Reactor unstable. Broadcast aborted.");
      end if;
   end Broadcast_Signal;  
end Comms_Relay;