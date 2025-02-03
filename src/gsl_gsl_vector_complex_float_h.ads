pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with stddef_h;
limited with gsl_gsl_block_complex_float_h;
with gsl_gsl_vector_float_h;
with gsl_gsl_complex_h;

with Interfaces.C.Strings;

package gsl_gsl_vector_complex_float_h is

   -- vector/gsl_vector_complex_float.h
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

   type gsl_vector_complex_float is record
      size   : aliased stddef_h
        .size_t;  -- /usr/include/gsl/gsl_vector_complex_float.h:46
      stride : aliased stddef_h
        .size_t;  -- /usr/include/gsl/gsl_vector_complex_float.h:47
      data   : access Float;  -- /usr/include/gsl/gsl_vector_complex_float.h:48
      block  : access gsl_gsl_block_complex_float_h
        .gsl_block_complex_float_struct;  -- /usr/include/gsl/gsl_vector_complex_float.h:49
      owner  : aliased int;  -- /usr/include/gsl/gsl_vector_complex_float.h:50
   end record with
     Convention =>
      C_Pass_By_Copy;  -- /usr/include/gsl/gsl_vector_complex_float.h:51

   type u_gsl_vector_complex_float_view is record
      vector : aliased gsl_vector_complex_float;  -- /usr/include/gsl/gsl_vector_complex_float.h:55
   end record with
     Convention =>
      C_Pass_By_Copy;  -- /usr/include/gsl/gsl_vector_complex_float.h:56

   subtype gsl_vector_complex_float_view is
     u_gsl_vector_complex_float_view;  -- /usr/include/gsl/gsl_vector_complex_float.h:58

   type u_gsl_vector_complex_float_const_view is record
      vector : aliased gsl_vector_complex_float;  -- /usr/include/gsl/gsl_vector_complex_float.h:62
   end record with
     Convention =>
      C_Pass_By_Copy;  -- /usr/include/gsl/gsl_vector_complex_float.h:63

   subtype gsl_vector_complex_float_const_view is
     u_gsl_vector_complex_float_const_view;  -- /usr/include/gsl/gsl_vector_complex_float.h:65

   -- Allocation
   function gsl_vector_complex_float_alloc
     (n : stddef_h.size_t)
      return access gsl_vector_complex_float  -- /usr/include/gsl/gsl_vector_complex_float.h:69
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_alloc";

   function gsl_vector_complex_float_calloc
     (n : stddef_h.size_t)
      return access gsl_vector_complex_float  -- /usr/include/gsl/gsl_vector_complex_float.h:70
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_calloc";

   function gsl_vector_complex_float_alloc_from_block
     (b : access gsl_gsl_block_complex_float_h.gsl_block_complex_float_struct;
      offset : stddef_h.size_t; n : stddef_h.size_t; stride : stddef_h.size_t)
      return access gsl_vector_complex_float  -- /usr/include/gsl/gsl_vector_complex_float.h:73
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_alloc_from_block";

   function gsl_vector_complex_float_alloc_from_vector
     (v : access gsl_vector_complex_float; offset : stddef_h.size_t;
      n : stddef_h.size_t; stride : stddef_h.size_t)
      return access gsl_vector_complex_float  -- /usr/include/gsl/gsl_vector_complex_float.h:79
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_alloc_from_vector";

   procedure gsl_vector_complex_float_free
     (v : access gsl_vector_complex_float)  -- /usr/include/gsl/gsl_vector_complex_float.h:84
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_free";

   -- Views
   function gsl_vector_complex_float_view_array
     (base : access Float; n : stddef_h.size_t)
      return u_gsl_vector_complex_float_view  -- /usr/include/gsl/gsl_vector_complex_float.h:89
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_view_array";

   function gsl_vector_complex_float_view_array_with_stride
     (base : access Float; stride : stddef_h.size_t; n : stddef_h.size_t)
      return u_gsl_vector_complex_float_view  -- /usr/include/gsl/gsl_vector_complex_float.h:93
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_view_array_with_stride";

   function gsl_vector_complex_float_const_view_array
     (base : access Float; n : stddef_h.size_t)
      return u_gsl_vector_complex_float_const_view  -- /usr/include/gsl/gsl_vector_complex_float.h:98
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_const_view_array";

   function gsl_vector_complex_float_const_view_array_with_stride
     (base : access Float; stride : stddef_h.size_t; n : stddef_h.size_t)
      return u_gsl_vector_complex_float_const_view  -- /usr/include/gsl/gsl_vector_complex_float.h:102
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_const_view_array_with_stride";

   function gsl_vector_complex_float_subvector
     (base : access gsl_vector_complex_float; i : stddef_h.size_t;
      n    : stddef_h.size_t)
      return u_gsl_vector_complex_float_view  -- /usr/include/gsl/gsl_vector_complex_float.h:107
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_subvector";

   function gsl_vector_complex_float_subvector_with_stride
     (v      : access gsl_vector_complex_float; i : stddef_h.size_t;
      stride : stddef_h.size_t; n : stddef_h.size_t)
      return u_gsl_vector_complex_float_view  -- /usr/include/gsl/gsl_vector_complex_float.h:113
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_subvector_with_stride";

   function gsl_vector_complex_float_const_subvector
     (base : access constant gsl_vector_complex_float; i : stddef_h.size_t;
      n    : stddef_h.size_t)
      return u_gsl_vector_complex_float_const_view  -- /usr/include/gsl/gsl_vector_complex_float.h:119
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_const_subvector";

   function gsl_vector_complex_float_const_subvector_with_stride
     (v      : access constant gsl_vector_complex_float; i : stddef_h.size_t;
      stride : stddef_h.size_t; n : stddef_h.size_t)
      return u_gsl_vector_complex_float_const_view  -- /usr/include/gsl/gsl_vector_complex_float.h:125
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_const_subvector_with_stride";

   function gsl_vector_complex_float_real
     (v : access gsl_vector_complex_float)
      return gsl_gsl_vector_float_h
     .u_gsl_vector_float_view  -- /usr/include/gsl/gsl_vector_complex_float.h:131
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_real";

   function gsl_vector_complex_float_imag
     (v : access gsl_vector_complex_float)
      return gsl_gsl_vector_float_h
     .u_gsl_vector_float_view  -- /usr/include/gsl/gsl_vector_complex_float.h:134
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_imag";

   function gsl_vector_complex_float_const_real
     (v : access constant gsl_vector_complex_float)
      return gsl_gsl_vector_float_h
     .u_gsl_vector_float_const_view  -- /usr/include/gsl/gsl_vector_complex_float.h:137
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_const_real";

   function gsl_vector_complex_float_const_imag
     (v : access constant gsl_vector_complex_float)
      return gsl_gsl_vector_float_h
     .u_gsl_vector_float_const_view  -- /usr/include/gsl/gsl_vector_complex_float.h:140
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_const_imag";

   -- Operations
   procedure gsl_vector_complex_float_set_zero
     (v : access gsl_vector_complex_float)  -- /usr/include/gsl/gsl_vector_complex_float.h:145
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_set_zero";

   procedure gsl_vector_complex_float_set_all
     (v : access gsl_vector_complex_float;
      z : gsl_gsl_complex_h
        .gsl_complex_float)  -- /usr/include/gsl/gsl_vector_complex_float.h:146
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_set_all";

   function gsl_vector_complex_float_set_basis
     (v : access gsl_vector_complex_float;
      i : stddef_h.size_t)
      return int  -- /usr/include/gsl/gsl_vector_complex_float.h:148
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_set_basis";

   function gsl_vector_complex_float_memcpy
     (dest : access gsl_vector_complex_float;
      src  : access constant gsl_vector_complex_float)
      return int  -- /usr/include/gsl/gsl_vector_complex_float.h:160
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_memcpy";

   function gsl_vector_complex_float_reverse
     (v : access gsl_vector_complex_float)
      return int  -- /usr/include/gsl/gsl_vector_complex_float.h:162
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_reverse";

   function gsl_vector_complex_float_swap
     (v : access gsl_vector_complex_float; w : access gsl_vector_complex_float)
      return int  -- /usr/include/gsl/gsl_vector_complex_float.h:164
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_swap";

   function gsl_vector_complex_float_swap_elements
     (v : access gsl_vector_complex_float; i : stddef_h.size_t;
      j : stddef_h.size_t)
      return int  -- /usr/include/gsl/gsl_vector_complex_float.h:165
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_swap_elements";

   function gsl_vector_complex_float_equal
     (u : access constant gsl_vector_complex_float;
      v : access constant gsl_vector_complex_float)
      return int  -- /usr/include/gsl/gsl_vector_complex_float.h:167
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_equal";

   function gsl_vector_complex_float_isnull
     (v : access constant gsl_vector_complex_float)
      return int  -- /usr/include/gsl/gsl_vector_complex_float.h:170
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_isnull";

   function gsl_vector_complex_float_ispos
     (v : access constant gsl_vector_complex_float)
      return int  -- /usr/include/gsl/gsl_vector_complex_float.h:171
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_ispos";

   function gsl_vector_complex_float_isneg
     (v : access constant gsl_vector_complex_float)
      return int  -- /usr/include/gsl/gsl_vector_complex_float.h:172
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_isneg";

   function gsl_vector_complex_float_isnonneg
     (v : access constant gsl_vector_complex_float)
      return int  -- /usr/include/gsl/gsl_vector_complex_float.h:173
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_isnonneg";

   function gsl_vector_complex_float_add
     (a : access gsl_vector_complex_float;
      b : access constant gsl_vector_complex_float)
      return int  -- /usr/include/gsl/gsl_vector_complex_float.h:175
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_add";

   function gsl_vector_complex_float_sub
     (a : access gsl_vector_complex_float;
      b : access constant gsl_vector_complex_float)
      return int  -- /usr/include/gsl/gsl_vector_complex_float.h:176
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_sub";

   function gsl_vector_complex_float_mul
     (a : access gsl_vector_complex_float;
      b : access constant gsl_vector_complex_float)
      return int  -- /usr/include/gsl/gsl_vector_complex_float.h:177
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_mul";

   function gsl_vector_complex_float_div
     (a : access gsl_vector_complex_float;
      b : access constant gsl_vector_complex_float)
      return int  -- /usr/include/gsl/gsl_vector_complex_float.h:178
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_div";

   function gsl_vector_complex_float_scale
     (a : access gsl_vector_complex_float;
      x : gsl_gsl_complex_h.gsl_complex_float)
      return int  -- /usr/include/gsl/gsl_vector_complex_float.h:179
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_scale";

   function gsl_vector_complex_float_add_constant
     (a : access gsl_vector_complex_float;
      x : gsl_gsl_complex_h.gsl_complex_float)
      return int  -- /usr/include/gsl/gsl_vector_complex_float.h:180
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_add_constant";

   function gsl_vector_complex_float_axpby
     (alpha : gsl_gsl_complex_h.gsl_complex_float;
      x     : access constant gsl_vector_complex_float;
      beta  : gsl_gsl_complex_h.gsl_complex_float;
      y     : access gsl_vector_complex_float)
      return int  -- /usr/include/gsl/gsl_vector_complex_float.h:181
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_axpby";

   function gsl_vector_complex_float_get
     (v : access constant gsl_vector_complex_float; i : stddef_h.size_t)
      return gsl_gsl_complex_h
     .gsl_complex_float  -- /usr/include/gsl/gsl_vector_complex_float.h:183
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_get";

   procedure gsl_vector_complex_float_set
     (v : access gsl_vector_complex_float; i : stddef_h.size_t;
      z : gsl_gsl_complex_h
        .gsl_complex_float)  -- /usr/include/gsl/gsl_vector_complex_float.h:184
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_set";

   function gsl_vector_complex_float_ptr
     (v : access gsl_vector_complex_float; i : stddef_h.size_t)
      return access gsl_gsl_complex_h
     .gsl_complex_float  -- /usr/include/gsl/gsl_vector_complex_float.h:185
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_ptr";

   function gsl_vector_complex_float_const_ptr
     (v : access constant gsl_vector_complex_float; i : stddef_h.size_t)
      return access constant gsl_gsl_complex_h
     .gsl_complex_float  -- /usr/include/gsl/gsl_vector_complex_float.h:186
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_const_ptr";

end gsl_gsl_vector_complex_float_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
