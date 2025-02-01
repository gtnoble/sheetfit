pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;

package gsl_gsl_minmax_h is

   --  arg-macro: function GSL_MAX (a, b)
   --    return (a) > (b) ? (a) : (b);
   --  arg-macro: function GSL_MIN (a, b)
   --    return (a) < (b) ? (a) : (b);
   --  arg-macro: procedure GSL_MAX_INT (a, b)
   --    GSL_MAX(a,b)
   --  arg-macro: procedure GSL_MIN_INT (a, b)
   --    GSL_MIN(a,b)
   --  arg-macro: procedure GSL_MAX_DBL (a, b)
   --    GSL_MAX(a,b)
   --  arg-macro: procedure GSL_MIN_DBL (a, b)
   --    GSL_MIN(a,b)
   --  arg-macro: procedure GSL_MAX_LDBL (a, b)
   --    GSL_MAX(a,b)
   --  arg-macro: procedure GSL_MIN_LDBL (a, b)
   --    GSL_MIN(a,b)
  -- gsl_minmax.h
  -- * 
  -- * Copyright (C) 2008 Gerard Jungman, Brian Gough
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

  -- Define MAX and MIN macros/functions if they don't exist.  
  -- plain old macros for general use  
  -- function versions of the above, in case they are needed  
   function gsl_max (a : double; b : double) return double  -- /usr/include/gsl/gsl_minmax.h:43
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_max";

   function gsl_min (a : double; b : double) return double  -- /usr/include/gsl/gsl_minmax.h:44
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_min";

  -- inline-friendly strongly typed versions  
end gsl_gsl_minmax_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
