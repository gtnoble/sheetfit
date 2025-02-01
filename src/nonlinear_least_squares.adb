with gsl_gsl_vector_double_h; use gsl_gsl_vector_double_h;
with System;
package body Nonlinear_Least_Squares is
   function Fit (Curve: Curve.Curve; Fitted_Function : Fit_Function; Initial_Guess : Function_Parameters) return Function_Parameters is

      procedure f (input : access gsl_vector; params : System.Address;  output : access gsl_vector) with Convention => C is
      begin
      end f;

      fit_type : constant gsl_multifit_nlinear_type := gsl_multifit_nlinear_trust;
      fdf : gsl_multifit_nlinear_fdf;
      parameters : gsl_multifit_nlinear_parameters := gsl_multifit_nlinear_default_parameters;
      workspace : access gsl_multifit_nlinear_workspace := gsl_multifit_nlinear_alloc (
         T => fit_type, 
         params => fdf'Access, 
         n => stddef_h.size_t (Curve'Length), 
         p => stddef_h.size_t (Initial_Guess'Length));
   begin
   end Fit;
end Nonlinear_Least_Squares;