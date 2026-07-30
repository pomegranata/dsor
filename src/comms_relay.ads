with Reactor_Core; use Reactor_Core;

package Comms_Relay is
   type Signal is record
      destination : String (1 .. 15);
      encryption : String (1 .. 5);
      power_source : Power_Grid;
   end record;

   procedure Broadcast_Signal (Connection : Signal);
end Comms_Relay;