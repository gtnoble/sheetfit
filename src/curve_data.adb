with Ada.Text_IO;
with Ada.Text_IO.Float_IO; use Ada.Text_IO.Float_IO;
with Ada.Strings.Fixed;
with Ada.Containers; use Ada.Containers;
with Ada.Containers.Vectors;
with Curve_Data;

package body Curve_Data is

   function Load_Data (Filename : Unbounded_String) return Curve is
      use Ada.Text_IO;
      use Ada.Strings.Fixed;
      
      type Line is array (Independent_Variable'First .. Independent_Variable'Last + 1) of Float;

      package Points_Vector is new
         Ada.Containers.Vectors
            (Index_Type => Natural, Element_Type => Point);
         
      File : File_Type;
      Line_Number : Natural := 0;
      Delimiter : constant Character := ',';
      Parsed_Points : Points_Vector.Vector;

      -- Procedure to split a CSV line into an array of fields
      function Split_Line (S : String; Sep : Character) return Line is

         Parsed_Line : Line;
         Count  : Natural := Point'First;
         Pos    : Natural := Index (S, Sep);
         Start  : Natural := S'First;
         Parsed_Coordinate : Float;
      begin
         while Pos > 0 loop
            Get (S(Start .. Pos - 1), Parsed_Coordinate);
            Parsed_Line(Count) := Parsed_Coordinate;
            Start := Pos + 1;
            Pos := Index (S(Start .. S'Last), Sep);
            Count := Count + 1;
         end loop;

         -- Last field
         if Start <= S'Last then
            Get (S(Start .. S'Last), Parsed_Coordinate);
            Parsed_Line(Count) := Parsed_Coordinate;
         end if;

         return Parsed_Line;
      end Split_Line;

   begin
      Open (File, In_File, Filename); -- Replace with your file name

      while not End_Of_File (File) loop
         declare
            Line_String : String := Get_Line (File);
            Line      : Unbounded_String_Array := Split_Line (Line_String, Delimiter);
            Next_Point : Point (
               x => Independent_Variable (Line (Line'First)), 
               y => Dependent_Variable (Line (Line'First + 1 .. Line'Last)));
         begin
            Parsed_Points.Append (Next_Point);
         end;
      end loop;
      
      declare
         Returned_Curve : Curve;
         Index : Returned_Curve'First;
         procedure Fill_Curve (Element : Point) is
         begin
            Returned_Curve(Index) := Element;
            Index := Index + 1;
         end Fill_Curve;
      begin
         Parsed_Points.Iterate (Fill_Curve'Access);
         Close (File);
         return Returned_Curve;
      end;
   end Read_CSV;


end Curve_Data;