generic
   type Value_Type is digits <>;
package Electrical_Units is
   subtype Voltage_Type is Value_Type;
   subtype Current_Type is Value_Type;
   type Resistance_Type is new Value_Type range 0.0 .. Float'Safe_Last;
   
   Thermal_Voltage : constant Voltage_Type := 25E-3;

   function "*" (Resistance : Resistance_Type; Current : Current_Type) return Voltage_Type;
   function "*" (Current : Current_Type; Resistance : Resistance_Type) return Voltage_Type;
   function "/" (Voltage : Voltage_Type; Resistance : Resistance_Type) return Current_Type;

   function "/" (Voltage_1 : Voltage_Type; Voltage_2 : Voltage_Type) return Value_Type;
   function "*" (Current : Current_Type; Scale : Float) return Current_Type;
end Electrical_Units;