pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with stddef_h;
limited with gsl_gsl_block_int_h;

with Interfaces.C.Strings;

package gsl_gsl_vector_int_h is

  -- vector/gsl_vector_int.h
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

   type gsl_vector_int is record
      size : aliased stddef_h.size_t;  -- /usr/include/gsl/gsl_vector_int.h:44
      stride : aliased stddef_h.size_t;  -- /usr/include/gsl/gsl_vector_int.h:45
      data : access int;  -- /usr/include/gsl/gsl_vector_int.h:46
      block : access gsl_gsl_block_int_h.gsl_block_int_struct;  -- /usr/include/gsl/gsl_vector_int.h:47
      owner : aliased int;  -- /usr/include/gsl/gsl_vector_int.h:48
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/gsl/gsl_vector_int.h:50

   type u_gsl_vector_int_view is record
      vector : aliased gsl_vector_int;  -- /usr/include/gsl/gsl_vector_int.h:54
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/gsl/gsl_vector_int.h:55

   subtype gsl_vector_int_view is u_gsl_vector_int_view;  -- /usr/include/gsl/gsl_vector_int.h:57

   type u_gsl_vector_int_const_view is record
      vector : aliased gsl_vector_int;  -- /usr/include/gsl/gsl_vector_int.h:61
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/gsl/gsl_vector_int.h:62

   subtype gsl_vector_int_const_view is u_gsl_vector_int_const_view;  -- /usr/include/gsl/gsl_vector_int.h:64

  -- Allocation  
   function gsl_vector_int_alloc (n : stddef_h.size_t) return access gsl_vector_int  -- /usr/include/gsl/gsl_vector_int.h:69
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_alloc";

   function gsl_vector_int_calloc (n : stddef_h.size_t) return access gsl_vector_int  -- /usr/include/gsl/gsl_vector_int.h:70
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_calloc";

   function gsl_vector_int_alloc_from_block
     (b : access gsl_gsl_block_int_h.gsl_block_int_struct;
      offset : stddef_h.size_t;
      n : stddef_h.size_t;
      stride : stddef_h.size_t) return access gsl_vector_int  -- /usr/include/gsl/gsl_vector_int.h:72
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_alloc_from_block";

   function gsl_vector_int_alloc_from_vector
     (v : access gsl_vector_int;
      offset : stddef_h.size_t;
      n : stddef_h.size_t;
      stride : stddef_h.size_t) return access gsl_vector_int  -- /usr/include/gsl/gsl_vector_int.h:77
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_alloc_from_vector";

   procedure gsl_vector_int_free (v : access gsl_vector_int)  -- /usr/include/gsl/gsl_vector_int.h:82
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_free";

  -- Views  
   function gsl_vector_int_view_array (v : access int; n : stddef_h.size_t) return u_gsl_vector_int_view  -- /usr/include/gsl/gsl_vector_int.h:87
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_view_array";

   function gsl_vector_int_view_array_with_stride
     (base : access int;
      stride : stddef_h.size_t;
      n : stddef_h.size_t) return u_gsl_vector_int_view  -- /usr/include/gsl/gsl_vector_int.h:90
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_view_array_with_stride";

   function gsl_vector_int_const_view_array (v : access int; n : stddef_h.size_t) return u_gsl_vector_int_const_view  -- /usr/include/gsl/gsl_vector_int.h:95
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_const_view_array";

   function gsl_vector_int_const_view_array_with_stride
     (base : access int;
      stride : stddef_h.size_t;
      n : stddef_h.size_t) return u_gsl_vector_int_const_view  -- /usr/include/gsl/gsl_vector_int.h:98
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_const_view_array_with_stride";

   function gsl_vector_int_subvector
     (v : access gsl_vector_int;
      i : stddef_h.size_t;
      n : stddef_h.size_t) return u_gsl_vector_int_view  -- /usr/include/gsl/gsl_vector_int.h:103
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_subvector";

   function gsl_vector_int_subvector_with_stride
     (v : access gsl_vector_int;
      i : stddef_h.size_t;
      stride : stddef_h.size_t;
      n : stddef_h.size_t) return u_gsl_vector_int_view  -- /usr/include/gsl/gsl_vector_int.h:108
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_subvector_with_stride";

   function gsl_vector_int_const_subvector
     (v : access constant gsl_vector_int;
      i : stddef_h.size_t;
      n : stddef_h.size_t) return u_gsl_vector_int_const_view  -- /usr/include/gsl/gsl_vector_int.h:114
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_const_subvector";

   function gsl_vector_int_const_subvector_with_stride
     (v : access constant gsl_vector_int;
      i : stddef_h.size_t;
      stride : stddef_h.size_t;
      n : stddef_h.size_t) return u_gsl_vector_int_const_view  -- /usr/include/gsl/gsl_vector_int.h:119
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_const_subvector_with_stride";

  -- Operations  
   procedure gsl_vector_int_set_zero (v : access gsl_vector_int)  -- /usr/include/gsl/gsl_vector_int.h:126
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_set_zero";

   procedure gsl_vector_int_set_all (v : access gsl_vector_int; x : int)  -- /usr/include/gsl/gsl_vector_int.h:127
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_set_all";

   function gsl_vector_int_set_basis (v : access gsl_vector_int; i : stddef_h.size_t) return int  -- /usr/include/gsl/gsl_vector_int.h:128
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_set_basis";




   function gsl_vector_int_memcpy (dest : access gsl_vector_int; src : access constant gsl_vector_int) return int  -- /usr/include/gsl/gsl_vector_int.h:136
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_memcpy";

   function gsl_vector_int_reverse (v : access gsl_vector_int) return int  -- /usr/include/gsl/gsl_vector_int.h:138
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_reverse";

   function gsl_vector_int_swap (v : access gsl_vector_int; w : access gsl_vector_int) return int  -- /usr/include/gsl/gsl_vector_int.h:140
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_swap";

   function gsl_vector_int_swap_elements
     (v : access gsl_vector_int;
      i : stddef_h.size_t;
      j : stddef_h.size_t) return int  -- /usr/include/gsl/gsl_vector_int.h:141
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_swap_elements";

   function gsl_vector_int_max (v : access constant gsl_vector_int) return int  -- /usr/include/gsl/gsl_vector_int.h:143
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_max";

   function gsl_vector_int_min (v : access constant gsl_vector_int) return int  -- /usr/include/gsl/gsl_vector_int.h:144
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_min";

   procedure gsl_vector_int_minmax
     (v : access constant gsl_vector_int;
      min_out : access int;
      max_out : access int)  -- /usr/include/gsl/gsl_vector_int.h:145
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_minmax";

   function gsl_vector_int_max_index (v : access constant gsl_vector_int) return stddef_h.size_t  -- /usr/include/gsl/gsl_vector_int.h:147
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_max_index";

   function gsl_vector_int_min_index (v : access constant gsl_vector_int) return stddef_h.size_t  -- /usr/include/gsl/gsl_vector_int.h:148
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_min_index";

   procedure gsl_vector_int_minmax_index
     (v : access constant gsl_vector_int;
      imin : access stddef_h.size_t;
      imax : access stddef_h.size_t)  -- /usr/include/gsl/gsl_vector_int.h:149
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_minmax_index";

   function gsl_vector_int_add (a : access gsl_vector_int; b : access constant gsl_vector_int) return int  -- /usr/include/gsl/gsl_vector_int.h:151
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_add";

   function gsl_vector_int_sub (a : access gsl_vector_int; b : access constant gsl_vector_int) return int  -- /usr/include/gsl/gsl_vector_int.h:152
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_sub";

   function gsl_vector_int_mul (a : access gsl_vector_int; b : access constant gsl_vector_int) return int  -- /usr/include/gsl/gsl_vector_int.h:153
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_mul";

   function gsl_vector_int_div (a : access gsl_vector_int; b : access constant gsl_vector_int) return int  -- /usr/include/gsl/gsl_vector_int.h:154
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_div";

   function gsl_vector_int_scale (a : access gsl_vector_int; x : int) return int  -- /usr/include/gsl/gsl_vector_int.h:155
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_scale";

   function gsl_vector_int_add_constant (a : access gsl_vector_int; x : int) return int  -- /usr/include/gsl/gsl_vector_int.h:156
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_add_constant";

   function gsl_vector_int_axpby
     (alpha : int;
      x : access constant gsl_vector_int;
      beta : int;
      y : access gsl_vector_int) return int  -- /usr/include/gsl/gsl_vector_int.h:157
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_axpby";

   function gsl_vector_int_sum (a : access constant gsl_vector_int) return int  -- /usr/include/gsl/gsl_vector_int.h:158
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_sum";

   function gsl_vector_int_equal (u : access constant gsl_vector_int; v : access constant gsl_vector_int) return int  -- /usr/include/gsl/gsl_vector_int.h:160
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_equal";

   function gsl_vector_int_isnull (v : access constant gsl_vector_int) return int  -- /usr/include/gsl/gsl_vector_int.h:163
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_isnull";

   function gsl_vector_int_ispos (v : access constant gsl_vector_int) return int  -- /usr/include/gsl/gsl_vector_int.h:164
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_ispos";

   function gsl_vector_int_isneg (v : access constant gsl_vector_int) return int  -- /usr/include/gsl/gsl_vector_int.h:165
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_isneg";

   function gsl_vector_int_isnonneg (v : access constant gsl_vector_int) return int  -- /usr/include/gsl/gsl_vector_int.h:166
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_isnonneg";

   function gsl_vector_int_get (v : access constant gsl_vector_int; i : stddef_h.size_t) return int  -- /usr/include/gsl/gsl_vector_int.h:168
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_get";

   procedure gsl_vector_int_set
     (v : access gsl_vector_int;
      i : stddef_h.size_t;
      x : int)  -- /usr/include/gsl/gsl_vector_int.h:169
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_set";

   function gsl_vector_int_ptr (v : access gsl_vector_int; i : stddef_h.size_t) return access int  -- /usr/include/gsl/gsl_vector_int.h:170
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_ptr";

   function gsl_vector_int_const_ptr (v : access constant gsl_vector_int; i : stddef_h.size_t) return access int  -- /usr/include/gsl/gsl_vector_int.h:171
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_const_ptr";

end gsl_gsl_vector_int_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
