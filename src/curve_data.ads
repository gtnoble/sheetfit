generic
   type Dependent_Variable is digits <>;
   type Independent_Component is digits <>;
   type Independent_Variable is
     array (Natural) of Independent_Component;
package Curve_Data is

   type Point is record
      x : Independent_Variable;
      y : Dependent_Variable;
   end record;
   type Curve is array (Natural range <>) of Point;

   function Load_Data (Filename : String) return Curve;
end Curve_Data;
