with Ada.Text_IO;
with Ada.Strings.Fixed; 
with Ada.Containers; use Ada.Containers;
with Ada.Containers.Vectors;
with Ada.Strings.Maps;
with Curve_Data;

package body Curve_Data is

   function Load_Data (Filename : String) return Curve is
      use Ada.Text_IO;
      use Ada.Strings.Fixed;
      
      type Line_Type is array (0 .. Independent_Variable'Length) of Float;

      package Points_Vector is new
         Ada.Containers.Vectors
            (Index_Type => Natural, Element_Type => Point);
         
      File : File_Type;
      Line_Number : Natural := 0;
      Delimiter : constant Ada.Strings.Maps.Character_Set := Ada.Strings.Maps.To_Set (',');
      Parsed_Points : Points_Vector.Vector;

      -- Procedure to split a CSV line into an array of fields
      function Split_Line (Raw_Line : String; Sep : Ada.Strings.Maps.Character_Set) return Line_Type is

         Parsed_Line : Line_Type;
         Parsed_Field_Index  : Natural := Line_Type'First;
         Next_Delimiter_Index    : Positive := Index (Source => Raw_Line, Set => Sep, From => Raw_Line'First);
         String_Field_Index_Start  : Positive := Raw_Line'First;
         Parsed_Coordinate : Float;
      begin
         while Next_Delimiter_Index > 0 loop
            Parsed_Line(Parsed_Field_Index) := Float'Value(Raw_Line(String_Field_Index_Start .. Next_Delimiter_Index - 1));
            String_Field_Index_Start := Next_Delimiter_Index + 1;
            Next_Delimiter_Index := Index (Source => Raw_Line, Set => Sep, From => String_Field_Index_Start);
            Parsed_Field_Index := Parsed_Field_Index + 1;
         end loop;

         -- Last field
         if String_Field_Index_Start <= Raw_Line'Last then
            Parsed_Line(Parsed_Field_Index) := Float'Value(Raw_Line(String_Field_Index_Start .. Raw_Line'Last));
         end if;

         return Parsed_Line;
      end Split_Line;

   begin
      Open (File, In_File, Filename); -- Replace with your file name

      while not End_Of_File (File) loop
         declare
            Line_String : String := Get_Line (File);
            Line      : Line_Type := Split_Line (Line_String, Delimiter);
            X : Independent_Variable;
            Y : Dependent_Variable := Dependent_Variable(Line (Line'Last));
         begin
            for Index in 0 .. (Line'Last - 1) loop
               X (Independent_Vector_Index_Type (Integer (X'First) + Index)) := Independent_Component(Line (Index));
            end loop;
            Parsed_Points.Append ((X => X, Y => Y));
         end;
      end loop;
      
      declare
         Returned_Curve : Curve (Parsed_Points.First_Index .. Parsed_Points.Last_Index);
      begin
         for Index in Returned_Curve'Range loop
            Returned_Curve (Index) := Parsed_Points (Index);
         end loop;
         Close (File);
         return Returned_Curve;
      end;
   end Load_Data;


end Curve_Data;