generic
   type Scale_Type is digits <>;
package Electrical_Units is
   type Voltage_Type is new Scale_Type;
   type Current_Type is new Scale_Type;
   type Resistance_Type is new Scale_Type range 0.0 .. Scale_Type'Safe_Last;

   Thermal_Voltage : constant Voltage_Type := 25.0E-3;

   function "*"
     (Resistance : Resistance_Type; Current : Current_Type)
      return Voltage_Type;
   function "*"
     (Current : Current_Type; Resistance : Resistance_Type)
      return Voltage_Type;
   function "/"
     (Voltage : Voltage_Type; Resistance : Resistance_Type)
      return Current_Type;

   function "/"
     (Voltage_1 : Voltage_Type; Voltage_2 : Voltage_Type) return Scale_Type;
   function "*"
     (Current : Current_Type; Scale : Scale_Type) return Current_Type;
end Electrical_Units;
