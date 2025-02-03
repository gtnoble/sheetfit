pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with System;

package gsl_gsl_math_h is

   M_SQRT3 : constant :=
     1.732_050_807_568_877_293_527_446_341_51;  --  /usr/include/gsl/gsl_math.h:53

   M_SQRTPI : constant :=
     1.772_453_850_905_516_027_298_167_483_34;  --  /usr/include/gsl/gsl_math.h:69

   M_LNPI : constant :=
     1.144_729_885_849_400_174_143_427_351_35;  --  /usr/include/gsl/gsl_math.h:93

   M_EULER : constant :=
     0.577_215_664_901_532_860_606_512_090_08;  --  /usr/include/gsl/gsl_math.h:97
   --  arg-macro: function GSL_IS_ODD (n)
   --    return (n) and 1;
   --  arg-macro: function GSL_IS_EVEN (n)
   --    return not(GSL_IS_ODD(n));
   --  arg-macro: function GSL_SIGN (x)
   --    return (x) >= 0.0 ? 1 : -1;
   --  arg-macro: function GSL_IS_REAL (x)
   --    return gsl_finite(x);
   --  arg-macro: function GSL_FN_EVAL (F, x)
   --    return *((F).function))(x,(F).params;
   --  arg-macro: function GSL_FN_FDF_EVAL_F (FDF, x)
   --    return *((FDF).f))(x,(FDF).params;
   --  arg-macro: function GSL_FN_FDF_EVAL_DF (FDF, x)
   --    return *((FDF).df))(x,(FDF).params;
   --  arg-macro: function GSL_FN_FDF_EVAL_F_DF (FDF, x, y, dy)
   --    return *((FDF).fdf))(x,(FDF).params,(y),(dy);
   --  arg-macro: function GSL_FN_VEC_EVAL (F, x, y)
   --    return *((F).function))(x,y,(F).params;

   -- gsl_math.h
   -- *
   -- * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2004, 2007 Gerard Jungman, Brian Gough
   -- *
   -- * This program is free software; you can redistribute it and/or modify
   -- * it under the terms of the GNU General Public License as published by
   -- * the Free Software Foundation; either version 3 of the License, or (at
   -- * your option) any later version.
   -- *
   -- * This program is distributed in the hope that it will be useful, but
   -- * WITHOUT ANY WARRANTY; without even the implied warranty of
   -- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   -- * General Public License for more details.
   -- *
   -- * You should have received a copy of the GNU General Public License
   -- * along with this program; if not, write to the Free Software
   -- * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
   --

   -- other needlessly compulsive abstractions
   -- Return nonzero if x is a real number, i.e. non NaN or infinite.
   -- Definition of an arbitrary function with parameters
   type gsl_function_struct is record
      c_function : access function
        (arg1 : double; arg2 : System.Address)
         return double;  -- /usr/include/gsl/gsl_math.h:125
      params     : System.Address;  -- /usr/include/gsl/gsl_math.h:126
   end record with
     Convention => C_Pass_By_Copy;  -- /usr/include/gsl/gsl_math.h:123

   subtype gsl_function is
     gsl_function_struct;  -- /usr/include/gsl/gsl_math.h:129

   -- Definition of an arbitrary function returning two values, r1, r2
   type gsl_function_fdf_struct is record
      f      : access function
        (arg1 : double; arg2 : System.Address)
         return double;  -- /usr/include/gsl/gsl_math.h:137
      df     : access function
        (arg1 : double; arg2 : System.Address)
         return double;  -- /usr/include/gsl/gsl_math.h:138
      fdf    : access procedure
        (arg1 : double; arg2 : System.Address; arg3 : access double;
         arg4 : access double);  -- /usr/include/gsl/gsl_math.h:139
      params : System.Address;  -- /usr/include/gsl/gsl_math.h:140
   end record with
     Convention => C_Pass_By_Copy;  -- /usr/include/gsl/gsl_math.h:135

   subtype gsl_function_fdf is
     gsl_function_fdf_struct;  -- /usr/include/gsl/gsl_math.h:143

   -- Definition of an arbitrary vector-valued function with parameters
   type gsl_function_vec_struct is record
      c_function : access function
        (arg1 : double; arg2 : access double; arg3 : System.Address)
         return int;  -- /usr/include/gsl/gsl_math.h:154
      params     : System.Address;  -- /usr/include/gsl/gsl_math.h:155
   end record with
     Convention => C_Pass_By_Copy;  -- /usr/include/gsl/gsl_math.h:152

   subtype gsl_function_vec is
     gsl_function_vec_struct;  -- /usr/include/gsl/gsl_math.h:158

end gsl_gsl_math_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
