package body Function_Roots is
   function Find_Root (
      F : Function_1D_Type; 
      Bound_1 : X_Type; 
      Bound_2 : X_Type;
      Absolute_Tolerance : X_Type) return X_Type
   is
      Lower_X : X_Type;
      Upper_X : X_Type;
      
      Lower_Y : Y_Type;
      Upper_Y : Y_Type;

      Bisection_X : X_Type;
      Bisection_Y : Y_Type;
   begin
      if Bound_1 < Bound_2 then
         Lower_X := Bound_1;
         Upper_X := Bound_2;
      else 
         Lower_X := Bound_2;
         Upper_X := Bound_1;
      end if;
      
      Lower_Y := F (Lower_X);
      Upper_Y := F (Upper_X);
      
      while Upper_X - Lower_X < Absolute_Tolerance loop
         Bisection_X := (Upper_X + Lower_X) / 2.0;
         Bisection_Y := F (Bisection_X);
         
         if Sign (Bisection_Y) /= Sign (Lower_Y) then
            Upper_Y := Bisection_Y;
            Upper_X := Bisection_X;
         else
            Lower_Y := Bisection_Y;
            Lower_X := Bisection_X;
         end if;
         
         pragma Assert (Lower_X <= Upper_X);
      end loop;
      
      return Bisection_X;
   end Find_Root;

   function Sign (X : Value_Type) return Sign_Type
   is
   begin
      if X > 0 then
         return 1;
      elsif X < 0 then
         return -1;
      else
         return 0;
      end if;
   end Sign;
end Function_Roots;