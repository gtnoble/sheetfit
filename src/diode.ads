with Curve_Data;
with Nonlinear_Least_Squares;
with Electrical_Units;

package Diode is
   
   package Units is new Electrical_Units(Float);
   use Units;
   type Diode_Type is record
      Saturation_Current : Current_Type;
      Ideality : Float;
      Series_Resistance : Resistance_Type;
   end record;
   
   type Independent_Variable is array (0 .. 0) of Voltage_Type;
   package IV_Curve_Data is new Curve_Data (Current_Type, Voltage_Type, Independent_Variable);
   package Fitter is new Nonlinear_Least_Squares(IV_Curve_Data);

   function Fit (IV_Curve_Filename : String; Initial_Estimate : Diode_Type) return Diode_Type;

   function Spice_Model (Diode_Model : Diode_Type) return String;
   function Current (Diode_Model : Diode_Type; Voltage_Drop : Voltage_Type) return Current_Type;
   

private
   function Params_To_Diode_Model (Diode_Parameters : Fitter.Function_Parameters) return Diode_Type;
   function Diode_Model_To_Params (Diode_Model : Diode_Type) return Fitter.Function_Parameters;
   
   function Ideal_Diode_Current (
      Saturation_Current : Current_Type; 
      Voltage_Drop : Voltage_Type; 
      Ideaity : Float) return Current_Type;
end Diode;