with Curve_Data;

package Diode is
   subtype Voltage is Float;
   subtype Current is Float;
   type Resistance is new Float range 0.0 .. Float'Safe_Last;

   type Diode is record
      Saturation_Current : Current;
      Ideality : Float;
      Series_Resistance : Resistance;
   end record;
   
   type Point_2D is array (Natural range <>) of Float;
   package Curve_2D is new Curve_Data (Point_2D);
   
   function Fit (IV_Curve_Filename : String; Initial_Estimate : Diode) return Diode;
   
   function Current (Diode : Diode; Voltage_Drop : Float) return Current;
end Diode;