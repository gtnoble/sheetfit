pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with stddef_h;
limited with gsl_gsl_block_long_double_h;

with Interfaces.C.Strings;

package gsl_gsl_vector_long_double_h is

   -- vector/gsl_vector_long_double.h
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

   type gsl_vector_long_double is record
      size   : aliased stddef_h
        .size_t;  -- /usr/include/gsl/gsl_vector_long_double.h:44
      stride : aliased stddef_h
        .size_t;  -- /usr/include/gsl/gsl_vector_long_double.h:45
      data : access long_double;  -- /usr/include/gsl/gsl_vector_long_double.h:46
      block  : access gsl_gsl_block_long_double_h
        .gsl_block_long_double_struct;  -- /usr/include/gsl/gsl_vector_long_double.h:47
      owner  : aliased int;  -- /usr/include/gsl/gsl_vector_long_double.h:48
   end record with
     Convention =>
      C_Pass_By_Copy;  -- /usr/include/gsl/gsl_vector_long_double.h:50

   type u_gsl_vector_long_double_view is record
      vector : aliased gsl_vector_long_double;  -- /usr/include/gsl/gsl_vector_long_double.h:54
   end record with
     Convention =>
      C_Pass_By_Copy;  -- /usr/include/gsl/gsl_vector_long_double.h:55

   subtype gsl_vector_long_double_view is
     u_gsl_vector_long_double_view;  -- /usr/include/gsl/gsl_vector_long_double.h:57

   type u_gsl_vector_long_double_const_view is record
      vector : aliased gsl_vector_long_double;  -- /usr/include/gsl/gsl_vector_long_double.h:61
   end record with
     Convention =>
      C_Pass_By_Copy;  -- /usr/include/gsl/gsl_vector_long_double.h:62

   subtype gsl_vector_long_double_const_view is
     u_gsl_vector_long_double_const_view;  -- /usr/include/gsl/gsl_vector_long_double.h:64

   -- Allocation
   function gsl_vector_long_double_alloc
     (n : stddef_h.size_t)
      return access gsl_vector_long_double  -- /usr/include/gsl/gsl_vector_long_double.h:69
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_alloc";

   function gsl_vector_long_double_calloc
     (n : stddef_h.size_t)
      return access gsl_vector_long_double  -- /usr/include/gsl/gsl_vector_long_double.h:70
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_calloc";

   function gsl_vector_long_double_alloc_from_block
     (b      : access gsl_gsl_block_long_double_h.gsl_block_long_double_struct;
      offset : stddef_h.size_t; n : stddef_h.size_t; stride : stddef_h.size_t)
      return access gsl_vector_long_double  -- /usr/include/gsl/gsl_vector_long_double.h:72
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_alloc_from_block";

   function gsl_vector_long_double_alloc_from_vector
     (v : access gsl_vector_long_double; offset : stddef_h.size_t;
      n : stddef_h.size_t; stride : stddef_h.size_t)
      return access gsl_vector_long_double  -- /usr/include/gsl/gsl_vector_long_double.h:77
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_alloc_from_vector";

   procedure gsl_vector_long_double_free
     (v : access gsl_vector_long_double)  -- /usr/include/gsl/gsl_vector_long_double.h:82
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_free";

   -- Views
   function gsl_vector_long_double_view_array
     (v : access long_double; n : stddef_h.size_t)
      return u_gsl_vector_long_double_view  -- /usr/include/gsl/gsl_vector_long_double.h:87
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_view_array";

   function gsl_vector_long_double_view_array_with_stride
     (base : access long_double; stride : stddef_h.size_t; n : stddef_h.size_t)
      return u_gsl_vector_long_double_view  -- /usr/include/gsl/gsl_vector_long_double.h:90
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_view_array_with_stride";

   function gsl_vector_long_double_const_view_array
     (v : access long_double; n : stddef_h.size_t)
      return u_gsl_vector_long_double_const_view  -- /usr/include/gsl/gsl_vector_long_double.h:95
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_const_view_array";

   function gsl_vector_long_double_const_view_array_with_stride
     (base : access long_double; stride : stddef_h.size_t; n : stddef_h.size_t)
      return u_gsl_vector_long_double_const_view  -- /usr/include/gsl/gsl_vector_long_double.h:98
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_const_view_array_with_stride";

   function gsl_vector_long_double_subvector
     (v : access gsl_vector_long_double; i : stddef_h.size_t;
      n : stddef_h.size_t)
      return u_gsl_vector_long_double_view  -- /usr/include/gsl/gsl_vector_long_double.h:103
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_subvector";

   function gsl_vector_long_double_subvector_with_stride
     (v      : access gsl_vector_long_double; i : stddef_h.size_t;
      stride : stddef_h.size_t; n : stddef_h.size_t)
      return u_gsl_vector_long_double_view  -- /usr/include/gsl/gsl_vector_long_double.h:108
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_subvector_with_stride";

   function gsl_vector_long_double_const_subvector
     (v : access constant gsl_vector_long_double; i : stddef_h.size_t;
      n : stddef_h.size_t)
      return u_gsl_vector_long_double_const_view  -- /usr/include/gsl/gsl_vector_long_double.h:114
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_const_subvector";

   function gsl_vector_long_double_const_subvector_with_stride
     (v      : access constant gsl_vector_long_double; i : stddef_h.size_t;
      stride : stddef_h.size_t; n : stddef_h.size_t)
      return u_gsl_vector_long_double_const_view  -- /usr/include/gsl/gsl_vector_long_double.h:119
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_const_subvector_with_stride";

   -- Operations
   procedure gsl_vector_long_double_set_zero
     (v : access gsl_vector_long_double)  -- /usr/include/gsl/gsl_vector_long_double.h:126
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_set_zero";

   procedure gsl_vector_long_double_set_all
     (v : access gsl_vector_long_double;
      x : long_double)  -- /usr/include/gsl/gsl_vector_long_double.h:127
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_set_all";

   function gsl_vector_long_double_set_basis
     (v : access gsl_vector_long_double;
      i : stddef_h.size_t)
      return int  -- /usr/include/gsl/gsl_vector_long_double.h:128
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_set_basis";

   function gsl_vector_long_double_memcpy
     (dest : access gsl_vector_long_double;
      src  : access constant gsl_vector_long_double)
      return int  -- /usr/include/gsl/gsl_vector_long_double.h:136
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_memcpy";

   function gsl_vector_long_double_reverse
     (v : access gsl_vector_long_double)
      return int  -- /usr/include/gsl/gsl_vector_long_double.h:138
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_reverse";

   function gsl_vector_long_double_swap
     (v : access gsl_vector_long_double; w : access gsl_vector_long_double)
      return int  -- /usr/include/gsl/gsl_vector_long_double.h:140
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_swap";

   function gsl_vector_long_double_swap_elements
     (v : access gsl_vector_long_double; i : stddef_h.size_t;
      j : stddef_h.size_t)
      return int  -- /usr/include/gsl/gsl_vector_long_double.h:141
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_swap_elements";

   function gsl_vector_long_double_max
     (v : access constant gsl_vector_long_double)
      return long_double  -- /usr/include/gsl/gsl_vector_long_double.h:143
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_max";

   function gsl_vector_long_double_min
     (v : access constant gsl_vector_long_double)
      return long_double  -- /usr/include/gsl/gsl_vector_long_double.h:144
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_min";

   procedure gsl_vector_long_double_minmax
     (v : access constant gsl_vector_long_double; min_out : access long_double;
      max_out : access long_double)  -- /usr/include/gsl/gsl_vector_long_double.h:145
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_minmax";

   function gsl_vector_long_double_max_index
     (v : access constant gsl_vector_long_double) return stddef_h
     .size_t  -- /usr/include/gsl/gsl_vector_long_double.h:147
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_max_index";

   function gsl_vector_long_double_min_index
     (v : access constant gsl_vector_long_double) return stddef_h
     .size_t  -- /usr/include/gsl/gsl_vector_long_double.h:148
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_min_index";

   procedure gsl_vector_long_double_minmax_index
     (v               : access constant gsl_vector_long_double;
      imin            : access stddef_h
        .size_t; imax : access stddef_h
        .size_t)  -- /usr/include/gsl/gsl_vector_long_double.h:149
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_minmax_index";

   function gsl_vector_long_double_add
     (a : access gsl_vector_long_double;
      b : access constant gsl_vector_long_double)
      return int  -- /usr/include/gsl/gsl_vector_long_double.h:151
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_add";

   function gsl_vector_long_double_sub
     (a : access gsl_vector_long_double;
      b : access constant gsl_vector_long_double)
      return int  -- /usr/include/gsl/gsl_vector_long_double.h:152
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_sub";

   function gsl_vector_long_double_mul
     (a : access gsl_vector_long_double;
      b : access constant gsl_vector_long_double)
      return int  -- /usr/include/gsl/gsl_vector_long_double.h:153
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_mul";

   function gsl_vector_long_double_div
     (a : access gsl_vector_long_double;
      b : access constant gsl_vector_long_double)
      return int  -- /usr/include/gsl/gsl_vector_long_double.h:154
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_div";

   function gsl_vector_long_double_scale
     (a : access gsl_vector_long_double;
      x : long_double)
      return int  -- /usr/include/gsl/gsl_vector_long_double.h:155
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_scale";

   function gsl_vector_long_double_add_constant
     (a : access gsl_vector_long_double;
      x : long_double)
      return int  -- /usr/include/gsl/gsl_vector_long_double.h:156
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_add_constant";

   function gsl_vector_long_double_axpby
     (alpha : long_double; x : access constant gsl_vector_long_double;
      beta  : long_double;
      y     : access gsl_vector_long_double)
      return int  -- /usr/include/gsl/gsl_vector_long_double.h:157
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_axpby";

   function gsl_vector_long_double_sum
     (a : access constant gsl_vector_long_double)
      return long_double  -- /usr/include/gsl/gsl_vector_long_double.h:158
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_sum";

   function gsl_vector_long_double_equal
     (u : access constant gsl_vector_long_double;
      v : access constant gsl_vector_long_double)
      return int  -- /usr/include/gsl/gsl_vector_long_double.h:160
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_equal";

   function gsl_vector_long_double_isnull
     (v : access constant gsl_vector_long_double)
      return int  -- /usr/include/gsl/gsl_vector_long_double.h:163
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_isnull";

   function gsl_vector_long_double_ispos
     (v : access constant gsl_vector_long_double)
      return int  -- /usr/include/gsl/gsl_vector_long_double.h:164
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_ispos";

   function gsl_vector_long_double_isneg
     (v : access constant gsl_vector_long_double)
      return int  -- /usr/include/gsl/gsl_vector_long_double.h:165
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_isneg";

   function gsl_vector_long_double_isnonneg
     (v : access constant gsl_vector_long_double)
      return int  -- /usr/include/gsl/gsl_vector_long_double.h:166
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_isnonneg";

   function gsl_vector_long_double_get
     (v : access constant gsl_vector_long_double; i : stddef_h.size_t)
      return long_double  -- /usr/include/gsl/gsl_vector_long_double.h:168
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_get";

   procedure gsl_vector_long_double_set
     (v : access gsl_vector_long_double; i : stddef_h.size_t;
      x : long_double)  -- /usr/include/gsl/gsl_vector_long_double.h:169
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_set";

   function gsl_vector_long_double_ptr
     (v : access gsl_vector_long_double; i : stddef_h.size_t)
      return access long_double  -- /usr/include/gsl/gsl_vector_long_double.h:170
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_ptr";

   function gsl_vector_long_double_const_ptr
     (v : access constant gsl_vector_long_double; i : stddef_h.size_t)
      return access long_double  -- /usr/include/gsl/gsl_vector_long_double.h:171
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_long_double_const_ptr";

end gsl_gsl_vector_long_double_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
