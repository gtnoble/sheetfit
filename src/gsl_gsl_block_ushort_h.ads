pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with stddef_h;

with Interfaces.C.Strings;

package gsl_gsl_block_ushort_h is

  -- block/gsl_block_ushort.h
  -- * 
  -- * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2007 Gerard Jungman, Brian Gough
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

   type gsl_block_ushort_struct is record
      size : aliased stddef_h.size_t;  -- /usr/include/gsl/gsl_block_ushort.h:40
      data : access unsigned_short;  -- /usr/include/gsl/gsl_block_ushort.h:41
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/gsl/gsl_block_ushort.h:38

   subtype gsl_block_ushort is gsl_block_ushort_struct;  -- /usr/include/gsl/gsl_block_ushort.h:44

   function gsl_block_ushort_alloc (n : stddef_h.size_t) return access gsl_block_ushort  -- /usr/include/gsl/gsl_block_ushort.h:46
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_block_ushort_alloc";

   function gsl_block_ushort_calloc (n : stddef_h.size_t) return access gsl_block_ushort  -- /usr/include/gsl/gsl_block_ushort.h:47
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_block_ushort_calloc";

   procedure gsl_block_ushort_free (b : access gsl_block_ushort)  -- /usr/include/gsl/gsl_block_ushort.h:48
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_block_ushort_free";








   function gsl_block_ushort_size (b : access constant gsl_block_ushort) return stddef_h.size_t  -- /usr/include/gsl/gsl_block_ushort.h:60
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_block_ushort_size";

   function gsl_block_ushort_data (b : access constant gsl_block_ushort) return access unsigned_short  -- /usr/include/gsl/gsl_block_ushort.h:61
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_block_ushort_data";

end gsl_gsl_block_ushort_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
