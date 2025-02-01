pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;

package gsl_gsl_precision_h is

  -- gsl_precision.h
  -- * 
  -- * Copyright (C) 1996, 1997, 1998, 1999, 2000 Gerard Jungman
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

  -- Author:  B. Gough and G. Jungman  
  -- A type for the precision indicator.
  -- * This is mainly for pedagogy.
  --  

   subtype gsl_prec_t is unsigned;  -- /usr/include/gsl/gsl_precision.h:42

  -- The number of precision types.
  -- * Remember that precision-mode
  -- * can index an array.
  --  

  -- Arrays containing derived
  -- * precision constants for the
  -- * different precision levels.
  --  

   gsl_prec_eps : aliased array (size_t) of aliased double  -- /usr/include/gsl/gsl_precision.h:56
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_prec_eps";

   gsl_prec_sqrt_eps : aliased array (size_t) of aliased double  -- /usr/include/gsl/gsl_precision.h:57
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_prec_sqrt_eps";

   gsl_prec_root3_eps : aliased array (size_t) of aliased double  -- /usr/include/gsl/gsl_precision.h:58
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_prec_root3_eps";

   gsl_prec_root4_eps : aliased array (size_t) of aliased double  -- /usr/include/gsl/gsl_precision.h:59
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_prec_root4_eps";

   gsl_prec_root5_eps : aliased array (size_t) of aliased double  -- /usr/include/gsl/gsl_precision.h:60
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_prec_root5_eps";

   gsl_prec_root6_eps : aliased array (size_t) of aliased double  -- /usr/include/gsl/gsl_precision.h:61
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_prec_root6_eps";

end gsl_gsl_precision_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
