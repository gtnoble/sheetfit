pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with stddef_h;
limited with gsl_gsl_block_ulong_h;

with Interfaces.C.Strings;

package gsl_gsl_vector_ulong_h is

  -- vector/gsl_vector_ulong.h
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

   type gsl_vector_ulong is record
      size : aliased stddef_h.size_t;  -- /usr/include/gsl/gsl_vector_ulong.h:44
      stride : aliased stddef_h.size_t;  -- /usr/include/gsl/gsl_vector_ulong.h:45
      data : access unsigned_long;  -- /usr/include/gsl/gsl_vector_ulong.h:46
      block : access gsl_gsl_block_ulong_h.gsl_block_ulong_struct;  -- /usr/include/gsl/gsl_vector_ulong.h:47
      owner : aliased int;  -- /usr/include/gsl/gsl_vector_ulong.h:48
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/gsl/gsl_vector_ulong.h:50

   type u_gsl_vector_ulong_view is record
      vector : aliased gsl_vector_ulong;  -- /usr/include/gsl/gsl_vector_ulong.h:54
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/gsl/gsl_vector_ulong.h:55

   subtype gsl_vector_ulong_view is u_gsl_vector_ulong_view;  -- /usr/include/gsl/gsl_vector_ulong.h:57

   type u_gsl_vector_ulong_const_view is record
      vector : aliased gsl_vector_ulong;  -- /usr/include/gsl/gsl_vector_ulong.h:61
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/gsl/gsl_vector_ulong.h:62

   subtype gsl_vector_ulong_const_view is u_gsl_vector_ulong_const_view;  -- /usr/include/gsl/gsl_vector_ulong.h:64

  -- Allocation  
   function gsl_vector_ulong_alloc (n : stddef_h.size_t) return access gsl_vector_ulong  -- /usr/include/gsl/gsl_vector_ulong.h:69
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_alloc";

   function gsl_vector_ulong_calloc (n : stddef_h.size_t) return access gsl_vector_ulong  -- /usr/include/gsl/gsl_vector_ulong.h:70
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_calloc";

   function gsl_vector_ulong_alloc_from_block
     (b : access gsl_gsl_block_ulong_h.gsl_block_ulong_struct;
      offset : stddef_h.size_t;
      n : stddef_h.size_t;
      stride : stddef_h.size_t) return access gsl_vector_ulong  -- /usr/include/gsl/gsl_vector_ulong.h:72
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_alloc_from_block";

   function gsl_vector_ulong_alloc_from_vector
     (v : access gsl_vector_ulong;
      offset : stddef_h.size_t;
      n : stddef_h.size_t;
      stride : stddef_h.size_t) return access gsl_vector_ulong  -- /usr/include/gsl/gsl_vector_ulong.h:77
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_alloc_from_vector";

   procedure gsl_vector_ulong_free (v : access gsl_vector_ulong)  -- /usr/include/gsl/gsl_vector_ulong.h:82
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_free";

  -- Views  
   function gsl_vector_ulong_view_array (v : access unsigned_long; n : stddef_h.size_t) return u_gsl_vector_ulong_view  -- /usr/include/gsl/gsl_vector_ulong.h:87
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_view_array";

   function gsl_vector_ulong_view_array_with_stride
     (base : access unsigned_long;
      stride : stddef_h.size_t;
      n : stddef_h.size_t) return u_gsl_vector_ulong_view  -- /usr/include/gsl/gsl_vector_ulong.h:90
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_view_array_with_stride";

   function gsl_vector_ulong_const_view_array (v : access unsigned_long; n : stddef_h.size_t) return u_gsl_vector_ulong_const_view  -- /usr/include/gsl/gsl_vector_ulong.h:95
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_const_view_array";

   function gsl_vector_ulong_const_view_array_with_stride
     (base : access unsigned_long;
      stride : stddef_h.size_t;
      n : stddef_h.size_t) return u_gsl_vector_ulong_const_view  -- /usr/include/gsl/gsl_vector_ulong.h:98
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_const_view_array_with_stride";

   function gsl_vector_ulong_subvector
     (v : access gsl_vector_ulong;
      i : stddef_h.size_t;
      n : stddef_h.size_t) return u_gsl_vector_ulong_view  -- /usr/include/gsl/gsl_vector_ulong.h:103
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_subvector";

   function gsl_vector_ulong_subvector_with_stride
     (v : access gsl_vector_ulong;
      i : stddef_h.size_t;
      stride : stddef_h.size_t;
      n : stddef_h.size_t) return u_gsl_vector_ulong_view  -- /usr/include/gsl/gsl_vector_ulong.h:108
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_subvector_with_stride";

   function gsl_vector_ulong_const_subvector
     (v : access constant gsl_vector_ulong;
      i : stddef_h.size_t;
      n : stddef_h.size_t) return u_gsl_vector_ulong_const_view  -- /usr/include/gsl/gsl_vector_ulong.h:114
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_const_subvector";

   function gsl_vector_ulong_const_subvector_with_stride
     (v : access constant gsl_vector_ulong;
      i : stddef_h.size_t;
      stride : stddef_h.size_t;
      n : stddef_h.size_t) return u_gsl_vector_ulong_const_view  -- /usr/include/gsl/gsl_vector_ulong.h:119
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_const_subvector_with_stride";

  -- Operations  
   procedure gsl_vector_ulong_set_zero (v : access gsl_vector_ulong)  -- /usr/include/gsl/gsl_vector_ulong.h:126
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_set_zero";

   procedure gsl_vector_ulong_set_all (v : access gsl_vector_ulong; x : unsigned_long)  -- /usr/include/gsl/gsl_vector_ulong.h:127
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_set_all";

   function gsl_vector_ulong_set_basis (v : access gsl_vector_ulong; i : stddef_h.size_t) return int  -- /usr/include/gsl/gsl_vector_ulong.h:128
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_set_basis";




   function gsl_vector_ulong_memcpy (dest : access gsl_vector_ulong; src : access constant gsl_vector_ulong) return int  -- /usr/include/gsl/gsl_vector_ulong.h:136
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_memcpy";

   function gsl_vector_ulong_reverse (v : access gsl_vector_ulong) return int  -- /usr/include/gsl/gsl_vector_ulong.h:138
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_reverse";

   function gsl_vector_ulong_swap (v : access gsl_vector_ulong; w : access gsl_vector_ulong) return int  -- /usr/include/gsl/gsl_vector_ulong.h:140
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_swap";

   function gsl_vector_ulong_swap_elements
     (v : access gsl_vector_ulong;
      i : stddef_h.size_t;
      j : stddef_h.size_t) return int  -- /usr/include/gsl/gsl_vector_ulong.h:141
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_swap_elements";

   function gsl_vector_ulong_max (v : access constant gsl_vector_ulong) return unsigned_long  -- /usr/include/gsl/gsl_vector_ulong.h:143
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_max";

   function gsl_vector_ulong_min (v : access constant gsl_vector_ulong) return unsigned_long  -- /usr/include/gsl/gsl_vector_ulong.h:144
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_min";

   procedure gsl_vector_ulong_minmax
     (v : access constant gsl_vector_ulong;
      min_out : access unsigned_long;
      max_out : access unsigned_long)  -- /usr/include/gsl/gsl_vector_ulong.h:145
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_minmax";

   function gsl_vector_ulong_max_index (v : access constant gsl_vector_ulong) return stddef_h.size_t  -- /usr/include/gsl/gsl_vector_ulong.h:147
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_max_index";

   function gsl_vector_ulong_min_index (v : access constant gsl_vector_ulong) return stddef_h.size_t  -- /usr/include/gsl/gsl_vector_ulong.h:148
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_min_index";

   procedure gsl_vector_ulong_minmax_index
     (v : access constant gsl_vector_ulong;
      imin : access stddef_h.size_t;
      imax : access stddef_h.size_t)  -- /usr/include/gsl/gsl_vector_ulong.h:149
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_minmax_index";

   function gsl_vector_ulong_add (a : access gsl_vector_ulong; b : access constant gsl_vector_ulong) return int  -- /usr/include/gsl/gsl_vector_ulong.h:151
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_add";

   function gsl_vector_ulong_sub (a : access gsl_vector_ulong; b : access constant gsl_vector_ulong) return int  -- /usr/include/gsl/gsl_vector_ulong.h:152
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_sub";

   function gsl_vector_ulong_mul (a : access gsl_vector_ulong; b : access constant gsl_vector_ulong) return int  -- /usr/include/gsl/gsl_vector_ulong.h:153
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_mul";

   function gsl_vector_ulong_div (a : access gsl_vector_ulong; b : access constant gsl_vector_ulong) return int  -- /usr/include/gsl/gsl_vector_ulong.h:154
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_div";

   function gsl_vector_ulong_scale (a : access gsl_vector_ulong; x : unsigned_long) return int  -- /usr/include/gsl/gsl_vector_ulong.h:155
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_scale";

   function gsl_vector_ulong_add_constant (a : access gsl_vector_ulong; x : unsigned_long) return int  -- /usr/include/gsl/gsl_vector_ulong.h:156
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_add_constant";

   function gsl_vector_ulong_axpby
     (alpha : unsigned_long;
      x : access constant gsl_vector_ulong;
      beta : unsigned_long;
      y : access gsl_vector_ulong) return int  -- /usr/include/gsl/gsl_vector_ulong.h:157
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_axpby";

   function gsl_vector_ulong_sum (a : access constant gsl_vector_ulong) return unsigned_long  -- /usr/include/gsl/gsl_vector_ulong.h:158
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_sum";

   function gsl_vector_ulong_equal (u : access constant gsl_vector_ulong; v : access constant gsl_vector_ulong) return int  -- /usr/include/gsl/gsl_vector_ulong.h:160
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_equal";

   function gsl_vector_ulong_isnull (v : access constant gsl_vector_ulong) return int  -- /usr/include/gsl/gsl_vector_ulong.h:163
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_isnull";

   function gsl_vector_ulong_ispos (v : access constant gsl_vector_ulong) return int  -- /usr/include/gsl/gsl_vector_ulong.h:164
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_ispos";

   function gsl_vector_ulong_isneg (v : access constant gsl_vector_ulong) return int  -- /usr/include/gsl/gsl_vector_ulong.h:165
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_isneg";

   function gsl_vector_ulong_isnonneg (v : access constant gsl_vector_ulong) return int  -- /usr/include/gsl/gsl_vector_ulong.h:166
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_isnonneg";

   function gsl_vector_ulong_get (v : access constant gsl_vector_ulong; i : stddef_h.size_t) return unsigned_long  -- /usr/include/gsl/gsl_vector_ulong.h:168
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_get";

   procedure gsl_vector_ulong_set
     (v : access gsl_vector_ulong;
      i : stddef_h.size_t;
      x : unsigned_long)  -- /usr/include/gsl/gsl_vector_ulong.h:169
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_set";

   function gsl_vector_ulong_ptr (v : access gsl_vector_ulong; i : stddef_h.size_t) return access unsigned_long  -- /usr/include/gsl/gsl_vector_ulong.h:170
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_ptr";

   function gsl_vector_ulong_const_ptr (v : access constant gsl_vector_ulong; i : stddef_h.size_t) return access unsigned_long  -- /usr/include/gsl/gsl_vector_ulong.h:171
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_ulong_const_ptr";

end gsl_gsl_vector_ulong_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
