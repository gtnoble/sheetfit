pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with stddef_h;
limited with gsl_gsl_block_uchar_h;

with Interfaces.C.Strings;

package gsl_gsl_vector_uchar_h is

   -- vector/gsl_vector_uchar.h
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

   type gsl_vector_uchar is record
      size   : aliased stddef_h
        .size_t;  -- /usr/include/gsl/gsl_vector_uchar.h:44
      stride : aliased stddef_h
        .size_t;  -- /usr/include/gsl/gsl_vector_uchar.h:45
      data   : access unsigned_char;  -- /usr/include/gsl/gsl_vector_uchar.h:46
      block  : access gsl_gsl_block_uchar_h
        .gsl_block_uchar_struct;  -- /usr/include/gsl/gsl_vector_uchar.h:47
      owner  : aliased int;  -- /usr/include/gsl/gsl_vector_uchar.h:48
   end record with
     Convention => C_Pass_By_Copy;  -- /usr/include/gsl/gsl_vector_uchar.h:50

   type u_gsl_vector_uchar_view is record
      vector : aliased gsl_vector_uchar;  -- /usr/include/gsl/gsl_vector_uchar.h:54
   end record with
     Convention => C_Pass_By_Copy;  -- /usr/include/gsl/gsl_vector_uchar.h:55

   subtype gsl_vector_uchar_view is
     u_gsl_vector_uchar_view;  -- /usr/include/gsl/gsl_vector_uchar.h:57

   type u_gsl_vector_uchar_const_view is record
      vector : aliased gsl_vector_uchar;  -- /usr/include/gsl/gsl_vector_uchar.h:61
   end record with
     Convention => C_Pass_By_Copy;  -- /usr/include/gsl/gsl_vector_uchar.h:62

   subtype gsl_vector_uchar_const_view is
     u_gsl_vector_uchar_const_view;  -- /usr/include/gsl/gsl_vector_uchar.h:64

   -- Allocation
   function gsl_vector_uchar_alloc
     (n : stddef_h.size_t)
      return access gsl_vector_uchar  -- /usr/include/gsl/gsl_vector_uchar.h:69
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_uchar_alloc";

   function gsl_vector_uchar_calloc
     (n : stddef_h.size_t)
      return access gsl_vector_uchar  -- /usr/include/gsl/gsl_vector_uchar.h:70
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_uchar_calloc";

   function gsl_vector_uchar_alloc_from_block
     (b      : access gsl_gsl_block_uchar_h.gsl_block_uchar_struct;
      offset : stddef_h.size_t; n : stddef_h.size_t; stride : stddef_h.size_t)
      return access gsl_vector_uchar  -- /usr/include/gsl/gsl_vector_uchar.h:72
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_uchar_alloc_from_block";

   function gsl_vector_uchar_alloc_from_vector
     (v : access gsl_vector_uchar; offset : stddef_h.size_t;
      n : stddef_h.size_t; stride : stddef_h.size_t)
      return access gsl_vector_uchar  -- /usr/include/gsl/gsl_vector_uchar.h:77
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_uchar_alloc_from_vector";

   procedure gsl_vector_uchar_free
     (v : access gsl_vector_uchar)  -- /usr/include/gsl/gsl_vector_uchar.h:82
   with
     Import => True, Convention => C, External_Name => "gsl_vector_uchar_free";

   -- Views
   function gsl_vector_uchar_view_array
     (v : access unsigned_char; n : stddef_h.size_t)
      return u_gsl_vector_uchar_view  -- /usr/include/gsl/gsl_vector_uchar.h:87
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_uchar_view_array";

   function gsl_vector_uchar_view_array_with_stride
     (base : access unsigned_char; stride : stddef_h.size_t;
      n    : stddef_h.size_t)
      return u_gsl_vector_uchar_view  -- /usr/include/gsl/gsl_vector_uchar.h:90
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_uchar_view_array_with_stride";

   function gsl_vector_uchar_const_view_array
     (v : access unsigned_char; n : stddef_h.size_t)
      return u_gsl_vector_uchar_const_view  -- /usr/include/gsl/gsl_vector_uchar.h:95
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_uchar_const_view_array";

   function gsl_vector_uchar_const_view_array_with_stride
     (base : access unsigned_char; stride : stddef_h.size_t;
      n    : stddef_h.size_t)
      return u_gsl_vector_uchar_const_view  -- /usr/include/gsl/gsl_vector_uchar.h:98
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_uchar_const_view_array_with_stride";

   function gsl_vector_uchar_subvector
     (v : access gsl_vector_uchar; i : stddef_h.size_t; n : stddef_h.size_t)
      return u_gsl_vector_uchar_view  -- /usr/include/gsl/gsl_vector_uchar.h:103
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_uchar_subvector";

   function gsl_vector_uchar_subvector_with_stride
     (v      : access gsl_vector_uchar; i : stddef_h.size_t;
      stride : stddef_h.size_t; n : stddef_h.size_t)
      return u_gsl_vector_uchar_view  -- /usr/include/gsl/gsl_vector_uchar.h:108
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_uchar_subvector_with_stride";

   function gsl_vector_uchar_const_subvector
     (v : access constant gsl_vector_uchar; i : stddef_h.size_t;
      n : stddef_h.size_t)
      return u_gsl_vector_uchar_const_view  -- /usr/include/gsl/gsl_vector_uchar.h:114
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_uchar_const_subvector";

   function gsl_vector_uchar_const_subvector_with_stride
     (v      : access constant gsl_vector_uchar; i : stddef_h.size_t;
      stride : stddef_h.size_t; n : stddef_h.size_t)
      return u_gsl_vector_uchar_const_view  -- /usr/include/gsl/gsl_vector_uchar.h:119
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_uchar_const_subvector_with_stride";

   -- Operations
   procedure gsl_vector_uchar_set_zero
     (v : access gsl_vector_uchar)  -- /usr/include/gsl/gsl_vector_uchar.h:126
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_uchar_set_zero";

   procedure gsl_vector_uchar_set_all
     (v : access gsl_vector_uchar;
      x : unsigned_char)  -- /usr/include/gsl/gsl_vector_uchar.h:127
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_uchar_set_all";

   function gsl_vector_uchar_set_basis
     (v : access gsl_vector_uchar;
      i : stddef_h.size_t)
      return int  -- /usr/include/gsl/gsl_vector_uchar.h:128
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_uchar_set_basis";

   function gsl_vector_uchar_memcpy
     (dest : access gsl_vector_uchar; src : access constant gsl_vector_uchar)
      return int  -- /usr/include/gsl/gsl_vector_uchar.h:136
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_uchar_memcpy";

   function gsl_vector_uchar_reverse
     (v : access gsl_vector_uchar)
      return int  -- /usr/include/gsl/gsl_vector_uchar.h:138
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_uchar_reverse";

   function gsl_vector_uchar_swap
     (v : access gsl_vector_uchar;
      w : access gsl_vector_uchar)
      return int  -- /usr/include/gsl/gsl_vector_uchar.h:140
   with
     Import => True, Convention => C, External_Name => "gsl_vector_uchar_swap";

   function gsl_vector_uchar_swap_elements
     (v : access gsl_vector_uchar; i : stddef_h.size_t; j : stddef_h.size_t)
      return int  -- /usr/include/gsl/gsl_vector_uchar.h:141
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_uchar_swap_elements";

   function gsl_vector_uchar_max
     (v : access constant gsl_vector_uchar)
      return unsigned_char  -- /usr/include/gsl/gsl_vector_uchar.h:143
   with
     Import => True, Convention => C, External_Name => "gsl_vector_uchar_max";

   function gsl_vector_uchar_min
     (v : access constant gsl_vector_uchar)
      return unsigned_char  -- /usr/include/gsl/gsl_vector_uchar.h:144
   with
     Import => True, Convention => C, External_Name => "gsl_vector_uchar_min";

   procedure gsl_vector_uchar_minmax
     (v : access constant gsl_vector_uchar; min_out : access unsigned_char;
      max_out : access unsigned_char)  -- /usr/include/gsl/gsl_vector_uchar.h:145
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_uchar_minmax";

   function gsl_vector_uchar_max_index
     (v : access constant gsl_vector_uchar) return stddef_h
     .size_t  -- /usr/include/gsl/gsl_vector_uchar.h:147
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_uchar_max_index";

   function gsl_vector_uchar_min_index
     (v : access constant gsl_vector_uchar) return stddef_h
     .size_t  -- /usr/include/gsl/gsl_vector_uchar.h:148
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_uchar_min_index";

   procedure gsl_vector_uchar_minmax_index
     (v    : access constant gsl_vector_uchar; imin : access stddef_h.size_t;
      imax : access stddef_h
        .size_t)  -- /usr/include/gsl/gsl_vector_uchar.h:149
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_uchar_minmax_index";

   function gsl_vector_uchar_add
     (a : access gsl_vector_uchar; b : access constant gsl_vector_uchar)
      return int  -- /usr/include/gsl/gsl_vector_uchar.h:151
   with
     Import => True, Convention => C, External_Name => "gsl_vector_uchar_add";

   function gsl_vector_uchar_sub
     (a : access gsl_vector_uchar; b : access constant gsl_vector_uchar)
      return int  -- /usr/include/gsl/gsl_vector_uchar.h:152
   with
     Import => True, Convention => C, External_Name => "gsl_vector_uchar_sub";

   function gsl_vector_uchar_mul
     (a : access gsl_vector_uchar; b : access constant gsl_vector_uchar)
      return int  -- /usr/include/gsl/gsl_vector_uchar.h:153
   with
     Import => True, Convention => C, External_Name => "gsl_vector_uchar_mul";

   function gsl_vector_uchar_div
     (a : access gsl_vector_uchar; b : access constant gsl_vector_uchar)
      return int  -- /usr/include/gsl/gsl_vector_uchar.h:154
   with
     Import => True, Convention => C, External_Name => "gsl_vector_uchar_div";

   function gsl_vector_uchar_scale
     (a : access gsl_vector_uchar;
      x : unsigned_char)
      return int  -- /usr/include/gsl/gsl_vector_uchar.h:155
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_uchar_scale";

   function gsl_vector_uchar_add_constant
     (a : access gsl_vector_uchar;
      x : unsigned_char)
      return int  -- /usr/include/gsl/gsl_vector_uchar.h:156
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_uchar_add_constant";

   function gsl_vector_uchar_axpby
     (alpha : unsigned_char; x : access constant gsl_vector_uchar;
      beta  : unsigned_char;
      y     : access gsl_vector_uchar)
      return int  -- /usr/include/gsl/gsl_vector_uchar.h:157
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_uchar_axpby";

   function gsl_vector_uchar_sum
     (a : access constant gsl_vector_uchar)
      return unsigned_char  -- /usr/include/gsl/gsl_vector_uchar.h:158
   with
     Import => True, Convention => C, External_Name => "gsl_vector_uchar_sum";

   function gsl_vector_uchar_equal
     (u : access constant gsl_vector_uchar;
      v : access constant gsl_vector_uchar)
      return int  -- /usr/include/gsl/gsl_vector_uchar.h:160
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_uchar_equal";

   function gsl_vector_uchar_isnull
     (v : access constant gsl_vector_uchar)
      return int  -- /usr/include/gsl/gsl_vector_uchar.h:163
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_uchar_isnull";

   function gsl_vector_uchar_ispos
     (v : access constant gsl_vector_uchar)
      return int  -- /usr/include/gsl/gsl_vector_uchar.h:164
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_uchar_ispos";

   function gsl_vector_uchar_isneg
     (v : access constant gsl_vector_uchar)
      return int  -- /usr/include/gsl/gsl_vector_uchar.h:165
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_uchar_isneg";

   function gsl_vector_uchar_isnonneg
     (v : access constant gsl_vector_uchar)
      return int  -- /usr/include/gsl/gsl_vector_uchar.h:166
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_uchar_isnonneg";

   function gsl_vector_uchar_get
     (v : access constant gsl_vector_uchar; i : stddef_h.size_t)
      return unsigned_char  -- /usr/include/gsl/gsl_vector_uchar.h:168
   with
     Import => True, Convention => C, External_Name => "gsl_vector_uchar_get";

   procedure gsl_vector_uchar_set
     (v : access gsl_vector_uchar;
      i : stddef_h.size_t;
      x : unsigned_char)  -- /usr/include/gsl/gsl_vector_uchar.h:169
   with
     Import => True, Convention => C, External_Name => "gsl_vector_uchar_set";

   function gsl_vector_uchar_ptr
     (v : access gsl_vector_uchar; i : stddef_h.size_t)
      return access unsigned_char  -- /usr/include/gsl/gsl_vector_uchar.h:170
   with
     Import => True, Convention => C, External_Name => "gsl_vector_uchar_ptr";

   function gsl_vector_uchar_const_ptr
     (v : access constant gsl_vector_uchar; i : stddef_h.size_t)
      return access unsigned_char  -- /usr/include/gsl/gsl_vector_uchar.h:171
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_uchar_const_ptr";

end gsl_gsl_vector_uchar_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
