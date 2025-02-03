with Curve_Data;
with gsl_gsl_multifit_nlinear_h; use gsl_gsl_multifit_nlinear_h;
with gsl_gsl_vector_double_h;    use gsl_gsl_vector_double_h;
with stddef_h;
with Interfaces.C;               use Interfaces.C;
generic
   with package Fitted_Curve is new Curve_Data (<>);
   type Function_Parameter_Type is digits <>;
package Nonlinear_Least_Squares is

   type Real_Array_Type is array (Integer range <>) of double;

   type Function_Parameters is
     array (Natural range <>) of Function_Parameter_Type;
   type Fit_Function is
     access function
       (X          : Fitted_Curve.Independent_Variable;
        Parameters : Function_Parameters)
        return Fitted_Curve.Dependent_Variable;

   function Fit
     (Curve           : Fitted_Curve.Curve;
      Fitted_Function : access function
        (X          : Fitted_Curve.Independent_Variable;
         Parameters : Function_Parameters)
         return Fitted_Curve.Dependent_Variable;
      Initial_Guess   : Function_Parameters) return Function_Parameters;

private
   procedure Array_To_GSL_Vector
     (Float_Array : Real_Array_Type; Vector : access gsl_vector);
   function GSL_Vector_To_Array
     (Vector : access gsl_vector) return Real_Array_Type;
   function Execute_Fit
     (Initial_Guess    : Function_Parameters;
      Functions_Config : gsl_multifit_nlinear_fdf) return Function_Parameters;
end Nonlinear_Least_Squares;
