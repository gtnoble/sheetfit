pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with stddef_h;
limited with gsl_gsl_block_short_h;

with Interfaces.C.Strings;

package gsl_gsl_vector_short_h is

  -- vector/gsl_vector_short.h
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

   type gsl_vector_short is record
      size : aliased stddef_h.size_t;  -- /usr/include/gsl/gsl_vector_short.h:44
      stride : aliased stddef_h.size_t;  -- /usr/include/gsl/gsl_vector_short.h:45
      data : access short;  -- /usr/include/gsl/gsl_vector_short.h:46
      block : access gsl_gsl_block_short_h.gsl_block_short_struct;  -- /usr/include/gsl/gsl_vector_short.h:47
      owner : aliased int;  -- /usr/include/gsl/gsl_vector_short.h:48
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/gsl/gsl_vector_short.h:50

   type u_gsl_vector_short_view is record
      vector : aliased gsl_vector_short;  -- /usr/include/gsl/gsl_vector_short.h:54
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/gsl/gsl_vector_short.h:55

   subtype gsl_vector_short_view is u_gsl_vector_short_view;  -- /usr/include/gsl/gsl_vector_short.h:57

   type u_gsl_vector_short_const_view is record
      vector : aliased gsl_vector_short;  -- /usr/include/gsl/gsl_vector_short.h:61
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/gsl/gsl_vector_short.h:62

   subtype gsl_vector_short_const_view is u_gsl_vector_short_const_view;  -- /usr/include/gsl/gsl_vector_short.h:64

  -- Allocation  
   function gsl_vector_short_alloc (n : stddef_h.size_t) return access gsl_vector_short  -- /usr/include/gsl/gsl_vector_short.h:69
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_alloc";

   function gsl_vector_short_calloc (n : stddef_h.size_t) return access gsl_vector_short  -- /usr/include/gsl/gsl_vector_short.h:70
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_calloc";

   function gsl_vector_short_alloc_from_block
     (b : access gsl_gsl_block_short_h.gsl_block_short_struct;
      offset : stddef_h.size_t;
      n : stddef_h.size_t;
      stride : stddef_h.size_t) return access gsl_vector_short  -- /usr/include/gsl/gsl_vector_short.h:72
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_alloc_from_block";

   function gsl_vector_short_alloc_from_vector
     (v : access gsl_vector_short;
      offset : stddef_h.size_t;
      n : stddef_h.size_t;
      stride : stddef_h.size_t) return access gsl_vector_short  -- /usr/include/gsl/gsl_vector_short.h:77
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_alloc_from_vector";

   procedure gsl_vector_short_free (v : access gsl_vector_short)  -- /usr/include/gsl/gsl_vector_short.h:82
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_free";

  -- Views  
   function gsl_vector_short_view_array (v : access short; n : stddef_h.size_t) return u_gsl_vector_short_view  -- /usr/include/gsl/gsl_vector_short.h:87
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_view_array";

   function gsl_vector_short_view_array_with_stride
     (base : access short;
      stride : stddef_h.size_t;
      n : stddef_h.size_t) return u_gsl_vector_short_view  -- /usr/include/gsl/gsl_vector_short.h:90
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_view_array_with_stride";

   function gsl_vector_short_const_view_array (v : access short; n : stddef_h.size_t) return u_gsl_vector_short_const_view  -- /usr/include/gsl/gsl_vector_short.h:95
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_const_view_array";

   function gsl_vector_short_const_view_array_with_stride
     (base : access short;
      stride : stddef_h.size_t;
      n : stddef_h.size_t) return u_gsl_vector_short_const_view  -- /usr/include/gsl/gsl_vector_short.h:98
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_const_view_array_with_stride";

   function gsl_vector_short_subvector
     (v : access gsl_vector_short;
      i : stddef_h.size_t;
      n : stddef_h.size_t) return u_gsl_vector_short_view  -- /usr/include/gsl/gsl_vector_short.h:103
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_subvector";

   function gsl_vector_short_subvector_with_stride
     (v : access gsl_vector_short;
      i : stddef_h.size_t;
      stride : stddef_h.size_t;
      n : stddef_h.size_t) return u_gsl_vector_short_view  -- /usr/include/gsl/gsl_vector_short.h:108
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_subvector_with_stride";

   function gsl_vector_short_const_subvector
     (v : access constant gsl_vector_short;
      i : stddef_h.size_t;
      n : stddef_h.size_t) return u_gsl_vector_short_const_view  -- /usr/include/gsl/gsl_vector_short.h:114
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_const_subvector";

   function gsl_vector_short_const_subvector_with_stride
     (v : access constant gsl_vector_short;
      i : stddef_h.size_t;
      stride : stddef_h.size_t;
      n : stddef_h.size_t) return u_gsl_vector_short_const_view  -- /usr/include/gsl/gsl_vector_short.h:119
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_const_subvector_with_stride";

  -- Operations  
   procedure gsl_vector_short_set_zero (v : access gsl_vector_short)  -- /usr/include/gsl/gsl_vector_short.h:126
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_set_zero";

   procedure gsl_vector_short_set_all (v : access gsl_vector_short; x : short)  -- /usr/include/gsl/gsl_vector_short.h:127
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_set_all";

   function gsl_vector_short_set_basis (v : access gsl_vector_short; i : stddef_h.size_t) return int  -- /usr/include/gsl/gsl_vector_short.h:128
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_set_basis";




   function gsl_vector_short_memcpy (dest : access gsl_vector_short; src : access constant gsl_vector_short) return int  -- /usr/include/gsl/gsl_vector_short.h:136
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_memcpy";

   function gsl_vector_short_reverse (v : access gsl_vector_short) return int  -- /usr/include/gsl/gsl_vector_short.h:138
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_reverse";

   function gsl_vector_short_swap (v : access gsl_vector_short; w : access gsl_vector_short) return int  -- /usr/include/gsl/gsl_vector_short.h:140
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_swap";

   function gsl_vector_short_swap_elements
     (v : access gsl_vector_short;
      i : stddef_h.size_t;
      j : stddef_h.size_t) return int  -- /usr/include/gsl/gsl_vector_short.h:141
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_swap_elements";

   function gsl_vector_short_max (v : access constant gsl_vector_short) return short  -- /usr/include/gsl/gsl_vector_short.h:143
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_max";

   function gsl_vector_short_min (v : access constant gsl_vector_short) return short  -- /usr/include/gsl/gsl_vector_short.h:144
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_min";

   procedure gsl_vector_short_minmax
     (v : access constant gsl_vector_short;
      min_out : access short;
      max_out : access short)  -- /usr/include/gsl/gsl_vector_short.h:145
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_minmax";

   function gsl_vector_short_max_index (v : access constant gsl_vector_short) return stddef_h.size_t  -- /usr/include/gsl/gsl_vector_short.h:147
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_max_index";

   function gsl_vector_short_min_index (v : access constant gsl_vector_short) return stddef_h.size_t  -- /usr/include/gsl/gsl_vector_short.h:148
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_min_index";

   procedure gsl_vector_short_minmax_index
     (v : access constant gsl_vector_short;
      imin : access stddef_h.size_t;
      imax : access stddef_h.size_t)  -- /usr/include/gsl/gsl_vector_short.h:149
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_minmax_index";

   function gsl_vector_short_add (a : access gsl_vector_short; b : access constant gsl_vector_short) return int  -- /usr/include/gsl/gsl_vector_short.h:151
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_add";

   function gsl_vector_short_sub (a : access gsl_vector_short; b : access constant gsl_vector_short) return int  -- /usr/include/gsl/gsl_vector_short.h:152
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_sub";

   function gsl_vector_short_mul (a : access gsl_vector_short; b : access constant gsl_vector_short) return int  -- /usr/include/gsl/gsl_vector_short.h:153
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_mul";

   function gsl_vector_short_div (a : access gsl_vector_short; b : access constant gsl_vector_short) return int  -- /usr/include/gsl/gsl_vector_short.h:154
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_div";

   function gsl_vector_short_scale (a : access gsl_vector_short; x : short) return int  -- /usr/include/gsl/gsl_vector_short.h:155
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_scale";

   function gsl_vector_short_add_constant (a : access gsl_vector_short; x : short) return int  -- /usr/include/gsl/gsl_vector_short.h:156
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_add_constant";

   function gsl_vector_short_axpby
     (alpha : short;
      x : access constant gsl_vector_short;
      beta : short;
      y : access gsl_vector_short) return int  -- /usr/include/gsl/gsl_vector_short.h:157
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_axpby";

   function gsl_vector_short_sum (a : access constant gsl_vector_short) return short  -- /usr/include/gsl/gsl_vector_short.h:158
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_sum";

   function gsl_vector_short_equal (u : access constant gsl_vector_short; v : access constant gsl_vector_short) return int  -- /usr/include/gsl/gsl_vector_short.h:160
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_equal";

   function gsl_vector_short_isnull (v : access constant gsl_vector_short) return int  -- /usr/include/gsl/gsl_vector_short.h:163
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_isnull";

   function gsl_vector_short_ispos (v : access constant gsl_vector_short) return int  -- /usr/include/gsl/gsl_vector_short.h:164
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_ispos";

   function gsl_vector_short_isneg (v : access constant gsl_vector_short) return int  -- /usr/include/gsl/gsl_vector_short.h:165
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_isneg";

   function gsl_vector_short_isnonneg (v : access constant gsl_vector_short) return int  -- /usr/include/gsl/gsl_vector_short.h:166
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_isnonneg";

   function gsl_vector_short_get (v : access constant gsl_vector_short; i : stddef_h.size_t) return short  -- /usr/include/gsl/gsl_vector_short.h:168
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_get";

   procedure gsl_vector_short_set
     (v : access gsl_vector_short;
      i : stddef_h.size_t;
      x : short)  -- /usr/include/gsl/gsl_vector_short.h:169
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_set";

   function gsl_vector_short_ptr (v : access gsl_vector_short; i : stddef_h.size_t) return access short  -- /usr/include/gsl/gsl_vector_short.h:170
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_ptr";

   function gsl_vector_short_const_ptr (v : access constant gsl_vector_short; i : stddef_h.size_t) return access short  -- /usr/include/gsl/gsl_vector_short.h:171
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_short_const_ptr";

end gsl_gsl_vector_short_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
