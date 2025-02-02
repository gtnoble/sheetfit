with Curve_Data;
with gsl_gsl_multifit_nlinear_h; use gsl_gsl_multifit_nlinear_h;
with gsl_gsl_vector_double_h; use gsl_gsl_vector_double_h;
with stddef_h;
generic
   with package Curve is new Curve_Data (<>);
package Nonlinear_Least_Squares is

   type Function_Parameters is array (Natural range <>) of Float;
   type Fit_Function is access function (
      X: Curve.Independent_Variable; 
      Parameters : Function_Parameters) return Curve_Data.Dependent_Variable;
   
   function Fit (Curve : Curve.Curve; Fitted_Function : Fit_Function; Initial_Guess : Function_Parameters) return Function_Parameters;
   
private
   procedure Array_To_GSL_Vector (Float_Array : array (Integer range <>) of Float; Vector : access gsl_vector);
   function GSL_Vector_To_Array (Vector : access gsl_vector) return array (Natural range <>) of Float;
   function Execute_Fit (
      Initial_Guess : Function_Parameters; 
      Functions_Config : gsl_multifit_nlinear_fdf) return Function_Parameters;
end Nonlinear_Least_Squares;