with Ada.Strings.Unbounded;
generic
   type Dependent_Variable is digits <>;
   type Independent_Component is digits <>;
   type Independent_Variable is array ( Integer range <> ) of Independent_Component
package Curve_Data is
   type Point is record
      x : Independent_Variable;
      y : Dependent_Variable;
   end record;
   type Curve is array (Integer range <>) of Point;

   function Load_Data (Filename : Ada.Strings.Unbounded.Unbounded_String) return Curve;
end Curve_Data;