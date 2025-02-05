with System.Address_To_Access_Conversions;
package body Nonlinear_Least_Squares is
   
   procedure Fit 
     (Curve           : access constant Fitted_Curve.Curve;
      Fitted_Function : Objective_Function_Type;
      Parameters   : Function_Parameters_Type)
   is
      n : constant stddef_h.size_t := stddef_h.size_t (Curve'Length);
      p : constant stddef_h.size_t := Parameters.size;
      
      type GSL_Context_Access_Type is access all GSL_Context_Type;
      Context : aliased GSL_Context_Type := (Objective_Function => Fitted_Function, Curve => Curve);
      Context_Access : GSL_Context_Access_Type := Context'Access;


      fit_type : access constant gsl_multifit_nlinear_type := gsl_multifit_nlinear_trust;
      fdf_parameters : aliased gsl_multifit_nlinear_parameters := gsl_multifit_nlinear_default_parameters;
      Functions_Config : aliased gsl_multifit_nlinear_fdf := (
         f => GSL_Objective_Function'Access,  
         df => null, 
         fvv => null, 
         n => n, 
         p => p, 
         params => Context_Access'Address, 
         nevalf => 0, 
         nevaldf => 0, 
         nevalfvv => 0);

   begin
      
      declare
         weights : access gsl_vector := gsl_vector_alloc (n);
         workspace : access gsl_multifit_nlinear_workspace := gsl_multifit_nlinear_alloc (
            T => fit_type, 
            params => fdf_parameters'Access, 
            n => n, 
            p => p);

         Workspace_Init_Status : int := gsl_multifit_nlinear_winit (Parameters, weights, Functions_Config'Access, workspace);

         Xtol : constant double := 1.0E-8;
         Gtol : constant double := 1.0E-8;
         Ftol : constant double := 1.0E-8;
         Maxiter : stddef_h.size_t := 1000;

         info : aliased int;
         status : int := gsl_multifit_nlinear_driver (
            maxiter => Maxiter, 
            xtol => Xtol, 
            gtol => Gtol, 
            ftol => Ftol, 
            callback => null, 
            callback_params => System.Address (System.Null_Address), 
            info => info'Access, 
            w => workspace);
      begin
         gsl_vector_free(weights);
         gsl_multifit_nlinear_free (workspace);

      end;
   end Fit;

   function GSL_Objective_Function (
      arg1 : access constant gsl_gsl_vector_double_h.gsl_vector; 
      arg2 : access System.Address;  
      arg3 : access gsl_gsl_vector_double_h.gsl_vector) return int 
   is
      package GSL_Context_Access_Conversion is new System.Address_To_Access_Conversions (GSL_Context_Type);
      Y_Error : array (0 .. arg3.size - 1) of double;
      Context : GSL_Context_Access_Conversion.Object_Pointer := GSL_Context_Access_Conversion.To_Pointer (arg2.all);
      Objective_Params : access constant gsl_vector := arg1;
      Curve : Fitted_Curve.Curve := Context.Curve.all;
      Objective_Function : Objective_Function_Type := Context.Objective_Function;
   begin
      
      for Index in 0 .. (arg3.size - 1) loop
         declare
            Point : Fitted_Curve.Point := Curve (Natural(Index));
         begin
         gsl_vector_set (
            arg3,
            Index,
            Objective_Function (Point.x, Objective_Params) - double (Point.y));
         end;
      end loop;

      return 0;
   end GSL_Objective_Function;
      

   
end Nonlinear_Least_Squares;