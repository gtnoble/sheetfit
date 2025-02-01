pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with stddef_h;
limited with gsl_gsl_block_int_h;
with gsl_gsl_vector_int_h;

with Interfaces.C.Strings;
with gsl_gsl_blas_types_h;

package gsl_gsl_matrix_int_h is

  -- matrix/gsl_matrix_int.h
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

   type gsl_matrix_int is record
      size1 : aliased stddef_h.size_t;  -- /usr/include/gsl/gsl_matrix_int.h:45
      size2 : aliased stddef_h.size_t;  -- /usr/include/gsl/gsl_matrix_int.h:46
      tda : aliased stddef_h.size_t;  -- /usr/include/gsl/gsl_matrix_int.h:47
      data : access int;  -- /usr/include/gsl/gsl_matrix_int.h:48
      block : access gsl_gsl_block_int_h.gsl_block_int_struct;  -- /usr/include/gsl/gsl_matrix_int.h:49
      owner : aliased int;  -- /usr/include/gsl/gsl_matrix_int.h:50
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/gsl/gsl_matrix_int.h:51

   type u_gsl_matrix_int_view is record
      matrix : aliased gsl_matrix_int;  -- /usr/include/gsl/gsl_matrix_int.h:55
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/gsl/gsl_matrix_int.h:56

   subtype gsl_matrix_int_view is u_gsl_matrix_int_view;  -- /usr/include/gsl/gsl_matrix_int.h:58

   type u_gsl_matrix_int_const_view is record
      matrix : aliased gsl_matrix_int;  -- /usr/include/gsl/gsl_matrix_int.h:62
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/gsl/gsl_matrix_int.h:63

   subtype gsl_matrix_int_const_view is u_gsl_matrix_int_const_view;  -- /usr/include/gsl/gsl_matrix_int.h:65

  -- Allocation  
   function gsl_matrix_int_alloc (n1 : stddef_h.size_t; n2 : stddef_h.size_t) return access gsl_matrix_int  -- /usr/include/gsl/gsl_matrix_int.h:70
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_alloc";

   function gsl_matrix_int_calloc (n1 : stddef_h.size_t; n2 : stddef_h.size_t) return access gsl_matrix_int  -- /usr/include/gsl/gsl_matrix_int.h:73
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_calloc";

   function gsl_matrix_int_alloc_from_block
     (b : access gsl_gsl_block_int_h.gsl_block_int_struct;
      offset : stddef_h.size_t;
      n1 : stddef_h.size_t;
      n2 : stddef_h.size_t;
      d2 : stddef_h.size_t) return access gsl_matrix_int  -- /usr/include/gsl/gsl_matrix_int.h:76
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_alloc_from_block";

   function gsl_matrix_int_alloc_from_matrix
     (m : access gsl_matrix_int;
      k1 : stddef_h.size_t;
      k2 : stddef_h.size_t;
      n1 : stddef_h.size_t;
      n2 : stddef_h.size_t) return access gsl_matrix_int  -- /usr/include/gsl/gsl_matrix_int.h:83
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_alloc_from_matrix";

   function gsl_vector_int_alloc_row_from_matrix (m : access gsl_matrix_int; i : stddef_h.size_t) return access gsl_gsl_vector_int_h.gsl_vector_int  -- /usr/include/gsl/gsl_matrix_int.h:90
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_alloc_row_from_matrix";

   function gsl_vector_int_alloc_col_from_matrix (m : access gsl_matrix_int; j : stddef_h.size_t) return access gsl_gsl_vector_int_h.gsl_vector_int  -- /usr/include/gsl/gsl_matrix_int.h:94
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_vector_int_alloc_col_from_matrix";

   procedure gsl_matrix_int_free (m : access gsl_matrix_int)  -- /usr/include/gsl/gsl_matrix_int.h:97
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_free";

  -- Views  
   function gsl_matrix_int_submatrix
     (m : access gsl_matrix_int;
      i : stddef_h.size_t;
      j : stddef_h.size_t;
      n1 : stddef_h.size_t;
      n2 : stddef_h.size_t) return u_gsl_matrix_int_view  -- /usr/include/gsl/gsl_matrix_int.h:102
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_submatrix";

   function gsl_matrix_int_row (m : access gsl_matrix_int; i : stddef_h.size_t) return gsl_gsl_vector_int_h.u_gsl_vector_int_view  -- /usr/include/gsl/gsl_matrix_int.h:107
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_row";

   function gsl_matrix_int_column (m : access gsl_matrix_int; j : stddef_h.size_t) return gsl_gsl_vector_int_h.u_gsl_vector_int_view  -- /usr/include/gsl/gsl_matrix_int.h:110
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_column";

   function gsl_matrix_int_diagonal (m : access gsl_matrix_int) return gsl_gsl_vector_int_h.u_gsl_vector_int_view  -- /usr/include/gsl/gsl_matrix_int.h:113
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_diagonal";

   function gsl_matrix_int_subdiagonal (m : access gsl_matrix_int; k : stddef_h.size_t) return gsl_gsl_vector_int_h.u_gsl_vector_int_view  -- /usr/include/gsl/gsl_matrix_int.h:116
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_subdiagonal";

   function gsl_matrix_int_superdiagonal (m : access gsl_matrix_int; k : stddef_h.size_t) return gsl_gsl_vector_int_h.u_gsl_vector_int_view  -- /usr/include/gsl/gsl_matrix_int.h:119
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_superdiagonal";

   function gsl_matrix_int_subrow
     (m : access gsl_matrix_int;
      i : stddef_h.size_t;
      offset : stddef_h.size_t;
      n : stddef_h.size_t) return gsl_gsl_vector_int_h.u_gsl_vector_int_view  -- /usr/include/gsl/gsl_matrix_int.h:122
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_subrow";

   function gsl_matrix_int_subcolumn
     (m : access gsl_matrix_int;
      j : stddef_h.size_t;
      offset : stddef_h.size_t;
      n : stddef_h.size_t) return gsl_gsl_vector_int_h.u_gsl_vector_int_view  -- /usr/include/gsl/gsl_matrix_int.h:126
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_subcolumn";

   function gsl_matrix_int_view_array
     (base : access int;
      n1 : stddef_h.size_t;
      n2 : stddef_h.size_t) return u_gsl_matrix_int_view  -- /usr/include/gsl/gsl_matrix_int.h:130
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_view_array";

   function gsl_matrix_int_view_array_with_tda
     (base : access int;
      n1 : stddef_h.size_t;
      n2 : stddef_h.size_t;
      tda : stddef_h.size_t) return u_gsl_matrix_int_view  -- /usr/include/gsl/gsl_matrix_int.h:135
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_view_array_with_tda";

   function gsl_matrix_int_view_vector
     (v : access gsl_gsl_vector_int_h.gsl_vector_int;
      n1 : stddef_h.size_t;
      n2 : stddef_h.size_t) return u_gsl_matrix_int_view  -- /usr/include/gsl/gsl_matrix_int.h:142
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_view_vector";

   function gsl_matrix_int_view_vector_with_tda
     (v : access gsl_gsl_vector_int_h.gsl_vector_int;
      n1 : stddef_h.size_t;
      n2 : stddef_h.size_t;
      tda : stddef_h.size_t) return u_gsl_matrix_int_view  -- /usr/include/gsl/gsl_matrix_int.h:147
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_view_vector_with_tda";

   function gsl_matrix_int_const_submatrix
     (m : access constant gsl_matrix_int;
      i : stddef_h.size_t;
      j : stddef_h.size_t;
      n1 : stddef_h.size_t;
      n2 : stddef_h.size_t) return u_gsl_matrix_int_const_view  -- /usr/include/gsl/gsl_matrix_int.h:154
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_const_submatrix";

   function gsl_matrix_int_const_row (m : access constant gsl_matrix_int; i : stddef_h.size_t) return gsl_gsl_vector_int_h.u_gsl_vector_int_const_view  -- /usr/include/gsl/gsl_matrix_int.h:159
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_const_row";

   function gsl_matrix_int_const_column (m : access constant gsl_matrix_int; j : stddef_h.size_t) return gsl_gsl_vector_int_h.u_gsl_vector_int_const_view  -- /usr/include/gsl/gsl_matrix_int.h:163
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_const_column";

   function gsl_matrix_int_const_diagonal (m : access constant gsl_matrix_int) return gsl_gsl_vector_int_h.u_gsl_vector_int_const_view  -- /usr/include/gsl/gsl_matrix_int.h:167
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_const_diagonal";

   function gsl_matrix_int_const_subdiagonal (m : access constant gsl_matrix_int; k : stddef_h.size_t) return gsl_gsl_vector_int_h.u_gsl_vector_int_const_view  -- /usr/include/gsl/gsl_matrix_int.h:170
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_const_subdiagonal";

   function gsl_matrix_int_const_superdiagonal (m : access constant gsl_matrix_int; k : stddef_h.size_t) return gsl_gsl_vector_int_h.u_gsl_vector_int_const_view  -- /usr/include/gsl/gsl_matrix_int.h:174
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_const_superdiagonal";

   function gsl_matrix_int_const_subrow
     (m : access constant gsl_matrix_int;
      i : stddef_h.size_t;
      offset : stddef_h.size_t;
      n : stddef_h.size_t) return gsl_gsl_vector_int_h.u_gsl_vector_int_const_view  -- /usr/include/gsl/gsl_matrix_int.h:178
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_const_subrow";

   function gsl_matrix_int_const_subcolumn
     (m : access constant gsl_matrix_int;
      j : stddef_h.size_t;
      offset : stddef_h.size_t;
      n : stddef_h.size_t) return gsl_gsl_vector_int_h.u_gsl_vector_int_const_view  -- /usr/include/gsl/gsl_matrix_int.h:182
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_const_subcolumn";

   function gsl_matrix_int_const_view_array
     (base : access int;
      n1 : stddef_h.size_t;
      n2 : stddef_h.size_t) return u_gsl_matrix_int_const_view  -- /usr/include/gsl/gsl_matrix_int.h:186
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_const_view_array";

   function gsl_matrix_int_const_view_array_with_tda
     (base : access int;
      n1 : stddef_h.size_t;
      n2 : stddef_h.size_t;
      tda : stddef_h.size_t) return u_gsl_matrix_int_const_view  -- /usr/include/gsl/gsl_matrix_int.h:191
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_const_view_array_with_tda";

   function gsl_matrix_int_const_view_vector
     (v : access constant gsl_gsl_vector_int_h.gsl_vector_int;
      n1 : stddef_h.size_t;
      n2 : stddef_h.size_t) return u_gsl_matrix_int_const_view  -- /usr/include/gsl/gsl_matrix_int.h:197
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_const_view_vector";

   function gsl_matrix_int_const_view_vector_with_tda
     (v : access constant gsl_gsl_vector_int_h.gsl_vector_int;
      n1 : stddef_h.size_t;
      n2 : stddef_h.size_t;
      tda : stddef_h.size_t) return u_gsl_matrix_int_const_view  -- /usr/include/gsl/gsl_matrix_int.h:202
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_const_view_vector_with_tda";

  -- Operations  
   procedure gsl_matrix_int_set_zero (m : access gsl_matrix_int)  -- /usr/include/gsl/gsl_matrix_int.h:209
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_set_zero";

   procedure gsl_matrix_int_set_identity (m : access gsl_matrix_int)  -- /usr/include/gsl/gsl_matrix_int.h:210
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_set_identity";

   procedure gsl_matrix_int_set_all (m : access gsl_matrix_int; x : int)  -- /usr/include/gsl/gsl_matrix_int.h:211
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_set_all";




   function gsl_matrix_int_memcpy (dest : access gsl_matrix_int; src : access constant gsl_matrix_int) return int  -- /usr/include/gsl/gsl_matrix_int.h:218
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_memcpy";

   function gsl_matrix_int_swap (m1 : access gsl_matrix_int; m2 : access gsl_matrix_int) return int  -- /usr/include/gsl/gsl_matrix_int.h:219
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_swap";

   function gsl_matrix_int_tricpy
     (Uplo : gsl_gsl_blas_types_h.CBLAS_UPLO_t;
      Diag : gsl_gsl_blas_types_h.CBLAS_DIAG_t;
      dest : access gsl_matrix_int;
      src : access constant gsl_matrix_int) return int  -- /usr/include/gsl/gsl_matrix_int.h:220
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_tricpy";

   function gsl_matrix_int_swap_rows
     (m : access gsl_matrix_int;
      i : stddef_h.size_t;
      j : stddef_h.size_t) return int  -- /usr/include/gsl/gsl_matrix_int.h:222
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_swap_rows";

   function gsl_matrix_int_swap_columns
     (m : access gsl_matrix_int;
      i : stddef_h.size_t;
      j : stddef_h.size_t) return int  -- /usr/include/gsl/gsl_matrix_int.h:223
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_swap_columns";

   function gsl_matrix_int_swap_rowcol
     (m : access gsl_matrix_int;
      i : stddef_h.size_t;
      j : stddef_h.size_t) return int  -- /usr/include/gsl/gsl_matrix_int.h:224
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_swap_rowcol";

   function gsl_matrix_int_transpose (m : access gsl_matrix_int) return int  -- /usr/include/gsl/gsl_matrix_int.h:225
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_transpose";

   function gsl_matrix_int_transpose_memcpy (dest : access gsl_matrix_int; src : access constant gsl_matrix_int) return int  -- /usr/include/gsl/gsl_matrix_int.h:226
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_transpose_memcpy";

   function gsl_matrix_int_transpose_tricpy
     (Uplo_src : gsl_gsl_blas_types_h.CBLAS_UPLO_t;
      Diag : gsl_gsl_blas_types_h.CBLAS_DIAG_t;
      dest : access gsl_matrix_int;
      src : access constant gsl_matrix_int) return int  -- /usr/include/gsl/gsl_matrix_int.h:227
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_transpose_tricpy";

   function gsl_matrix_int_max (m : access constant gsl_matrix_int) return int  -- /usr/include/gsl/gsl_matrix_int.h:229
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_max";

   function gsl_matrix_int_min (m : access constant gsl_matrix_int) return int  -- /usr/include/gsl/gsl_matrix_int.h:230
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_min";

   procedure gsl_matrix_int_minmax
     (m : access constant gsl_matrix_int;
      min_out : access int;
      max_out : access int)  -- /usr/include/gsl/gsl_matrix_int.h:231
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_minmax";

   procedure gsl_matrix_int_max_index
     (m : access constant gsl_matrix_int;
      imax : access stddef_h.size_t;
      jmax : access stddef_h.size_t)  -- /usr/include/gsl/gsl_matrix_int.h:233
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_max_index";

   procedure gsl_matrix_int_min_index
     (m : access constant gsl_matrix_int;
      imin : access stddef_h.size_t;
      jmin : access stddef_h.size_t)  -- /usr/include/gsl/gsl_matrix_int.h:234
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_min_index";

   procedure gsl_matrix_int_minmax_index
     (m : access constant gsl_matrix_int;
      imin : access stddef_h.size_t;
      jmin : access stddef_h.size_t;
      imax : access stddef_h.size_t;
      jmax : access stddef_h.size_t)  -- /usr/include/gsl/gsl_matrix_int.h:235
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_minmax_index";

   function gsl_matrix_int_equal (a : access constant gsl_matrix_int; b : access constant gsl_matrix_int) return int  -- /usr/include/gsl/gsl_matrix_int.h:237
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_equal";

   function gsl_matrix_int_isnull (m : access constant gsl_matrix_int) return int  -- /usr/include/gsl/gsl_matrix_int.h:239
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_isnull";

   function gsl_matrix_int_ispos (m : access constant gsl_matrix_int) return int  -- /usr/include/gsl/gsl_matrix_int.h:240
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_ispos";

   function gsl_matrix_int_isneg (m : access constant gsl_matrix_int) return int  -- /usr/include/gsl/gsl_matrix_int.h:241
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_isneg";

   function gsl_matrix_int_isnonneg (m : access constant gsl_matrix_int) return int  -- /usr/include/gsl/gsl_matrix_int.h:242
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_isnonneg";

   function gsl_matrix_int_norm1 (m : access constant gsl_matrix_int) return int  -- /usr/include/gsl/gsl_matrix_int.h:244
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_norm1";

   function gsl_matrix_int_add (a : access gsl_matrix_int; b : access constant gsl_matrix_int) return int  -- /usr/include/gsl/gsl_matrix_int.h:246
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_add";

   function gsl_matrix_int_sub (a : access gsl_matrix_int; b : access constant gsl_matrix_int) return int  -- /usr/include/gsl/gsl_matrix_int.h:247
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_sub";

   function gsl_matrix_int_mul_elements (a : access gsl_matrix_int; b : access constant gsl_matrix_int) return int  -- /usr/include/gsl/gsl_matrix_int.h:248
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_mul_elements";

   function gsl_matrix_int_div_elements (a : access gsl_matrix_int; b : access constant gsl_matrix_int) return int  -- /usr/include/gsl/gsl_matrix_int.h:249
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_div_elements";

   function gsl_matrix_int_scale (a : access gsl_matrix_int; x : int) return int  -- /usr/include/gsl/gsl_matrix_int.h:250
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_scale";

   function gsl_matrix_int_scale_rows (a : access gsl_matrix_int; x : access constant gsl_gsl_vector_int_h.gsl_vector_int) return int  -- /usr/include/gsl/gsl_matrix_int.h:251
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_scale_rows";

   function gsl_matrix_int_scale_columns (a : access gsl_matrix_int; x : access constant gsl_gsl_vector_int_h.gsl_vector_int) return int  -- /usr/include/gsl/gsl_matrix_int.h:252
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_scale_columns";

   function gsl_matrix_int_add_constant (a : access gsl_matrix_int; x : int) return int  -- /usr/include/gsl/gsl_matrix_int.h:253
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_add_constant";

   function gsl_matrix_int_add_diagonal (a : access gsl_matrix_int; x : int) return int  -- /usr/include/gsl/gsl_matrix_int.h:254
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_add_diagonal";

  --********************************************************************* 
  -- The functions below are obsolete                                     
  --********************************************************************* 
   function gsl_matrix_int_get_row
     (v : access gsl_gsl_vector_int_h.gsl_vector_int;
      m : access constant gsl_matrix_int;
      i : stddef_h.size_t) return int  -- /usr/include/gsl/gsl_matrix_int.h:259
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_get_row";

   function gsl_matrix_int_get_col
     (v : access gsl_gsl_vector_int_h.gsl_vector_int;
      m : access constant gsl_matrix_int;
      j : stddef_h.size_t) return int  -- /usr/include/gsl/gsl_matrix_int.h:260
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_get_col";

   function gsl_matrix_int_set_row
     (m : access gsl_matrix_int;
      i : stddef_h.size_t;
      v : access constant gsl_gsl_vector_int_h.gsl_vector_int) return int  -- /usr/include/gsl/gsl_matrix_int.h:261
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_set_row";

   function gsl_matrix_int_set_col
     (m : access gsl_matrix_int;
      j : stddef_h.size_t;
      v : access constant gsl_gsl_vector_int_h.gsl_vector_int) return int  -- /usr/include/gsl/gsl_matrix_int.h:262
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_set_col";

  --********************************************************************* 
  -- inline functions if you are using GCC  
   function gsl_matrix_int_get
     (m : access constant gsl_matrix_int;
      i : stddef_h.size_t;
      j : stddef_h.size_t) return int  -- /usr/include/gsl/gsl_matrix_int.h:267
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_get";

   procedure gsl_matrix_int_set
     (m : access gsl_matrix_int;
      i : stddef_h.size_t;
      j : stddef_h.size_t;
      x : int)  -- /usr/include/gsl/gsl_matrix_int.h:268
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_set";

   function gsl_matrix_int_ptr
     (m : access gsl_matrix_int;
      i : stddef_h.size_t;
      j : stddef_h.size_t) return access int  -- /usr/include/gsl/gsl_matrix_int.h:269
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_ptr";

   function gsl_matrix_int_const_ptr
     (m : access constant gsl_matrix_int;
      i : stddef_h.size_t;
      j : stddef_h.size_t) return access int  -- /usr/include/gsl/gsl_matrix_int.h:270
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_matrix_int_const_ptr";

end gsl_gsl_matrix_int_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
