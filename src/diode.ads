with Ada.Strings.Unbounded;
with Curve_Data;
with Nonlinear_Least_Squares;
with Electrical_Units;

generic
   with package Units is new Electrical_Units (<>);
package Diode is

   use Units;
   type Diode_Type is record
      Saturation_Current : Current_Type;
      Ideality           : Scale_Type;
      Series_Resistance  : Resistance_Type;
   end record;

   subtype Diode_Parameters_Index is Integer range 0 .. 2;
   subtype Diode_Parameter_Type is Float;

   package IV_Curve_Data is new Curve_Data
     (Current_Type, Voltage_Type, Diode_Parameters_Index);
   package Fitter is new Nonlinear_Least_Squares
     (IV_Curve_Data, Diode_Parameter_Type);

   function Fit
     (IV_Curve_Filename : String; Initial_Guess : Diode_Type)
      return Diode_Type;

   function Spice_Model
     (Name : String; Diode_Model : Diode_Type) return String;
   function Current
     (Diode_Model : Diode_Type; Voltage_Drop : Voltage_Type)
      return Current_Type;

private
   function Params_To_Diode_Model
     (Diode_Parameters : Fitter.Function_Parameters) return Diode_Type;
   function Diode_Model_To_Params
     (Diode_Model : Diode_Type) return Fitter.Function_Parameters;

   function Ideal_Diode_Current
     (Saturation_Current : Current_Type; Voltage_Drop : Voltage_Type;
      Ideality           : Scale_Type) return Current_Type;
end Diode;
