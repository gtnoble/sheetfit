package body Diode is
   function Fit (IV_Curve_Filename : String; Initial_Guess : Diode) return Diode is
      IV_Curve : Curve_2D.Curve := Curve_2D.Load_Data (IV_Curve_Filename);
   begin
      
   end Fit;
end Diode;