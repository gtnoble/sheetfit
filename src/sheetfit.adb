with Parse_Args;
with Ada.Text_IO; use Ada.Text_IO;
with Curve_Data;
procedure Sheetfit is
   AP : Parse_Args.Argument_Parser;
   
   type Point_2D is array (0 .. 1) of Float;
   package Curve_2D is new Curve_Data (Point_2D);
   
   IV_Curve_Filename : String;
   IV_Curve : Curve_2D.Curve;

   Invalid_Component: exception;
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
      O => Parse_Args.Make_Natural_Option(-1.0), 
      Name => "saturation current guess", 
      Short_Option => 's',
      Long_Option => "saturation-current", 
      Usage => "estimate for the diode saturation current");
      
   AP.Add_Option (
      O => Parse_Args.Make_Natural_Option(-1.0), 
      Name => "ideality factor guess", 
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
         IV_Curve_Filename := AP.String_Value ("iv-data-file");
         case AP.String_Value ("type") is
               when "diode" => Fit_Diode (AP);
               when "" => raise Invalid_Component with "error: a component type must be specified";
               when others => raise Invalid_Component with "error: invalid component type: " + AP.String_Value ("type");
         end case;
      end if;
   end if;
end Sheetfit;
