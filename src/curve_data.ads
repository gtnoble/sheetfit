generic
   type Dependent_Variable is digits <>;
   type Independent_Component is digits <>;
   type Independent_Vector_Index_Type is range <>;
package Curve_Data is
   type Independent_Variable is
     array (Independent_Vector_Index_Type) of Independent_Component;

   type Point is record
      x : Independent_Variable;
      y : Dependent_Variable;
   end record;
   type Curve is array (Integer range <>) of Point;

   function Load_Data (Filename : String) return Curve;
end Curve_Data;
