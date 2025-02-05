with Curve_Data;
with gsl_gsl_multifit_nlinear_h; use gsl_gsl_multifit_nlinear_h;
with gsl_gsl_vector_double_h;    use gsl_gsl_vector_double_h;
with stddef_h;
with Interfaces.C;               use Interfaces.C;
with System;
generic
   with package Fitted_Curve is new Curve_Data (<>);
   type Independent_Variable_Type is access all gsl_vector;
   type Function_Parameters_Type is access all gsl_vector;
   type Objective_Function_Type is
     access function
       (X          : Fitted_Curve.Independent_Variable;
        Parameters : access constant gsl_vector)
        return double;
package Nonlinear_Least_Squares is
   
   type GSL_Context_Type is record
      Objective_Function : Objective_Function_Type;
      Curve : access constant Fitted_Curve.Curve;
   end record;

   procedure Fit
     (Curve           : access constant Fitted_Curve.Curve;
      Fitted_Function : Objective_Function_Type;
      Parameters   : Function_Parameters_Type);

private
   function GSL_Objective_Function (
      arg1 : access constant gsl_gsl_vector_double_h.gsl_vector; 
      arg2 : access System.Address;  
      arg3 : access gsl_gsl_vector_double_h.gsl_vector) return int 
      with Convention => C;
end Nonlinear_Least_Squares;
