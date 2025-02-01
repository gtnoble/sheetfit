with Curve_Data;
with gsl_gsl_multifit_nlinear_h; use gsl_gsl_multifit_nlinear_h;
with stddef_h;
generic
   with package Curve is new Curve_Data (<>);
package Nonlinear_Least_Squares is

   type Function_Parameters is array (Natural range <>) of Float;
   type Fit_Function is access function (Point: Curve.Point; Parameters : Parameters) return Float;
   
   function Fit (Curve : Curve.Curve; Fitted_Function : Fit_Function; Initial_Guess : Function_Parameters) return Function_Parameters;
end Nonlinear_Least_Squares;