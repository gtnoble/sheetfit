with Ada.Numerics.Generic_Elementary_Functions;
with Function_Roots;
package body Diode is
   function Fit (IV_Curve_Filename : String; Initial_Guess : Diode_Type) return Diode_Type is
      IV_Curve : IV_Curve_Data.Curve := IV_Curve_Data.Load_Data (IV_Curve_Filename);

      function Diode_Objective (
         Voltage_Drop : Independent_Variable; 
         Diode_Parameters : Fitter.Function_Parameters) return Current_Type
      is
      begin
         return Current (Params_To_Diode_Model(Diode_Parameters), Voltage_Drop (Voltage_Drop'First));
      end Diode_Objective;
      
   begin
      
      return Params_To_Diode_Model (
         Fitter.Fit (
            Curve => IV_Curve, 
            Fitted_Function => Diode_Objective'Access, 
            Initial_Guess => Diode_Model_To_Params (Initial_Guess)));
   end Fit;
   
   function Current (Diode_Model : Diode_Type; Voltage_Drop : Voltage_Type) return Current_Type
   is
      package Roots is new Function_Roots (X_Type => Voltage_Type, Y_Type => Current_Type);

      function Solve_For_Ideal_Diode_Voltage_Drop (Ideal_Diode_Voltage_Drop : Voltage_Type) return Current_Type is
         Parasitic_Resistance_Voltage_Drop : Voltage_Type := Voltage_Drop - Ideal_Diode_Voltage_Drop;
      begin
         return 
            Parasitic_Resistance_Voltage_Drop / Diode_Model.Series_Resistance - 
            Ideal_Diode_Current (
               Saturation_Current => Diode_Model.Saturation_Current, 
               Voltage_Drop => Ideal_Diode_Voltage_Drop, 
               Ideaity => Diode_Model.Ideality);
      end Solve_For_Ideal_Diode_Voltage_Drop;
      
   begin
      return Roots.Find_Root (
         F => Solve_For_Ideal_Diode_Voltage_Drop'Access, 
         Bound_1 => 0, 
         Bound_2 => Ideal_Diode_Current(
            Saturation_Current => Diode_Model.Saturation_Current, 
            Voltage_Drop => Voltage_Drop, 
            Ideaity => Diode_Model.Ideality),
         Absolute_Tolerance => 1.0E-15);
   end Current;
   
   
   function Ideal_Diode_Current (
      Saturation_Current : Current_Type; 
      Voltage_Drop : Voltage_Type; 
      Ideality : Float) return Current_Type
   is
      package Math is new Ada.Numerics.Generic_Elementary_Functions (Float);
   begin
      return Saturation_Current * (Math.Exp(Voltage_Drop / Thermal_Voltage / Ideality) - 1);
   end Ideal_Diode_Current;

   function Spice_Model (Name : String; Diode_Model : Diode_Type) return String
   is
   begin
      return 
         ".model" + Name + "D(" + 
         "Is=" + Diode_Model.Saturation_Current'Image + " " + 
         "N=" + Diode_Model.Ideality'Image + " " + 
         "Rs=" + Diode_Model.Series_Resistance + ")";
   end Spice_Model;
   
   function Params_To_Diode_Model (Diode_Parameters : Fitter.Function_Parameters) return Diode_Type
   is
   begin
      return Diode_Type (
            Saturation_Current => Current_Type(Diode_Parameters (0)), 
            Ideality => Diode_Parameters (1), 
            Series_Resistance => Diode_Parameters (2));
   end Params_To_Diode_Model;
   
   function Diode_Model_To_Params (Diode_Model : Diode_Type) return Fitter.Function_Parameters
   is
   begin
      return Fitter.Function_Parameters (
         Diode_Model.Saturation_Current, 
         Diode_Model.Ideality, 
         Diode_Model.Series_Resistance);
   end Diode_Model_To_Params;

   
end Diode;