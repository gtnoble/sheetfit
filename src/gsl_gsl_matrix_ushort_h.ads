pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with stddef_h;
limited with gsl_gsl_block_ushort_h;
with gsl_gsl_vector_ushort_h;

with Interfaces.C.Strings;
with gsl_gsl_blas_types_h;

package gsl_gsl_matrix_ushort_h is

   -- matrix/gsl_matrix_ushort.h
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

   type gsl_matrix_ushort is record
      size1 : aliased stddef_h
        .size_t;  -- /usr/include/gsl/gsl_matrix_ushort.h:45
      size2 : aliased stddef_h
        .size_t;  -- /usr/include/gsl/gsl_matrix_ushort.h:46
      tda   : aliased stddef_h
        .size_t;  -- /usr/include/gsl/gsl_matrix_ushort.h:47
      data : access unsigned_short;  -- /usr/include/gsl/gsl_matrix_ushort.h:48
      block : access gsl_gsl_block_ushort_h
        .gsl_block_ushort_struct;  -- /usr/include/gsl/gsl_matrix_ushort.h:49
      owner : aliased int;  -- /usr/include/gsl/gsl_matrix_ushort.h:50
   end record with
     Convention => C_Pass_By_Copy;  -- /usr/include/gsl/gsl_matrix_ushort.h:51

   type u_gsl_matrix_ushort_view is record
      matrix : aliased gsl_matrix_ushort;  -- /usr/include/gsl/gsl_matrix_ushort.h:55
   end record with
     Convention => C_Pass_By_Copy;  -- /usr/include/gsl/gsl_matrix_ushort.h:56

   subtype gsl_matrix_ushort_view is
     u_gsl_matrix_ushort_view;  -- /usr/include/gsl/gsl_matrix_ushort.h:58

   type u_gsl_matrix_ushort_const_view is record
      matrix : aliased gsl_matrix_ushort;  -- /usr/include/gsl/gsl_matrix_ushort.h:62
   end record with
     Convention => C_Pass_By_Copy;  -- /usr/include/gsl/gsl_matrix_ushort.h:63

   subtype gsl_matrix_ushort_const_view is
     u_gsl_matrix_ushort_const_view;  -- /usr/include/gsl/gsl_matrix_ushort.h:65

   -- Allocation
   function gsl_matrix_ushort_alloc
     (n1 : stddef_h.size_t; n2 : stddef_h.size_t)
      return access gsl_matrix_ushort  -- /usr/include/gsl/gsl_matrix_ushort.h:70
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_alloc";

   function gsl_matrix_ushort_calloc
     (n1 : stddef_h.size_t; n2 : stddef_h.size_t)
      return access gsl_matrix_ushort  -- /usr/include/gsl/gsl_matrix_ushort.h:73
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_calloc";

   function gsl_matrix_ushort_alloc_from_block
     (b      : access gsl_gsl_block_ushort_h.gsl_block_ushort_struct;
      offset : stddef_h.size_t; n1 : stddef_h.size_t; n2 : stddef_h.size_t;
      d2     : stddef_h.size_t)
      return access gsl_matrix_ushort  -- /usr/include/gsl/gsl_matrix_ushort.h:76
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_alloc_from_block";

   function gsl_matrix_ushort_alloc_from_matrix
     (m : access gsl_matrix_ushort; k1 : stddef_h.size_t; k2 : stddef_h.size_t;
      n1 : stddef_h.size_t; n2 : stddef_h.size_t)
      return access gsl_matrix_ushort  -- /usr/include/gsl/gsl_matrix_ushort.h:83
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_alloc_from_matrix";

   function gsl_vector_ushort_alloc_row_from_matrix
     (m : access gsl_matrix_ushort; i : stddef_h.size_t)
      return access gsl_gsl_vector_ushort_h
     .gsl_vector_ushort  -- /usr/include/gsl/gsl_matrix_ushort.h:90
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_ushort_alloc_row_from_matrix";

   function gsl_vector_ushort_alloc_col_from_matrix
     (m : access gsl_matrix_ushort; j : stddef_h.size_t)
      return access gsl_gsl_vector_ushort_h
     .gsl_vector_ushort  -- /usr/include/gsl/gsl_matrix_ushort.h:94
   with
     Import        => True, Convention => C,
     External_Name => "gsl_vector_ushort_alloc_col_from_matrix";

   procedure gsl_matrix_ushort_free
     (m : access gsl_matrix_ushort)  -- /usr/include/gsl/gsl_matrix_ushort.h:97
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_free";

   -- Views
   function gsl_matrix_ushort_submatrix
     (m  : access gsl_matrix_ushort; i : stddef_h.size_t; j : stddef_h.size_t;
      n1 : stddef_h.size_t; n2 : stddef_h.size_t)
      return u_gsl_matrix_ushort_view  -- /usr/include/gsl/gsl_matrix_ushort.h:102
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_submatrix";

   function gsl_matrix_ushort_row
     (m : access gsl_matrix_ushort; i : stddef_h.size_t)
      return gsl_gsl_vector_ushort_h
     .u_gsl_vector_ushort_view  -- /usr/include/gsl/gsl_matrix_ushort.h:107
   with
     Import => True, Convention => C, External_Name => "gsl_matrix_ushort_row";

   function gsl_matrix_ushort_column
     (m : access gsl_matrix_ushort; j : stddef_h.size_t)
      return gsl_gsl_vector_ushort_h
     .u_gsl_vector_ushort_view  -- /usr/include/gsl/gsl_matrix_ushort.h:110
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_column";

   function gsl_matrix_ushort_diagonal
     (m : access gsl_matrix_ushort)
      return gsl_gsl_vector_ushort_h
     .u_gsl_vector_ushort_view  -- /usr/include/gsl/gsl_matrix_ushort.h:113
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_diagonal";

   function gsl_matrix_ushort_subdiagonal
     (m : access gsl_matrix_ushort; k : stddef_h.size_t)
      return gsl_gsl_vector_ushort_h
     .u_gsl_vector_ushort_view  -- /usr/include/gsl/gsl_matrix_ushort.h:116
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_subdiagonal";

   function gsl_matrix_ushort_superdiagonal
     (m : access gsl_matrix_ushort; k : stddef_h.size_t)
      return gsl_gsl_vector_ushort_h
     .u_gsl_vector_ushort_view  -- /usr/include/gsl/gsl_matrix_ushort.h:119
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_superdiagonal";

   function gsl_matrix_ushort_subrow
     (m      : access gsl_matrix_ushort; i : stddef_h.size_t;
      offset : stddef_h.size_t; n : stddef_h.size_t)
      return gsl_gsl_vector_ushort_h
     .u_gsl_vector_ushort_view  -- /usr/include/gsl/gsl_matrix_ushort.h:122
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_subrow";

   function gsl_matrix_ushort_subcolumn
     (m      : access gsl_matrix_ushort; j : stddef_h.size_t;
      offset : stddef_h.size_t; n : stddef_h.size_t)
      return gsl_gsl_vector_ushort_h
     .u_gsl_vector_ushort_view  -- /usr/include/gsl/gsl_matrix_ushort.h:126
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_subcolumn";

   function gsl_matrix_ushort_view_array
     (base : access unsigned_short; n1 : stddef_h.size_t; n2 : stddef_h.size_t)
      return u_gsl_matrix_ushort_view  -- /usr/include/gsl/gsl_matrix_ushort.h:130
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_view_array";

   function gsl_matrix_ushort_view_array_with_tda
     (base : access unsigned_short; n1 : stddef_h.size_t; n2 : stddef_h.size_t;
      tda  : stddef_h.size_t)
      return u_gsl_matrix_ushort_view  -- /usr/include/gsl/gsl_matrix_ushort.h:135
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_view_array_with_tda";

   function gsl_matrix_ushort_view_vector
     (v  : access gsl_gsl_vector_ushort_h.gsl_vector_ushort;
      n1 : stddef_h.size_t; n2 : stddef_h.size_t)
      return u_gsl_matrix_ushort_view  -- /usr/include/gsl/gsl_matrix_ushort.h:142
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_view_vector";

   function gsl_matrix_ushort_view_vector_with_tda
     (v  : access gsl_gsl_vector_ushort_h.gsl_vector_ushort;
      n1 : stddef_h.size_t; n2 : stddef_h.size_t; tda : stddef_h.size_t)
      return u_gsl_matrix_ushort_view  -- /usr/include/gsl/gsl_matrix_ushort.h:147
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_view_vector_with_tda";

   function gsl_matrix_ushort_const_submatrix
     (m : access constant gsl_matrix_ushort; i : stddef_h.size_t;
      j : stddef_h.size_t; n1 : stddef_h.size_t; n2 : stddef_h.size_t)
      return u_gsl_matrix_ushort_const_view  -- /usr/include/gsl/gsl_matrix_ushort.h:154
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_const_submatrix";

   function gsl_matrix_ushort_const_row
     (m : access constant gsl_matrix_ushort; i : stddef_h.size_t)
      return gsl_gsl_vector_ushort_h
     .u_gsl_vector_ushort_const_view  -- /usr/include/gsl/gsl_matrix_ushort.h:159
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_const_row";

   function gsl_matrix_ushort_const_column
     (m : access constant gsl_matrix_ushort; j : stddef_h.size_t)
      return gsl_gsl_vector_ushort_h
     .u_gsl_vector_ushort_const_view  -- /usr/include/gsl/gsl_matrix_ushort.h:163
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_const_column";

   function gsl_matrix_ushort_const_diagonal
     (m : access constant gsl_matrix_ushort)
      return gsl_gsl_vector_ushort_h
     .u_gsl_vector_ushort_const_view  -- /usr/include/gsl/gsl_matrix_ushort.h:167
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_const_diagonal";

   function gsl_matrix_ushort_const_subdiagonal
     (m : access constant gsl_matrix_ushort; k : stddef_h.size_t)
      return gsl_gsl_vector_ushort_h
     .u_gsl_vector_ushort_const_view  -- /usr/include/gsl/gsl_matrix_ushort.h:170
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_const_subdiagonal";

   function gsl_matrix_ushort_const_superdiagonal
     (m : access constant gsl_matrix_ushort; k : stddef_h.size_t)
      return gsl_gsl_vector_ushort_h
     .u_gsl_vector_ushort_const_view  -- /usr/include/gsl/gsl_matrix_ushort.h:174
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_const_superdiagonal";

   function gsl_matrix_ushort_const_subrow
     (m      : access constant gsl_matrix_ushort; i : stddef_h.size_t;
      offset : stddef_h.size_t; n : stddef_h.size_t)
      return gsl_gsl_vector_ushort_h
     .u_gsl_vector_ushort_const_view  -- /usr/include/gsl/gsl_matrix_ushort.h:178
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_const_subrow";

   function gsl_matrix_ushort_const_subcolumn
     (m      : access constant gsl_matrix_ushort; j : stddef_h.size_t;
      offset : stddef_h.size_t; n : stddef_h.size_t)
      return gsl_gsl_vector_ushort_h
     .u_gsl_vector_ushort_const_view  -- /usr/include/gsl/gsl_matrix_ushort.h:182
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_const_subcolumn";

   function gsl_matrix_ushort_const_view_array
     (base : access unsigned_short; n1 : stddef_h.size_t; n2 : stddef_h.size_t)
      return u_gsl_matrix_ushort_const_view  -- /usr/include/gsl/gsl_matrix_ushort.h:186
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_const_view_array";

   function gsl_matrix_ushort_const_view_array_with_tda
     (base : access unsigned_short; n1 : stddef_h.size_t; n2 : stddef_h.size_t;
      tda  : stddef_h.size_t)
      return u_gsl_matrix_ushort_const_view  -- /usr/include/gsl/gsl_matrix_ushort.h:191
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_const_view_array_with_tda";

   function gsl_matrix_ushort_const_view_vector
     (v  : access constant gsl_gsl_vector_ushort_h.gsl_vector_ushort;
      n1 : stddef_h.size_t; n2 : stddef_h.size_t)
      return u_gsl_matrix_ushort_const_view  -- /usr/include/gsl/gsl_matrix_ushort.h:197
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_const_view_vector";

   function gsl_matrix_ushort_const_view_vector_with_tda
     (v  : access constant gsl_gsl_vector_ushort_h.gsl_vector_ushort;
      n1 : stddef_h.size_t; n2 : stddef_h.size_t; tda : stddef_h.size_t)
      return u_gsl_matrix_ushort_const_view  -- /usr/include/gsl/gsl_matrix_ushort.h:202
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_const_view_vector_with_tda";

   -- Operations
   procedure gsl_matrix_ushort_set_zero
     (m : access gsl_matrix_ushort)  -- /usr/include/gsl/gsl_matrix_ushort.h:209
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_set_zero";

   procedure gsl_matrix_ushort_set_identity
     (m : access gsl_matrix_ushort)  -- /usr/include/gsl/gsl_matrix_ushort.h:210
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_set_identity";

   procedure gsl_matrix_ushort_set_all
     (m : access gsl_matrix_ushort;
      x : unsigned_short)  -- /usr/include/gsl/gsl_matrix_ushort.h:211
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_set_all";

   function gsl_matrix_ushort_memcpy
     (dest : access gsl_matrix_ushort; src : access constant gsl_matrix_ushort)
      return int  -- /usr/include/gsl/gsl_matrix_ushort.h:218
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_memcpy";

   function gsl_matrix_ushort_swap
     (m1 : access gsl_matrix_ushort; m2 : access gsl_matrix_ushort)
      return int  -- /usr/include/gsl/gsl_matrix_ushort.h:219
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_swap";

   function gsl_matrix_ushort_tricpy
     (Uplo : gsl_gsl_blas_types_h.CBLAS_UPLO_t;
      Diag : gsl_gsl_blas_types_h.CBLAS_DIAG_t;
      dest : access gsl_matrix_ushort; src : access constant gsl_matrix_ushort)
      return int  -- /usr/include/gsl/gsl_matrix_ushort.h:220
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_tricpy";

   function gsl_matrix_ushort_swap_rows
     (m : access gsl_matrix_ushort; i : stddef_h.size_t; j : stddef_h.size_t)
      return int  -- /usr/include/gsl/gsl_matrix_ushort.h:222
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_swap_rows";

   function gsl_matrix_ushort_swap_columns
     (m : access gsl_matrix_ushort; i : stddef_h.size_t; j : stddef_h.size_t)
      return int  -- /usr/include/gsl/gsl_matrix_ushort.h:223
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_swap_columns";

   function gsl_matrix_ushort_swap_rowcol
     (m : access gsl_matrix_ushort; i : stddef_h.size_t; j : stddef_h.size_t)
      return int  -- /usr/include/gsl/gsl_matrix_ushort.h:224
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_swap_rowcol";

   function gsl_matrix_ushort_transpose
     (m : access gsl_matrix_ushort)
      return int  -- /usr/include/gsl/gsl_matrix_ushort.h:225
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_transpose";

   function gsl_matrix_ushort_transpose_memcpy
     (dest : access gsl_matrix_ushort; src : access constant gsl_matrix_ushort)
      return int  -- /usr/include/gsl/gsl_matrix_ushort.h:226
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_transpose_memcpy";

   function gsl_matrix_ushort_transpose_tricpy
     (Uplo_src : gsl_gsl_blas_types_h.CBLAS_UPLO_t;
      Diag     : gsl_gsl_blas_types_h.CBLAS_DIAG_t;
      dest : access gsl_matrix_ushort; src : access constant gsl_matrix_ushort)
      return int  -- /usr/include/gsl/gsl_matrix_ushort.h:227
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_transpose_tricpy";

   function gsl_matrix_ushort_max
     (m : access constant gsl_matrix_ushort)
      return unsigned_short  -- /usr/include/gsl/gsl_matrix_ushort.h:229
   with
     Import => True, Convention => C, External_Name => "gsl_matrix_ushort_max";

   function gsl_matrix_ushort_min
     (m : access constant gsl_matrix_ushort)
      return unsigned_short  -- /usr/include/gsl/gsl_matrix_ushort.h:230
   with
     Import => True, Convention => C, External_Name => "gsl_matrix_ushort_min";

   procedure gsl_matrix_ushort_minmax
     (m : access constant gsl_matrix_ushort; min_out : access unsigned_short;
      max_out : access unsigned_short)  -- /usr/include/gsl/gsl_matrix_ushort.h:231
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_minmax";

   procedure gsl_matrix_ushort_max_index
     (m    : access constant gsl_matrix_ushort; imax : access stddef_h.size_t;
      jmax : access stddef_h
        .size_t)  -- /usr/include/gsl/gsl_matrix_ushort.h:233
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_max_index";

   procedure gsl_matrix_ushort_min_index
     (m    : access constant gsl_matrix_ushort; imin : access stddef_h.size_t;
      jmin : access stddef_h
        .size_t)  -- /usr/include/gsl/gsl_matrix_ushort.h:234
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_min_index";

   procedure gsl_matrix_ushort_minmax_index
     (m    : access constant gsl_matrix_ushort; imin : access stddef_h.size_t;
      jmin : access stddef_h.size_t; imax : access stddef_h.size_t;
      jmax : access stddef_h
        .size_t)  -- /usr/include/gsl/gsl_matrix_ushort.h:235
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_minmax_index";

   function gsl_matrix_ushort_equal
     (a : access constant gsl_matrix_ushort;
      b : access constant gsl_matrix_ushort)
      return int  -- /usr/include/gsl/gsl_matrix_ushort.h:237
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_equal";

   function gsl_matrix_ushort_isnull
     (m : access constant gsl_matrix_ushort)
      return int  -- /usr/include/gsl/gsl_matrix_ushort.h:239
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_isnull";

   function gsl_matrix_ushort_ispos
     (m : access constant gsl_matrix_ushort)
      return int  -- /usr/include/gsl/gsl_matrix_ushort.h:240
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_ispos";

   function gsl_matrix_ushort_isneg
     (m : access constant gsl_matrix_ushort)
      return int  -- /usr/include/gsl/gsl_matrix_ushort.h:241
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_isneg";

   function gsl_matrix_ushort_isnonneg
     (m : access constant gsl_matrix_ushort)
      return int  -- /usr/include/gsl/gsl_matrix_ushort.h:242
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_isnonneg";

   function gsl_matrix_ushort_norm1
     (m : access constant gsl_matrix_ushort)
      return unsigned_short  -- /usr/include/gsl/gsl_matrix_ushort.h:244
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_norm1";

   function gsl_matrix_ushort_add
     (a : access gsl_matrix_ushort; b : access constant gsl_matrix_ushort)
      return int  -- /usr/include/gsl/gsl_matrix_ushort.h:246
   with
     Import => True, Convention => C, External_Name => "gsl_matrix_ushort_add";

   function gsl_matrix_ushort_sub
     (a : access gsl_matrix_ushort; b : access constant gsl_matrix_ushort)
      return int  -- /usr/include/gsl/gsl_matrix_ushort.h:247
   with
     Import => True, Convention => C, External_Name => "gsl_matrix_ushort_sub";

   function gsl_matrix_ushort_mul_elements
     (a : access gsl_matrix_ushort; b : access constant gsl_matrix_ushort)
      return int  -- /usr/include/gsl/gsl_matrix_ushort.h:248
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_mul_elements";

   function gsl_matrix_ushort_div_elements
     (a : access gsl_matrix_ushort; b : access constant gsl_matrix_ushort)
      return int  -- /usr/include/gsl/gsl_matrix_ushort.h:249
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_div_elements";

   function gsl_matrix_ushort_scale
     (a : access gsl_matrix_ushort;
      x : unsigned_short)
      return int  -- /usr/include/gsl/gsl_matrix_ushort.h:250
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_scale";

   function gsl_matrix_ushort_scale_rows
     (a : access gsl_matrix_ushort;
      x : access constant gsl_gsl_vector_ushort_h.gsl_vector_ushort)
      return int  -- /usr/include/gsl/gsl_matrix_ushort.h:251
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_scale_rows";

   function gsl_matrix_ushort_scale_columns
     (a : access gsl_matrix_ushort;
      x : access constant gsl_gsl_vector_ushort_h.gsl_vector_ushort)
      return int  -- /usr/include/gsl/gsl_matrix_ushort.h:252
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_scale_columns";

   function gsl_matrix_ushort_add_constant
     (a : access gsl_matrix_ushort;
      x : unsigned_short)
      return int  -- /usr/include/gsl/gsl_matrix_ushort.h:253
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_add_constant";

   function gsl_matrix_ushort_add_diagonal
     (a : access gsl_matrix_ushort;
      x : unsigned_short)
      return int  -- /usr/include/gsl/gsl_matrix_ushort.h:254
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_add_diagonal";

   --*********************************************************************
   -- The functions below are obsolete
   --*********************************************************************
   function gsl_matrix_ushort_get_row
     (v : access gsl_gsl_vector_ushort_h.gsl_vector_ushort;
      m : access constant gsl_matrix_ushort; i : stddef_h.size_t)
      return int  -- /usr/include/gsl/gsl_matrix_ushort.h:259
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_get_row";

   function gsl_matrix_ushort_get_col
     (v : access gsl_gsl_vector_ushort_h.gsl_vector_ushort;
      m : access constant gsl_matrix_ushort; j : stddef_h.size_t)
      return int  -- /usr/include/gsl/gsl_matrix_ushort.h:260
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_get_col";

   function gsl_matrix_ushort_set_row
     (m : access gsl_matrix_ushort; i : stddef_h.size_t;
      v : access constant gsl_gsl_vector_ushort_h.gsl_vector_ushort)
      return int  -- /usr/include/gsl/gsl_matrix_ushort.h:261
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_set_row";

   function gsl_matrix_ushort_set_col
     (m : access gsl_matrix_ushort; j : stddef_h.size_t;
      v : access constant gsl_gsl_vector_ushort_h.gsl_vector_ushort)
      return int  -- /usr/include/gsl/gsl_matrix_ushort.h:262
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_set_col";

   --*********************************************************************
   -- inline functions if you are using GCC
   function gsl_matrix_ushort_get
     (m : access constant gsl_matrix_ushort; i : stddef_h.size_t;
      j : stddef_h.size_t)
      return unsigned_short  -- /usr/include/gsl/gsl_matrix_ushort.h:267
   with
     Import => True, Convention => C, External_Name => "gsl_matrix_ushort_get";

   procedure gsl_matrix_ushort_set
     (m : access gsl_matrix_ushort; i : stddef_h.size_t; j : stddef_h.size_t;
      x : unsigned_short)  -- /usr/include/gsl/gsl_matrix_ushort.h:268
   with
     Import => True, Convention => C, External_Name => "gsl_matrix_ushort_set";

   function gsl_matrix_ushort_ptr
     (m : access gsl_matrix_ushort; i : stddef_h.size_t; j : stddef_h.size_t)
      return access unsigned_short  -- /usr/include/gsl/gsl_matrix_ushort.h:269
   with
     Import => True, Convention => C, External_Name => "gsl_matrix_ushort_ptr";

   function gsl_matrix_ushort_const_ptr
     (m : access constant gsl_matrix_ushort; i : stddef_h.size_t;
      j : stddef_h.size_t)
      return access unsigned_short  -- /usr/include/gsl/gsl_matrix_ushort.h:270
   with
     Import        => True, Convention => C,
     External_Name => "gsl_matrix_ushort_const_ptr";

end gsl_gsl_matrix_ushort_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
