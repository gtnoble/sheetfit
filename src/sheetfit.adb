with Parse_Args;
with Ada.Text_IO; use Ada.Text_IO;
with Diode;
procedure Sheetfit is
   AP : Parse_Args.Argument_Parser;
   
   Invalid_Component: exception;
   Component_Type : String;
begin
   AP.Add_Option (
      O => Parse_Args.Make_String_Option, 
      Name => "type", 
      Short_Option => 't', 
      Long_Option => "type", 
      Usage => "Type of component to fit");
   
   AP.Add_Option (
      O => Parse_Args.Make_String_Option, 
      Name => "iv-data-file", 
      Short_Option => 'i', 
      Long_Option => "iv-data-file", 
      Usage => "A csv file containing the IV curve data");

   AP.Add_Option (
      O => Parse_Args.Make_String_Option, 
      Name => "saturation-current", 
      Short_Option => 's',
      Long_Option => "saturation-current", 
      Usage => "estimate for the diode saturation current");
      
   AP.Add_Option (
      O => Parse_Args.Make_String_Option, 
      Name => "ideality-factor", 
      Short_Option => 'n', 
      Long_Option => "ideality-factor", 
      Usage => "estimate for the diode ideality factor");
   
   AP.Add_Option
     (O             => Parse_Args.Boolean_Option,
      Name          => "help",
      Short_Option  => "h",
      Long_Option   => "help",
      Usage         => "displays this usage text");
   
   AP.Parse_Command_Line;
   
   if AP.Parse_Success then
      if AP.Boolean_Value ("help") then
         AP.Usage;
      else 
         declare
         Component_Type : String := AP.String_Value ("type");
         begin
            case AP.String_Value ("type") is
                  when "diode" => Process_Diode (AP);
                  when "" => raise Invalid_Component with "error: a component type must be specified";
                  when others => raise Invalid_Component with "error: invalid component type: " + AP.String_Value ("type");
            end case;
         end;
      end if;
   end if;
end Sheetfit;

with Ada.Wide_Wide_Text_IO.Wide_Wide_Bounded_IO;
with Diode;
procedure Process_Diode (AP : Parse_Args.Argument_Parser)
is
   Data_File_Name : String := AP.String_Value ("iv-data-file");
   Saturation_Current : Float := Float'Value(AP.String_Value ("saturation-current"));
   Ideality_Factor : Float :=  Float'Value(AP.String_Value ("ideality-factor"));
   Series_Resistance : Float := 0.0;
   Diode_Guess : Diode.Diode_Type := (Saturation_Current =>
                                        Saturation_Current,
                                      Ideality =>
                                        Ideality_Factor,
                                      Series_Resistance =>
                                        Series_Resistance);
   Fitted_Diode : Diode.Diode_Type := Diode.Fit (Data_File_Name, Diode_Guess);
begin
   Ada.Text_IO.Put_Line(Diode.Spice_Model(Fitted_Diode));
end Process_Diode;