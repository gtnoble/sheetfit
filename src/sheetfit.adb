with Parse_Args;
with Ada.Text_IO;
with Diode;
with Electrical_Units;
procedure Sheetfit is
   AP : Parse_Args.Argument_Parser;

   Invalid_Component : exception;
   package Units is new Electrical_Units (Float);
   use Units;
   package Diode_Component is new Diode (Units);

   Name : constant String := "Mydiode";

   procedure Process_Diode (AP : Parse_Args.Argument_Parser) is
      Data_File_Name     : constant String := AP.String_Value ("iv-data-file");
      Saturation_Current : constant Current_Type               :=
        Current_Type'Value (AP.String_Value ("saturation-current"));
      Ideality_Factor    : constant Float                      :=
        Float'Value (AP.String_Value ("ideality-factor"));
      Series_Resistance  : constant Resistance_Type            := 0.0;
      Diode_Guess        : constant Diode_Component.Diode_Type :=
        (Saturation_Current => Saturation_Current, Ideality => Ideality_Factor,
         Series_Resistance  => Series_Resistance);
      Fitted_Diode       : constant Diode_Component.Diode_Type :=
        Diode_Component.Fit (Data_File_Name, Diode_Guess);
   begin
      Ada.Text_IO.Put_Line (Diode_Component.Spice_Model (Name, Fitted_Diode));
   end Process_Diode;
begin
   AP.Add_Option
     (O => Parse_Args.Make_String_Option, Name => "type", Short_Option => 't',
      Long_Option => "type", Usage => "Type of component to fit");

   AP.Add_Option
     (O            => Parse_Args.Make_String_Option, Name => "iv-data-file",
      Short_Option => 'i', Long_Option => "iv-data-file",
      Usage        => "A csv file containing the IV curve data");

   AP.Add_Option
     (O => Parse_Args.Make_String_Option, Name => "saturation-current",
      Short_Option => 's', Long_Option => "saturation-current",
      Usage        => "estimate for the diode saturation current");

   AP.Add_Option
     (O            => Parse_Args.Make_String_Option, Name => "ideality-factor",
      Short_Option => 'n', Long_Option => "ideality-factor",
      Usage        => "estimate for the diode ideality factor");

   AP.Add_Option
     (O => Parse_Args.Make_Boolean_Option, Name => "help", Short_Option => 'h',
      Long_Option => "help", Usage => "displays this usage text");

   AP.Parse_Command_Line;

   if AP.Parse_Success then
      if AP.Boolean_Value ("help") then
         AP.Usage;
      else
         declare
            Component_Type : constant String := AP.String_Value ("type");
         begin
            if Component_Type = "diode" then
               Process_Diode (AP);
            elsif Component_Type = "" then
               raise Invalid_Component
                 with "error: a component type must be specified";
            else
               raise Invalid_Component
                 with "error: invalid component type: " &
                 AP.String_Value ("type");
            end if;

         end;
      end if;
   end if;
end Sheetfit;
