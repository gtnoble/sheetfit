with gsl_gsl_vector_double_h; use gsl_gsl_vector_double_h;
with System;
with Interfaces.C; use Interfaces.C;
package body Nonlinear_Least_Squares is
   function Fit (Curve: Curve.Curve; Fitted_Function : Fit_Function; Initial_Guess : Function_Parameters) return Function_Parameters is
      fdf : aliased gsl_multifit_nlinear_fdf := (
         f => Objective_Function'Access,  
         df => null, 
         fvv => null, 
         n => stddef_h.size_t (Curve'Length), 
         p => stddef_h.size_t (Initial_Guess'Length), 
         params => null, 
         nevalf => 0, 
         nevaldf => 0, 
         nevalfvv => 0);

      function Objective_Function (
         function_params : access gsl_vector; 
         params : System.Address;  
         errors : access gsl_vector) return int 
         with Convention => C 
      is
         Func_Params : Function_Parameters := GSL_Vector_To_Array (function_params);
         Y_Error : array (Curve'Range) of Float;
      begin
         
         for Index in Y_Error'Range loop
            Y_Error (Index) := Fitted_Function (Curve (Index).x, Func_Params) - Curve (Index).y;
         end loop;

         Array_To_GSL_Vector (Y_Error, errors);
         
         return 0;
      end f;
      

   begin
      return Execute_Fit (Initial_Guess, fdf);
   end Fit;
   
   procedure Array_To_GSL_Vector (
      Float_Array : array (Integer range <>) of Float; 
      Vector : access gsl_vector)
   is
   begin
      pragma Assert(Vector.size = Float_Array'Length);

      for Index in 0 .. Vector.size loop
         gsl_vector_set(
            v => Vector, 
            i => Index, 
            x => Float_Array (Params'First + Index));
      end loop;
   end Params_To_GSL_Vector;

   function GSL_Vector_To_Array (Vector : access gsl_vector) return array (Natural range <>) of Float
   is
      Float_Array : array (0 .. Vector.size - 1) of Float;
   begin
      for Index in Float_Array'Range loop
         Float_Array(Index) := gsl_vector_get(Vector, Index);
      end loop;
      return Float_Array;
   end GSL_Vector_To_Array;

   function Execute_Fit (
      Initial_Guess : Function_Parameters; 
      Functions_Config : gsl_multifit_nlinear_fdf) return Function_Parameters 
      is
      n : constant stddef_h.size_t := Functions_Config.n;
      p : constant stddef_h.size_t := Functions_Config.p;
      pragma Assert(Initial_Guess'Length = p);

      fit_type : constant gsl_multifit_nlinear_type := gsl_multifit_nlinear_trust;
      fdf_parameters : aliased gsl_multifit_nlinear_parameters := gsl_multifit_nlinear_default_parameters;

      weights : access gsl_vector := gsl_vector_alloc (n);
      x : access gsl_vector := gsl_vector_alloc (p);
      workspace : access gsl_multifit_nlinear_workspace := gsl_multifit_nlinear_alloc (
         T => fit_type, 
         params => fdf'fdf_parameters, 
         n => n, 
         p => p);
   begin
      
      Array_To_GSL_Vector (Initial_Guess, x);

      gsl_multifit_nlinear_winit (x'Access, weights'Access, fdf'Access, workspace);
      declare
         Xtol : constant double := 1.0E-8;
         Gtol : constant double := 1.0E-8;
         Ftol : constant double := 1.0E-8;
         Maxiter : stddef_h.size_t := 1000;

         info : aliased int;
         status : gsl_multifit_nlinear_driver (
            maxiter => Maxiter, 
            xtol => Xtol, 
            gtol => Gtol, 
            ftol => Ftol, 
            callback => null, 
            callback_params => null, 
            info => info'Access, 
            w => workspace);
         Result : Function_Parameters;
      begin
         Result := GSL_Vector_To_Array (x);
         gsl_vector_free(weights);
         gsl_vector_free(x);
         gsl_multifit_nlinear_free (workspace);

         return Result;
      end;
   end Execute_Fit;
      

   
end Nonlinear_Least_Squares;