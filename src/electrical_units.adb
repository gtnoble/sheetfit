package body Electrical_Units is

   function "*" (Resistance : Resistance_Type; Current : Current_Type) return Voltage_Type
   is
   begin
      return Voltage_Type (Resistance * Current);
   end "*";

   function "*" (Current : Current_Type; Resistance : Resistance_Type) return Voltage_Type
   is
   begin
      return Resistance * Current;
   end "*";

   function "/" (Voltage : Voltage_Type; Resistance : Resistance_Type) return Current_Type
   is
   begin
      return Current_Type (Voltage / Resistance);
   end "/";

   function "/" (Voltage_1 : Voltage_Type; Voltage_2 : Voltage_Type) return Value_Type
   is
   begin
      return Value_Type (Voltage_1 / Voltage_2);
   end "/";

   function "*" (Current : Current_Type; Scale : Float) return Current_Type
   is
   begin
      return Current_Type (Value_Type (Current) * Scale);
   end "*";
end Electrical_Units;