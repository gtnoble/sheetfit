generic
   type X_Type is digits <>;
   type Y_Type is digits <>;
package Function_Roots is
   
   type Function_1D_Type is access function (X : X_Type) return Y_Type;
   subtype Sign_Type is Integer (-1 .. 1);
   
   function Find_Root (
      F : Function_1D_Type; 
      Bound_1 : X_Type; 
      Bound_2 : X_Type;
      Absolute_Tolerance : X_Type) return X_Type;
      
private
   function Sign (X : Y_Type) return Sign_Type;

end Function_Roots;