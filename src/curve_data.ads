with Ada.Strings.Unbounded;
generic
   type Point is array ( Integer range <> ) of Float
package Curve_Data is
   type Curve is array( Natural range <> ) of Point;
   function Load_Data (Filename : Ada.Strings.Unbounded.Unbounded_String) return Curve;
end Curve_Data;