pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with stddef_h;
limited with gsl_gsl_block_complex_float_h;
with gsl_gsl_vector_complex_float_h;
with gsl_gsl_complex_h;

with Interfaces.C.Strings;
with gsl_gsl_blas_types_h;

package gsl_gsl_matrix_complex_float_h is

   -- matrix/gsl_matrix_complex_float.h
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

   type gsl_matrix_complex_float is record
      size1 : aliased stddef_h
        .size_t;  -- /usr/include/gsl/gsl_matrix_complex_float.h:45
      size2 : aliased stddef_h
        .size_t;  -- /usr/include/gsl/gsl_matrix_complex_float.h:46
      tda   : aliased stddef_h
        .size_t;  -- /usr/include/gsl/gsl_matrix_complex_float.h:47
      data  : access Float;  -- /usr/include/gsl/gsl_matrix_complex_float.h:48
      block : access gsl_gsl_block_complex_float_h
        .gsl_block_complex_float_struct;  -- /usr/include/gsl/gsl_matrix_complex_float.h:49
      owner : aliased int;  -- /usr/include/gsl/gsl_matrix_complex_float.h:50
   end record with
     Convention =>
      C_Pass_By_Copy;  -- /usr/include/gsl/gsl_matrix_complex_float.h:51

   type u_gsl_matrix_complex_float_view is record
      matrix : aliased gsl_matrix_complex_float;  -- /usr/include/gsl/gsl_matrix_complex_float.h:55
   end record with
     Convention =>
      C_Pass_By_Copy;  -- /usr/include/gsl/gsl_matrix_complex_float.h:56

   subtype gsl_matrix_complex_float_view is
     u_gsl_matrix_complex_float_view;  -- /usr/include/gsl/gsl_matrix_complex_float.h:58

   type u_gsl_matrix_complex_float_const_view is record
      matrix : aliased gsl_matrix_complex_float;  -- /usr/include/gsl/gsl_matrix_complex_float.h:62
   end record with
     Convention =>
      C_Pass_By_Copy;  -- /usr/include/gsl/gsl_matrix_complex_float.h:63

   subtype gsl_matrix_complex_float_const_view is
     u_gsl_matrix_complex_float_const_view;  -- /usr/include/gsl/gsl_matrix_complex_float.h:65

   -- Allocation
   function gsl_matrix_complex_float_alloc
     (n1 : stddef_h.size_t; n2 : stddef_h.size_t)
      return access gsl_matrix_complex_float  -- /usr/include/gsl/gsl_matrix_complex_float.h:71
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_alloc";

   function gsl_matrix_complex_float_calloc
     (n1 : stddef_h.size_t; n2 : stddef_h.size_t)
      return access gsl_matrix_complex_float  -- /usr/include/gsl/gsl_matrix_complex_float.h:74
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_calloc";

   function gsl_matrix_complex_float_alloc_from_block
     (b : access gsl_gsl_block_complex_float_h.gsl_block_complex_float_struct;
      offset : stddef_h.size_t; n1 : stddef_h.size_t; n2 : stddef_h.size_t;
      d2     : stddef_h.size_t)
      return access gsl_matrix_complex_float  -- /usr/include/gsl/gsl_matrix_complex_float.h:77
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_alloc_from_block";

   function gsl_matrix_complex_float_alloc_from_matrix
     (b  : access gsl_matrix_complex_float; k1 : stddef_h.size_t;
      k2 : stddef_h.size_t; n1 : stddef_h.size_t; n2 : stddef_h.size_t)
      return access gsl_matrix_complex_float  -- /usr/include/gsl/gsl_matrix_complex_float.h:82
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_alloc_from_matrix";

   function gsl_vector_complex_float_alloc_row_from_matrix
     (m : access gsl_matrix_complex_float; i : stddef_h.size_t)
      return access gsl_gsl_vector_complex_float_h
     .gsl_vector_complex_float  -- /usr/include/gsl/gsl_matrix_complex_float.h:87
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_alloc_row_from_matrix";

   function gsl_vector_complex_float_alloc_col_from_matrix
     (m : access gsl_matrix_complex_float; j : stddef_h.size_t)
      return access gsl_gsl_vector_complex_float_h
     .gsl_vector_complex_float  -- /usr/include/gsl/gsl_matrix_complex_float.h:91
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_complex_float_alloc_col_from_matrix";

   procedure gsl_matrix_complex_float_free
     (m : access gsl_matrix_complex_float)  -- /usr/include/gsl/gsl_matrix_complex_float.h:94
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_free";

   -- Views
   function gsl_matrix_complex_float_submatrix
     (m : access gsl_matrix_complex_float; i : stddef_h.size_t;
      j : stddef_h.size_t; n1 : stddef_h.size_t; n2 : stddef_h.size_t)
      return u_gsl_matrix_complex_float_view  -- /usr/include/gsl/gsl_matrix_complex_float.h:99
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_submatrix";

   function gsl_matrix_complex_float_row
     (m : access gsl_matrix_complex_float; i : stddef_h.size_t)
      return gsl_gsl_vector_complex_float_h
     .u_gsl_vector_complex_float_view  -- /usr/include/gsl/gsl_matrix_complex_float.h:104
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_row";

   function gsl_matrix_complex_float_column
     (m : access gsl_matrix_complex_float; j : stddef_h.size_t)
      return gsl_gsl_vector_complex_float_h
     .u_gsl_vector_complex_float_view  -- /usr/include/gsl/gsl_matrix_complex_float.h:107
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_column";

   function gsl_matrix_complex_float_diagonal
     (m : access gsl_matrix_complex_float)
      return gsl_gsl_vector_complex_float_h
     .u_gsl_vector_complex_float_view  -- /usr/include/gsl/gsl_matrix_complex_float.h:110
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_diagonal";

   function gsl_matrix_complex_float_subdiagonal
     (m : access gsl_matrix_complex_float; k : stddef_h.size_t)
      return gsl_gsl_vector_complex_float_h
     .u_gsl_vector_complex_float_view  -- /usr/include/gsl/gsl_matrix_complex_float.h:113
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_subdiagonal";

   function gsl_matrix_complex_float_superdiagonal
     (m : access gsl_matrix_complex_float; k : stddef_h.size_t)
      return gsl_gsl_vector_complex_float_h
     .u_gsl_vector_complex_float_view  -- /usr/include/gsl/gsl_matrix_complex_float.h:116
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_superdiagonal";

   function gsl_matrix_complex_float_subrow
     (m      : access gsl_matrix_complex_float; i : stddef_h.size_t;
      offset : stddef_h.size_t; n : stddef_h.size_t)
      return gsl_gsl_vector_complex_float_h
     .u_gsl_vector_complex_float_view  -- /usr/include/gsl/gsl_matrix_complex_float.h:119
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_subrow";

   function gsl_matrix_complex_float_subcolumn
     (m      : access gsl_matrix_complex_float; j : stddef_h.size_t;
      offset : stddef_h.size_t; n : stddef_h.size_t)
      return gsl_gsl_vector_complex_float_h
     .u_gsl_vector_complex_float_view  -- /usr/include/gsl/gsl_matrix_complex_float.h:124
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_subcolumn";

   function gsl_matrix_complex_float_view_array
     (base : access Float; n1 : stddef_h.size_t; n2 : stddef_h.size_t)
      return u_gsl_matrix_complex_float_view  -- /usr/include/gsl/gsl_matrix_complex_float.h:129
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_view_array";

   function gsl_matrix_complex_float_view_array_with_tda
     (base : access Float; n1 : stddef_h.size_t; n2 : stddef_h.size_t;
      tda  : stddef_h.size_t)
      return u_gsl_matrix_complex_float_view  -- /usr/include/gsl/gsl_matrix_complex_float.h:134
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_view_array_with_tda";

   function gsl_matrix_complex_float_view_vector
     (v  : access gsl_gsl_vector_complex_float_h.gsl_vector_complex_float;
      n1 : stddef_h.size_t; n2 : stddef_h.size_t)
      return u_gsl_matrix_complex_float_view  -- /usr/include/gsl/gsl_matrix_complex_float.h:140
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_view_vector";

   function gsl_matrix_complex_float_view_vector_with_tda
     (v  : access gsl_gsl_vector_complex_float_h.gsl_vector_complex_float;
      n1 : stddef_h.size_t; n2 : stddef_h.size_t; tda : stddef_h.size_t)
      return u_gsl_matrix_complex_float_view  -- /usr/include/gsl/gsl_matrix_complex_float.h:145
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_view_vector_with_tda";

   function gsl_matrix_complex_float_const_submatrix
     (m : access constant gsl_matrix_complex_float; i : stddef_h.size_t;
      j : stddef_h.size_t; n1 : stddef_h.size_t; n2 : stddef_h.size_t)
      return u_gsl_matrix_complex_float_const_view  -- /usr/include/gsl/gsl_matrix_complex_float.h:152
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_const_submatrix";

   function gsl_matrix_complex_float_const_row
     (m : access constant gsl_matrix_complex_float; i : stddef_h.size_t)
      return gsl_gsl_vector_complex_float_h
     .u_gsl_vector_complex_float_const_view  -- /usr/include/gsl/gsl_matrix_complex_float.h:157
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_const_row";

   function gsl_matrix_complex_float_const_column
     (m : access constant gsl_matrix_complex_float; j : stddef_h.size_t)
      return gsl_gsl_vector_complex_float_h
     .u_gsl_vector_complex_float_const_view  -- /usr/include/gsl/gsl_matrix_complex_float.h:161
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_const_column";

   function gsl_matrix_complex_float_const_diagonal
     (m : access constant gsl_matrix_complex_float)
      return gsl_gsl_vector_complex_float_h
     .u_gsl_vector_complex_float_const_view  -- /usr/include/gsl/gsl_matrix_complex_float.h:165
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_const_diagonal";

   function gsl_matrix_complex_float_const_subdiagonal
     (m : access constant gsl_matrix_complex_float; k : stddef_h.size_t)
      return gsl_gsl_vector_complex_float_h
     .u_gsl_vector_complex_float_const_view  -- /usr/include/gsl/gsl_matrix_complex_float.h:168
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_const_subdiagonal";

   function gsl_matrix_complex_float_const_superdiagonal
     (m : access constant gsl_matrix_complex_float; k : stddef_h.size_t)
      return gsl_gsl_vector_complex_float_h
     .u_gsl_vector_complex_float_const_view  -- /usr/include/gsl/gsl_matrix_complex_float.h:172
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_const_superdiagonal";

   function gsl_matrix_complex_float_const_subrow
     (m      : access constant gsl_matrix_complex_float; i : stddef_h.size_t;
      offset : stddef_h.size_t; n : stddef_h.size_t)
      return gsl_gsl_vector_complex_float_h
     .u_gsl_vector_complex_float_const_view  -- /usr/include/gsl/gsl_matrix_complex_float.h:176
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_const_subrow";

   function gsl_matrix_complex_float_const_subcolumn
     (m      : access constant gsl_matrix_complex_float; j : stddef_h.size_t;
      offset : stddef_h.size_t; n : stddef_h.size_t)
      return gsl_gsl_vector_complex_float_h
     .u_gsl_vector_complex_float_const_view  -- /usr/include/gsl/gsl_matrix_complex_float.h:181
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_const_subcolumn";

   function gsl_matrix_complex_float_const_view_array
     (base : access Float; n1 : stddef_h.size_t; n2 : stddef_h.size_t)
      return u_gsl_matrix_complex_float_const_view  -- /usr/include/gsl/gsl_matrix_complex_float.h:186
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_const_view_array";

   function gsl_matrix_complex_float_const_view_array_with_tda
     (base : access Float; n1 : stddef_h.size_t; n2 : stddef_h.size_t;
      tda  : stddef_h.size_t)
      return u_gsl_matrix_complex_float_const_view  -- /usr/include/gsl/gsl_matrix_complex_float.h:191
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_const_view_array_with_tda";

   function gsl_matrix_complex_float_const_view_vector
     (v  : access constant gsl_gsl_vector_complex_float_h
        .gsl_vector_complex_float;
      n1 : stddef_h.size_t; n2 : stddef_h.size_t)
      return u_gsl_matrix_complex_float_const_view  -- /usr/include/gsl/gsl_matrix_complex_float.h:197
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_const_view_vector";

   function gsl_matrix_complex_float_const_view_vector_with_tda
     (v  : access constant gsl_gsl_vector_complex_float_h
        .gsl_vector_complex_float;
      n1 : stddef_h.size_t; n2 : stddef_h.size_t; tda : stddef_h.size_t)
      return u_gsl_matrix_complex_float_const_view  -- /usr/include/gsl/gsl_matrix_complex_float.h:202
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_const_view_vector_with_tda";

   -- Operations
   procedure gsl_matrix_complex_float_set_zero
     (m : access gsl_matrix_complex_float)  -- /usr/include/gsl/gsl_matrix_complex_float.h:209
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_set_zero";

   procedure gsl_matrix_complex_float_set_identity
     (m : access gsl_matrix_complex_float)  -- /usr/include/gsl/gsl_matrix_complex_float.h:210
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_set_identity";

   procedure gsl_matrix_complex_float_set_all
     (m : access gsl_matrix_complex_float;
      x : gsl_gsl_complex_h
        .gsl_complex_float)  -- /usr/include/gsl/gsl_matrix_complex_float.h:211
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_set_all";

   function gsl_matrix_complex_float_memcpy
     (dest : access gsl_matrix_complex_float;
      src  : access constant gsl_matrix_complex_float)
      return int  -- /usr/include/gsl/gsl_matrix_complex_float.h:218
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_memcpy";

   function gsl_matrix_complex_float_swap
     (m1 : access gsl_matrix_complex_float;
      m2 : access gsl_matrix_complex_float)
      return int  -- /usr/include/gsl/gsl_matrix_complex_float.h:219
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_swap";

   function gsl_matrix_complex_float_tricpy
     (Uplo : gsl_gsl_blas_types_h.CBLAS_UPLO_t;
      Diag : gsl_gsl_blas_types_h.CBLAS_DIAG_t;
      dest : access gsl_matrix_complex_float;
      src  : access constant gsl_matrix_complex_float)
      return int  -- /usr/include/gsl/gsl_matrix_complex_float.h:220
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_tricpy";

   function gsl_matrix_complex_float_swap_rows
     (m : access gsl_matrix_complex_float; i : stddef_h.size_t;
      j : stddef_h.size_t)
      return int  -- /usr/include/gsl/gsl_matrix_complex_float.h:222
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_swap_rows";

   function gsl_matrix_complex_float_swap_columns
     (m : access gsl_matrix_complex_float; i : stddef_h.size_t;
      j : stddef_h.size_t)
      return int  -- /usr/include/gsl/gsl_matrix_complex_float.h:223
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_swap_columns";

   function gsl_matrix_complex_float_swap_rowcol
     (m : access gsl_matrix_complex_float; i : stddef_h.size_t;
      j : stddef_h.size_t)
      return int  -- /usr/include/gsl/gsl_matrix_complex_float.h:224
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_swap_rowcol";

   function gsl_matrix_complex_float_transpose
     (m : access gsl_matrix_complex_float)
      return int  -- /usr/include/gsl/gsl_matrix_complex_float.h:226
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_transpose";

   function gsl_matrix_complex_float_transpose_memcpy
     (dest : access gsl_matrix_complex_float;
      src  : access constant gsl_matrix_complex_float)
      return int  -- /usr/include/gsl/gsl_matrix_complex_float.h:227
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_transpose_memcpy";

   function gsl_matrix_complex_float_transpose_tricpy
     (Uplo_src : gsl_gsl_blas_types_h.CBLAS_UPLO_t;
      Diag     : gsl_gsl_blas_types_h.CBLAS_DIAG_t;
      dest     : access gsl_matrix_complex_float;
      src      : access constant gsl_matrix_complex_float)
      return int  -- /usr/include/gsl/gsl_matrix_complex_float.h:228
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_transpose_tricpy";

   function gsl_matrix_complex_float_conjtrans_memcpy
     (dest : access gsl_matrix_complex_float;
      src  : access constant gsl_matrix_complex_float)
      return int  -- /usr/include/gsl/gsl_matrix_complex_float.h:230
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_conjtrans_memcpy";

   function gsl_matrix_complex_float_equal
     (a : access constant gsl_matrix_complex_float;
      b : access constant gsl_matrix_complex_float)
      return int  -- /usr/include/gsl/gsl_matrix_complex_float.h:232
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_equal";

   function gsl_matrix_complex_float_isnull
     (m : access constant gsl_matrix_complex_float)
      return int  -- /usr/include/gsl/gsl_matrix_complex_float.h:234
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_isnull";

   function gsl_matrix_complex_float_ispos
     (m : access constant gsl_matrix_complex_float)
      return int  -- /usr/include/gsl/gsl_matrix_complex_float.h:235
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_ispos";

   function gsl_matrix_complex_float_isneg
     (m : access constant gsl_matrix_complex_float)
      return int  -- /usr/include/gsl/gsl_matrix_complex_float.h:236
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_isneg";

   function gsl_matrix_complex_float_isnonneg
     (m : access constant gsl_matrix_complex_float)
      return int  -- /usr/include/gsl/gsl_matrix_complex_float.h:237
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_isnonneg";

   function gsl_matrix_complex_float_add
     (a : access gsl_matrix_complex_float;
      b : access constant gsl_matrix_complex_float)
      return int  -- /usr/include/gsl/gsl_matrix_complex_float.h:239
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_add";

   function gsl_matrix_complex_float_sub
     (a : access gsl_matrix_complex_float;
      b : access constant gsl_matrix_complex_float)
      return int  -- /usr/include/gsl/gsl_matrix_complex_float.h:240
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_sub";

   function gsl_matrix_complex_float_mul_elements
     (a : access gsl_matrix_complex_float;
      b : access constant gsl_matrix_complex_float)
      return int  -- /usr/include/gsl/gsl_matrix_complex_float.h:241
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_mul_elements";

   function gsl_matrix_complex_float_div_elements
     (a : access gsl_matrix_complex_float;
      b : access constant gsl_matrix_complex_float)
      return int  -- /usr/include/gsl/gsl_matrix_complex_float.h:242
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_div_elements";

   function gsl_matrix_complex_float_scale
     (a : access gsl_matrix_complex_float;
      x : gsl_gsl_complex_h.gsl_complex_float)
      return int  -- /usr/include/gsl/gsl_matrix_complex_float.h:243
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_scale";

   function gsl_matrix_complex_float_scale_rows
     (a : access gsl_matrix_complex_float;
      x : access constant gsl_gsl_vector_complex_float_h
        .gsl_vector_complex_float)
      return int  -- /usr/include/gsl/gsl_matrix_complex_float.h:244
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_scale_rows";

   function gsl_matrix_complex_float_scale_columns
     (a : access gsl_matrix_complex_float;
      x : access constant gsl_gsl_vector_complex_float_h
        .gsl_vector_complex_float)
      return int  -- /usr/include/gsl/gsl_matrix_complex_float.h:245
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_scale_columns";

   function gsl_matrix_complex_float_add_constant
     (a : access gsl_matrix_complex_float;
      x : gsl_gsl_complex_h.gsl_complex_float)
      return int  -- /usr/include/gsl/gsl_matrix_complex_float.h:246
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_add_constant";

   function gsl_matrix_complex_float_add_diagonal
     (a : access gsl_matrix_complex_float;
      x : gsl_gsl_complex_h.gsl_complex_float)
      return int  -- /usr/include/gsl/gsl_matrix_complex_float.h:247
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_add_diagonal";

   --*********************************************************************
   -- The functions below are obsolete
   --*********************************************************************
   function gsl_matrix_complex_float_get_row
     (v : access gsl_gsl_vector_complex_float_h.gsl_vector_complex_float;
      m : access constant gsl_matrix_complex_float; i : stddef_h.size_t)
      return int  -- /usr/include/gsl/gsl_matrix_complex_float.h:252
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_get_row";

   function gsl_matrix_complex_float_get_col
     (v : access gsl_gsl_vector_complex_float_h.gsl_vector_complex_float;
      m : access constant gsl_matrix_complex_float; j : stddef_h.size_t)
      return int  -- /usr/include/gsl/gsl_matrix_complex_float.h:253
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_get_col";

   function gsl_matrix_complex_float_set_row
     (m : access gsl_matrix_complex_float; i : stddef_h.size_t;
      v : access constant gsl_gsl_vector_complex_float_h
        .gsl_vector_complex_float)
      return int  -- /usr/include/gsl/gsl_matrix_complex_float.h:254
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_set_row";

   function gsl_matrix_complex_float_set_col
     (m : access gsl_matrix_complex_float; j : stddef_h.size_t;
      v : access constant gsl_gsl_vector_complex_float_h
        .gsl_vector_complex_float)
      return int  -- /usr/include/gsl/gsl_matrix_complex_float.h:255
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_set_col";

   --*********************************************************************
   -- inline functions if you are using GCC
   function gsl_matrix_complex_float_get
     (m : access constant gsl_matrix_complex_float; i : stddef_h.size_t;
      j : stddef_h.size_t) return gsl_gsl_complex_h
     .gsl_complex_float  -- /usr/include/gsl/gsl_matrix_complex_float.h:260
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_get";

   procedure gsl_matrix_complex_float_set
     (m            : access gsl_matrix_complex_float; i : stddef_h.size_t;
      j            : stddef_h
        .size_t; x : gsl_gsl_complex_h
        .gsl_complex_float)  -- /usr/include/gsl/gsl_matrix_complex_float.h:261
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_set";

   function gsl_matrix_complex_float_ptr
     (m : access gsl_matrix_complex_float; i : stddef_h.size_t;
      j : stddef_h.size_t)
      return access gsl_gsl_complex_h
     .gsl_complex_float  -- /usr/include/gsl/gsl_matrix_complex_float.h:263
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_ptr";

   function gsl_matrix_complex_float_const_ptr
     (m : access constant gsl_matrix_complex_float; i : stddef_h.size_t;
      j : stddef_h.size_t)
      return access constant gsl_gsl_complex_h
     .gsl_complex_float  -- /usr/include/gsl/gsl_matrix_complex_float.h:264
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_complex_float_const_ptr";

end gsl_gsl_matrix_complex_float_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
