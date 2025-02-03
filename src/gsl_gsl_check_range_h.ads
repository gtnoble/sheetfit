pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;

package gsl_gsl_check_range_h is

   GSL_RANGE_CHECK : constant := 1;  --  /usr/include/gsl/gsl_check_range.h:51

   -- vector/gsl_check_range.h
   -- *
   -- * Copyright (C) 2003, 2004, 2007 Brian Gough
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

   gsl_check_range :
     aliased int  -- /usr/include/gsl/gsl_check_range.h:38
   with
     Import => True, Convention => C, External_Name => "gsl_check_range";

   -- Turn range checking on by default, unless the user defines
   --   GSL_RANGE_CHECK_OFF, or defines GSL_RANGE_CHECK to 0 explicitly

end gsl_gsl_check_range_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
