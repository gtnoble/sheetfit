pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;

package gsl_gsl_pow_int_h is

   -- gsl_pow_int.h
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

   function gsl_pow_2
     (x : double)
      return double  -- /usr/include/gsl/gsl_pow_int.h:36
   with
     Import => True, Convention => C, External_Name => "gsl_pow_2";

   function gsl_pow_3
     (x : double)
      return double  -- /usr/include/gsl/gsl_pow_int.h:37
   with
     Import => True, Convention => C, External_Name => "gsl_pow_3";

   function gsl_pow_4
     (x : double)
      return double  -- /usr/include/gsl/gsl_pow_int.h:38
   with
     Import => True, Convention => C, External_Name => "gsl_pow_4";

   function gsl_pow_5
     (x : double)
      return double  -- /usr/include/gsl/gsl_pow_int.h:39
   with
     Import => True, Convention => C, External_Name => "gsl_pow_5";

   function gsl_pow_6
     (x : double)
      return double  -- /usr/include/gsl/gsl_pow_int.h:40
   with
     Import => True, Convention => C, External_Name => "gsl_pow_6";

   function gsl_pow_7
     (x : double)
      return double  -- /usr/include/gsl/gsl_pow_int.h:41
   with
     Import => True, Convention => C, External_Name => "gsl_pow_7";

   function gsl_pow_8
     (x : double)
      return double  -- /usr/include/gsl/gsl_pow_int.h:42
   with
     Import => True, Convention => C, External_Name => "gsl_pow_8";

   function gsl_pow_9
     (x : double)
      return double  -- /usr/include/gsl/gsl_pow_int.h:43
   with
     Import => True, Convention => C, External_Name => "gsl_pow_9";

   function gsl_pow_int
     (x : double;
      n : int)
      return double  -- /usr/include/gsl/gsl_pow_int.h:56
   with
     Import => True, Convention => C, External_Name => "gsl_pow_int";

   function gsl_pow_uint
     (x : double;
      n : unsigned)
      return double  -- /usr/include/gsl/gsl_pow_int.h:57
   with
     Import => True, Convention => C, External_Name => "gsl_pow_uint";

end gsl_gsl_pow_int_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
