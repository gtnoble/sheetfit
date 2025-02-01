pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with System;
with stddef_h;
with Interfaces.C.Strings;

package gsl_gsl_cblas_h is

   --  unsupported macro: CBLAS_INDEX size_t
  -- blas/gsl_cblas.h
  -- * 
  -- * Copyright (C) 1996, 1997, 1998, 1999, 2000 Gerard Jungman
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

  -- This is a copy of the CBLAS standard header.
  -- * We carry this around so we do not have to
  -- * break our model for flexible BLAS functionality.
  --  

  -- * Enumerated and derived types
  --  

   subtype CBLAS_ORDER is unsigned;
   CBLAS_ORDER_CblasRowMajor : constant CBLAS_ORDER := 101;
   CBLAS_ORDER_CblasColMajor : constant CBLAS_ORDER := 102;  -- /usr/include/gsl/gsl_cblas.h:46

   subtype CBLAS_TRANSPOSE is unsigned;
   CBLAS_TRANSPOSE_CblasNoTrans : constant CBLAS_TRANSPOSE := 111;
   CBLAS_TRANSPOSE_CblasTrans : constant CBLAS_TRANSPOSE := 112;
   CBLAS_TRANSPOSE_CblasConjTrans : constant CBLAS_TRANSPOSE := 113;  -- /usr/include/gsl/gsl_cblas.h:47

   subtype CBLAS_UPLO is unsigned;
   CBLAS_UPLO_CblasUpper : constant CBLAS_UPLO := 121;
   CBLAS_UPLO_CblasLower : constant CBLAS_UPLO := 122;  -- /usr/include/gsl/gsl_cblas.h:48

   subtype CBLAS_DIAG is unsigned;
   CBLAS_DIAG_CblasNonUnit : constant CBLAS_DIAG := 131;
   CBLAS_DIAG_CblasUnit : constant CBLAS_DIAG := 132;  -- /usr/include/gsl/gsl_cblas.h:49

   subtype CBLAS_SIDE is unsigned;
   CBLAS_SIDE_CblasLeft : constant CBLAS_SIDE := 141;
   CBLAS_SIDE_CblasRight : constant CBLAS_SIDE := 142;  -- /usr/include/gsl/gsl_cblas.h:50

  -- * ===========================================================================
  -- * Prototypes for level 1 BLAS functions (complex are recast as routines)
  -- * ===========================================================================
  --  

   function cblas_sdsdot
     (N : int;
      alpha : float;
      X : access float;
      incX : int;
      Y : access float;
      incY : int) return float  -- /usr/include/gsl/gsl_cblas.h:57
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_sdsdot";

   function cblas_dsdot
     (N : int;
      X : access float;
      incX : int;
      Y : access float;
      incY : int) return double  -- /usr/include/gsl/gsl_cblas.h:59
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_dsdot";

   function cblas_sdot
     (N : int;
      X : access float;
      incX : int;
      Y : access float;
      incY : int) return float  -- /usr/include/gsl/gsl_cblas.h:61
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_sdot";

   function cblas_ddot
     (N : int;
      X : access double;
      incX : int;
      Y : access double;
      incY : int) return double  -- /usr/include/gsl/gsl_cblas.h:63
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_ddot";

  -- * Functions having prefixes Z and C only
  --  

   procedure cblas_cdotu_sub
     (N : int;
      X : System.Address;
      incX : int;
      Y : System.Address;
      incY : int;
      dotu : System.Address)  -- /usr/include/gsl/gsl_cblas.h:69
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_cdotu_sub";

   procedure cblas_cdotc_sub
     (N : int;
      X : System.Address;
      incX : int;
      Y : System.Address;
      incY : int;
      dotc : System.Address)  -- /usr/include/gsl/gsl_cblas.h:71
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_cdotc_sub";

   procedure cblas_zdotu_sub
     (N : int;
      X : System.Address;
      incX : int;
      Y : System.Address;
      incY : int;
      dotu : System.Address)  -- /usr/include/gsl/gsl_cblas.h:74
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_zdotu_sub";

   procedure cblas_zdotc_sub
     (N : int;
      X : System.Address;
      incX : int;
      Y : System.Address;
      incY : int;
      dotc : System.Address)  -- /usr/include/gsl/gsl_cblas.h:76
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_zdotc_sub";

  -- * Functions having prefixes S D SC DZ
  --  

   function cblas_snrm2
     (N : int;
      X : access float;
      incX : int) return float  -- /usr/include/gsl/gsl_cblas.h:83
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_snrm2";

   function cblas_sasum
     (N : int;
      X : access float;
      incX : int) return float  -- /usr/include/gsl/gsl_cblas.h:84
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_sasum";

   function cblas_dnrm2
     (N : int;
      X : access double;
      incX : int) return double  -- /usr/include/gsl/gsl_cblas.h:86
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_dnrm2";

   function cblas_dasum
     (N : int;
      X : access double;
      incX : int) return double  -- /usr/include/gsl/gsl_cblas.h:87
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_dasum";

   function cblas_scnrm2
     (N : int;
      X : System.Address;
      incX : int) return float  -- /usr/include/gsl/gsl_cblas.h:89
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_scnrm2";

   function cblas_scasum
     (N : int;
      X : System.Address;
      incX : int) return float  -- /usr/include/gsl/gsl_cblas.h:90
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_scasum";

   function cblas_dznrm2
     (N : int;
      X : System.Address;
      incX : int) return double  -- /usr/include/gsl/gsl_cblas.h:92
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_dznrm2";

   function cblas_dzasum
     (N : int;
      X : System.Address;
      incX : int) return double  -- /usr/include/gsl/gsl_cblas.h:93
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_dzasum";

  -- * Functions having standard 4 prefixes (S D C Z)
  --  

   function cblas_isamax
     (N : int;
      X : access float;
      incX : int) return stddef_h.size_t  -- /usr/include/gsl/gsl_cblas.h:99
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_isamax";

   function cblas_idamax
     (N : int;
      X : access double;
      incX : int) return stddef_h.size_t  -- /usr/include/gsl/gsl_cblas.h:100
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_idamax";

   function cblas_icamax
     (N : int;
      X : System.Address;
      incX : int) return stddef_h.size_t  -- /usr/include/gsl/gsl_cblas.h:101
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_icamax";

   function cblas_izamax
     (N : int;
      X : System.Address;
      incX : int) return stddef_h.size_t  -- /usr/include/gsl/gsl_cblas.h:102
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_izamax";

  -- * ===========================================================================
  -- * Prototypes for level 1 BLAS routines
  -- * ===========================================================================
  --  

  -- 
  -- * Routines with standard 4 prefixes (s, d, c, z)
  --  

   procedure cblas_sswap
     (N : int;
      X : access float;
      incX : int;
      Y : access float;
      incY : int)  -- /usr/include/gsl/gsl_cblas.h:113
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_sswap";

   procedure cblas_scopy
     (N : int;
      X : access float;
      incX : int;
      Y : access float;
      incY : int)  -- /usr/include/gsl/gsl_cblas.h:115
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_scopy";

   procedure cblas_saxpy
     (N : int;
      alpha : float;
      X : access float;
      incX : int;
      Y : access float;
      incY : int)  -- /usr/include/gsl/gsl_cblas.h:117
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_saxpy";

   procedure cblas_dswap
     (N : int;
      X : access double;
      incX : int;
      Y : access double;
      incY : int)  -- /usr/include/gsl/gsl_cblas.h:120
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_dswap";

   procedure cblas_dcopy
     (N : int;
      X : access double;
      incX : int;
      Y : access double;
      incY : int)  -- /usr/include/gsl/gsl_cblas.h:122
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_dcopy";

   procedure cblas_daxpy
     (N : int;
      alpha : double;
      X : access double;
      incX : int;
      Y : access double;
      incY : int)  -- /usr/include/gsl/gsl_cblas.h:124
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_daxpy";

   procedure cblas_cswap
     (N : int;
      X : System.Address;
      incX : int;
      Y : System.Address;
      incY : int)  -- /usr/include/gsl/gsl_cblas.h:127
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_cswap";

   procedure cblas_ccopy
     (N : int;
      X : System.Address;
      incX : int;
      Y : System.Address;
      incY : int)  -- /usr/include/gsl/gsl_cblas.h:129
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_ccopy";

   procedure cblas_caxpy
     (N : int;
      alpha : System.Address;
      X : System.Address;
      incX : int;
      Y : System.Address;
      incY : int)  -- /usr/include/gsl/gsl_cblas.h:131
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_caxpy";

   procedure cblas_zswap
     (N : int;
      X : System.Address;
      incX : int;
      Y : System.Address;
      incY : int)  -- /usr/include/gsl/gsl_cblas.h:134
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_zswap";

   procedure cblas_zcopy
     (N : int;
      X : System.Address;
      incX : int;
      Y : System.Address;
      incY : int)  -- /usr/include/gsl/gsl_cblas.h:136
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_zcopy";

   procedure cblas_zaxpy
     (N : int;
      alpha : System.Address;
      X : System.Address;
      incX : int;
      Y : System.Address;
      incY : int)  -- /usr/include/gsl/gsl_cblas.h:138
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_zaxpy";

  -- 
  -- * Routines with S and D prefix only
  --  

   procedure cblas_srotg
     (a : access float;
      b : access float;
      c : access float;
      s : access float)  -- /usr/include/gsl/gsl_cblas.h:145
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_srotg";

   procedure cblas_srotmg
     (d1 : access float;
      d2 : access float;
      b1 : access float;
      b2 : float;
      P : access float)  -- /usr/include/gsl/gsl_cblas.h:146
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_srotmg";

   procedure cblas_srot
     (N : int;
      X : access float;
      incX : int;
      Y : access float;
      incY : int;
      c : float;
      s : float)  -- /usr/include/gsl/gsl_cblas.h:147
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_srot";

   procedure cblas_srotm
     (N : int;
      X : access float;
      incX : int;
      Y : access float;
      incY : int;
      P : access float)  -- /usr/include/gsl/gsl_cblas.h:149
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_srotm";

   procedure cblas_drotg
     (a : access double;
      b : access double;
      c : access double;
      s : access double)  -- /usr/include/gsl/gsl_cblas.h:152
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_drotg";

   procedure cblas_drotmg
     (d1 : access double;
      d2 : access double;
      b1 : access double;
      b2 : double;
      P : access double)  -- /usr/include/gsl/gsl_cblas.h:153
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_drotmg";

   procedure cblas_drot
     (N : int;
      X : access double;
      incX : int;
      Y : access double;
      incY : int;
      c : double;
      s : double)  -- /usr/include/gsl/gsl_cblas.h:154
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_drot";

   procedure cblas_drotm
     (N : int;
      X : access double;
      incX : int;
      Y : access double;
      incY : int;
      P : access double)  -- /usr/include/gsl/gsl_cblas.h:156
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_drotm";

  -- 
  -- * Routines with S D C Z CS and ZD prefixes
  --  

   procedure cblas_sscal
     (N : int;
      alpha : float;
      X : access float;
      incX : int)  -- /usr/include/gsl/gsl_cblas.h:163
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_sscal";

   procedure cblas_dscal
     (N : int;
      alpha : double;
      X : access double;
      incX : int)  -- /usr/include/gsl/gsl_cblas.h:164
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_dscal";

   procedure cblas_cscal
     (N : int;
      alpha : System.Address;
      X : System.Address;
      incX : int)  -- /usr/include/gsl/gsl_cblas.h:165
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_cscal";

   procedure cblas_zscal
     (N : int;
      alpha : System.Address;
      X : System.Address;
      incX : int)  -- /usr/include/gsl/gsl_cblas.h:166
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_zscal";

   procedure cblas_csscal
     (N : int;
      alpha : float;
      X : System.Address;
      incX : int)  -- /usr/include/gsl/gsl_cblas.h:167
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_csscal";

   procedure cblas_zdscal
     (N : int;
      alpha : double;
      X : System.Address;
      incX : int)  -- /usr/include/gsl/gsl_cblas.h:168
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_zdscal";

  -- * ===========================================================================
  -- * Prototypes for level 2 BLAS
  -- * ===========================================================================
  --  

  -- 
  -- * Routines with standard 4 prefixes (S, D, C, Z)
  --  

   procedure cblas_sgemv
     (order : CBLAS_ORDER;
      TransA : CBLAS_TRANSPOSE;
      M : int;
      N : int;
      alpha : float;
      A : access float;
      lda : int;
      X : access float;
      incX : int;
      beta : float;
      Y : access float;
      incY : int)  -- /usr/include/gsl/gsl_cblas.h:179
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_sgemv";

   procedure cblas_sgbmv
     (order : CBLAS_ORDER;
      TransA : CBLAS_TRANSPOSE;
      M : int;
      N : int;
      KL : int;
      KU : int;
      alpha : float;
      A : access float;
      lda : int;
      X : access float;
      incX : int;
      beta : float;
      Y : access float;
      incY : int)  -- /usr/include/gsl/gsl_cblas.h:184
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_sgbmv";

   procedure cblas_strmv
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      TransA : CBLAS_TRANSPOSE;
      Diag : CBLAS_DIAG;
      N : int;
      A : access float;
      lda : int;
      X : access float;
      incX : int)  -- /usr/include/gsl/gsl_cblas.h:189
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_strmv";

   procedure cblas_stbmv
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      TransA : CBLAS_TRANSPOSE;
      Diag : CBLAS_DIAG;
      N : int;
      K : int;
      A : access float;
      lda : int;
      X : access float;
      incX : int)  -- /usr/include/gsl/gsl_cblas.h:193
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_stbmv";

   procedure cblas_stpmv
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      TransA : CBLAS_TRANSPOSE;
      Diag : CBLAS_DIAG;
      N : int;
      Ap : access float;
      X : access float;
      incX : int)  -- /usr/include/gsl/gsl_cblas.h:197
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_stpmv";

   procedure cblas_strsv
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      TransA : CBLAS_TRANSPOSE;
      Diag : CBLAS_DIAG;
      N : int;
      A : access float;
      lda : int;
      X : access float;
      incX : int)  -- /usr/include/gsl/gsl_cblas.h:200
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_strsv";

   procedure cblas_stbsv
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      TransA : CBLAS_TRANSPOSE;
      Diag : CBLAS_DIAG;
      N : int;
      K : int;
      A : access float;
      lda : int;
      X : access float;
      incX : int)  -- /usr/include/gsl/gsl_cblas.h:204
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_stbsv";

   procedure cblas_stpsv
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      TransA : CBLAS_TRANSPOSE;
      Diag : CBLAS_DIAG;
      N : int;
      Ap : access float;
      X : access float;
      incX : int)  -- /usr/include/gsl/gsl_cblas.h:208
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_stpsv";

   procedure cblas_dgemv
     (order : CBLAS_ORDER;
      TransA : CBLAS_TRANSPOSE;
      M : int;
      N : int;
      alpha : double;
      A : access double;
      lda : int;
      X : access double;
      incX : int;
      beta : double;
      Y : access double;
      incY : int)  -- /usr/include/gsl/gsl_cblas.h:212
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_dgemv";

   procedure cblas_dgbmv
     (order : CBLAS_ORDER;
      TransA : CBLAS_TRANSPOSE;
      M : int;
      N : int;
      KL : int;
      KU : int;
      alpha : double;
      A : access double;
      lda : int;
      X : access double;
      incX : int;
      beta : double;
      Y : access double;
      incY : int)  -- /usr/include/gsl/gsl_cblas.h:217
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_dgbmv";

   procedure cblas_dtrmv
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      TransA : CBLAS_TRANSPOSE;
      Diag : CBLAS_DIAG;
      N : int;
      A : access double;
      lda : int;
      X : access double;
      incX : int)  -- /usr/include/gsl/gsl_cblas.h:222
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_dtrmv";

   procedure cblas_dtbmv
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      TransA : CBLAS_TRANSPOSE;
      Diag : CBLAS_DIAG;
      N : int;
      K : int;
      A : access double;
      lda : int;
      X : access double;
      incX : int)  -- /usr/include/gsl/gsl_cblas.h:226
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_dtbmv";

   procedure cblas_dtpmv
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      TransA : CBLAS_TRANSPOSE;
      Diag : CBLAS_DIAG;
      N : int;
      Ap : access double;
      X : access double;
      incX : int)  -- /usr/include/gsl/gsl_cblas.h:230
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_dtpmv";

   procedure cblas_dtrsv
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      TransA : CBLAS_TRANSPOSE;
      Diag : CBLAS_DIAG;
      N : int;
      A : access double;
      lda : int;
      X : access double;
      incX : int)  -- /usr/include/gsl/gsl_cblas.h:233
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_dtrsv";

   procedure cblas_dtbsv
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      TransA : CBLAS_TRANSPOSE;
      Diag : CBLAS_DIAG;
      N : int;
      K : int;
      A : access double;
      lda : int;
      X : access double;
      incX : int)  -- /usr/include/gsl/gsl_cblas.h:237
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_dtbsv";

   procedure cblas_dtpsv
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      TransA : CBLAS_TRANSPOSE;
      Diag : CBLAS_DIAG;
      N : int;
      Ap : access double;
      X : access double;
      incX : int)  -- /usr/include/gsl/gsl_cblas.h:241
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_dtpsv";

   procedure cblas_cgemv
     (order : CBLAS_ORDER;
      TransA : CBLAS_TRANSPOSE;
      M : int;
      N : int;
      alpha : System.Address;
      A : System.Address;
      lda : int;
      X : System.Address;
      incX : int;
      beta : System.Address;
      Y : System.Address;
      incY : int)  -- /usr/include/gsl/gsl_cblas.h:245
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_cgemv";

   procedure cblas_cgbmv
     (order : CBLAS_ORDER;
      TransA : CBLAS_TRANSPOSE;
      M : int;
      N : int;
      KL : int;
      KU : int;
      alpha : System.Address;
      A : System.Address;
      lda : int;
      X : System.Address;
      incX : int;
      beta : System.Address;
      Y : System.Address;
      incY : int)  -- /usr/include/gsl/gsl_cblas.h:250
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_cgbmv";

   procedure cblas_ctrmv
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      TransA : CBLAS_TRANSPOSE;
      Diag : CBLAS_DIAG;
      N : int;
      A : System.Address;
      lda : int;
      X : System.Address;
      incX : int)  -- /usr/include/gsl/gsl_cblas.h:255
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_ctrmv";

   procedure cblas_ctbmv
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      TransA : CBLAS_TRANSPOSE;
      Diag : CBLAS_DIAG;
      N : int;
      K : int;
      A : System.Address;
      lda : int;
      X : System.Address;
      incX : int)  -- /usr/include/gsl/gsl_cblas.h:259
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_ctbmv";

   procedure cblas_ctpmv
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      TransA : CBLAS_TRANSPOSE;
      Diag : CBLAS_DIAG;
      N : int;
      Ap : System.Address;
      X : System.Address;
      incX : int)  -- /usr/include/gsl/gsl_cblas.h:263
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_ctpmv";

   procedure cblas_ctrsv
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      TransA : CBLAS_TRANSPOSE;
      Diag : CBLAS_DIAG;
      N : int;
      A : System.Address;
      lda : int;
      X : System.Address;
      incX : int)  -- /usr/include/gsl/gsl_cblas.h:266
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_ctrsv";

   procedure cblas_ctbsv
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      TransA : CBLAS_TRANSPOSE;
      Diag : CBLAS_DIAG;
      N : int;
      K : int;
      A : System.Address;
      lda : int;
      X : System.Address;
      incX : int)  -- /usr/include/gsl/gsl_cblas.h:270
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_ctbsv";

   procedure cblas_ctpsv
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      TransA : CBLAS_TRANSPOSE;
      Diag : CBLAS_DIAG;
      N : int;
      Ap : System.Address;
      X : System.Address;
      incX : int)  -- /usr/include/gsl/gsl_cblas.h:274
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_ctpsv";

   procedure cblas_zgemv
     (order : CBLAS_ORDER;
      TransA : CBLAS_TRANSPOSE;
      M : int;
      N : int;
      alpha : System.Address;
      A : System.Address;
      lda : int;
      X : System.Address;
      incX : int;
      beta : System.Address;
      Y : System.Address;
      incY : int)  -- /usr/include/gsl/gsl_cblas.h:278
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_zgemv";

   procedure cblas_zgbmv
     (order : CBLAS_ORDER;
      TransA : CBLAS_TRANSPOSE;
      M : int;
      N : int;
      KL : int;
      KU : int;
      alpha : System.Address;
      A : System.Address;
      lda : int;
      X : System.Address;
      incX : int;
      beta : System.Address;
      Y : System.Address;
      incY : int)  -- /usr/include/gsl/gsl_cblas.h:283
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_zgbmv";

   procedure cblas_ztrmv
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      TransA : CBLAS_TRANSPOSE;
      Diag : CBLAS_DIAG;
      N : int;
      A : System.Address;
      lda : int;
      X : System.Address;
      incX : int)  -- /usr/include/gsl/gsl_cblas.h:288
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_ztrmv";

   procedure cblas_ztbmv
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      TransA : CBLAS_TRANSPOSE;
      Diag : CBLAS_DIAG;
      N : int;
      K : int;
      A : System.Address;
      lda : int;
      X : System.Address;
      incX : int)  -- /usr/include/gsl/gsl_cblas.h:292
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_ztbmv";

   procedure cblas_ztpmv
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      TransA : CBLAS_TRANSPOSE;
      Diag : CBLAS_DIAG;
      N : int;
      Ap : System.Address;
      X : System.Address;
      incX : int)  -- /usr/include/gsl/gsl_cblas.h:296
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_ztpmv";

   procedure cblas_ztrsv
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      TransA : CBLAS_TRANSPOSE;
      Diag : CBLAS_DIAG;
      N : int;
      A : System.Address;
      lda : int;
      X : System.Address;
      incX : int)  -- /usr/include/gsl/gsl_cblas.h:299
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_ztrsv";

   procedure cblas_ztbsv
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      TransA : CBLAS_TRANSPOSE;
      Diag : CBLAS_DIAG;
      N : int;
      K : int;
      A : System.Address;
      lda : int;
      X : System.Address;
      incX : int)  -- /usr/include/gsl/gsl_cblas.h:303
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_ztbsv";

   procedure cblas_ztpsv
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      TransA : CBLAS_TRANSPOSE;
      Diag : CBLAS_DIAG;
      N : int;
      Ap : System.Address;
      X : System.Address;
      incX : int)  -- /usr/include/gsl/gsl_cblas.h:307
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_ztpsv";

  -- 
  -- * Routines with S and D prefixes only
  --  

   procedure cblas_ssymv
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      N : int;
      alpha : float;
      A : access float;
      lda : int;
      X : access float;
      incX : int;
      beta : float;
      Y : access float;
      incY : int)  -- /usr/include/gsl/gsl_cblas.h:315
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_ssymv";

   procedure cblas_ssbmv
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      N : int;
      K : int;
      alpha : float;
      A : access float;
      lda : int;
      X : access float;
      incX : int;
      beta : float;
      Y : access float;
      incY : int)  -- /usr/include/gsl/gsl_cblas.h:319
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_ssbmv";

   procedure cblas_sspmv
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      N : int;
      alpha : float;
      Ap : access float;
      X : access float;
      incX : int;
      beta : float;
      Y : access float;
      incY : int)  -- /usr/include/gsl/gsl_cblas.h:323
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_sspmv";

   procedure cblas_sger
     (order : CBLAS_ORDER;
      M : int;
      N : int;
      alpha : float;
      X : access float;
      incX : int;
      Y : access float;
      incY : int;
      A : access float;
      lda : int)  -- /usr/include/gsl/gsl_cblas.h:327
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_sger";

   procedure cblas_ssyr
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      N : int;
      alpha : float;
      X : access float;
      incX : int;
      A : access float;
      lda : int)  -- /usr/include/gsl/gsl_cblas.h:330
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_ssyr";

   procedure cblas_sspr
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      N : int;
      alpha : float;
      X : access float;
      incX : int;
      Ap : access float)  -- /usr/include/gsl/gsl_cblas.h:333
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_sspr";

   procedure cblas_ssyr2
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      N : int;
      alpha : float;
      X : access float;
      incX : int;
      Y : access float;
      incY : int;
      A : access float;
      lda : int)  -- /usr/include/gsl/gsl_cblas.h:336
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_ssyr2";

   procedure cblas_sspr2
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      N : int;
      alpha : float;
      X : access float;
      incX : int;
      Y : access float;
      incY : int;
      A : access float)  -- /usr/include/gsl/gsl_cblas.h:340
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_sspr2";

   procedure cblas_dsymv
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      N : int;
      alpha : double;
      A : access double;
      lda : int;
      X : access double;
      incX : int;
      beta : double;
      Y : access double;
      incY : int)  -- /usr/include/gsl/gsl_cblas.h:344
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_dsymv";

   procedure cblas_dsbmv
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      N : int;
      K : int;
      alpha : double;
      A : access double;
      lda : int;
      X : access double;
      incX : int;
      beta : double;
      Y : access double;
      incY : int)  -- /usr/include/gsl/gsl_cblas.h:348
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_dsbmv";

   procedure cblas_dspmv
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      N : int;
      alpha : double;
      Ap : access double;
      X : access double;
      incX : int;
      beta : double;
      Y : access double;
      incY : int)  -- /usr/include/gsl/gsl_cblas.h:352
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_dspmv";

   procedure cblas_dger
     (order : CBLAS_ORDER;
      M : int;
      N : int;
      alpha : double;
      X : access double;
      incX : int;
      Y : access double;
      incY : int;
      A : access double;
      lda : int)  -- /usr/include/gsl/gsl_cblas.h:356
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_dger";

   procedure cblas_dsyr
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      N : int;
      alpha : double;
      X : access double;
      incX : int;
      A : access double;
      lda : int)  -- /usr/include/gsl/gsl_cblas.h:359
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_dsyr";

   procedure cblas_dspr
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      N : int;
      alpha : double;
      X : access double;
      incX : int;
      Ap : access double)  -- /usr/include/gsl/gsl_cblas.h:362
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_dspr";

   procedure cblas_dsyr2
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      N : int;
      alpha : double;
      X : access double;
      incX : int;
      Y : access double;
      incY : int;
      A : access double;
      lda : int)  -- /usr/include/gsl/gsl_cblas.h:365
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_dsyr2";

   procedure cblas_dspr2
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      N : int;
      alpha : double;
      X : access double;
      incX : int;
      Y : access double;
      incY : int;
      A : access double)  -- /usr/include/gsl/gsl_cblas.h:369
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_dspr2";

  -- 
  -- * Routines with C and Z prefixes only
  --  

   procedure cblas_chemv
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      N : int;
      alpha : System.Address;
      A : System.Address;
      lda : int;
      X : System.Address;
      incX : int;
      beta : System.Address;
      Y : System.Address;
      incY : int)  -- /usr/include/gsl/gsl_cblas.h:377
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_chemv";

   procedure cblas_chbmv
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      N : int;
      K : int;
      alpha : System.Address;
      A : System.Address;
      lda : int;
      X : System.Address;
      incX : int;
      beta : System.Address;
      Y : System.Address;
      incY : int)  -- /usr/include/gsl/gsl_cblas.h:381
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_chbmv";

   procedure cblas_chpmv
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      N : int;
      alpha : System.Address;
      Ap : System.Address;
      X : System.Address;
      incX : int;
      beta : System.Address;
      Y : System.Address;
      incY : int)  -- /usr/include/gsl/gsl_cblas.h:385
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_chpmv";

   procedure cblas_cgeru
     (order : CBLAS_ORDER;
      M : int;
      N : int;
      alpha : System.Address;
      X : System.Address;
      incX : int;
      Y : System.Address;
      incY : int;
      A : System.Address;
      lda : int)  -- /usr/include/gsl/gsl_cblas.h:389
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_cgeru";

   procedure cblas_cgerc
     (order : CBLAS_ORDER;
      M : int;
      N : int;
      alpha : System.Address;
      X : System.Address;
      incX : int;
      Y : System.Address;
      incY : int;
      A : System.Address;
      lda : int)  -- /usr/include/gsl/gsl_cblas.h:392
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_cgerc";

   procedure cblas_cher
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      N : int;
      alpha : float;
      X : System.Address;
      incX : int;
      A : System.Address;
      lda : int)  -- /usr/include/gsl/gsl_cblas.h:395
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_cher";

   procedure cblas_chpr
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      N : int;
      alpha : float;
      X : System.Address;
      incX : int;
      A : System.Address)  -- /usr/include/gsl/gsl_cblas.h:398
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_chpr";

   procedure cblas_cher2
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      N : int;
      alpha : System.Address;
      X : System.Address;
      incX : int;
      Y : System.Address;
      incY : int;
      A : System.Address;
      lda : int)  -- /usr/include/gsl/gsl_cblas.h:401
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_cher2";

   procedure cblas_chpr2
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      N : int;
      alpha : System.Address;
      X : System.Address;
      incX : int;
      Y : System.Address;
      incY : int;
      Ap : System.Address)  -- /usr/include/gsl/gsl_cblas.h:404
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_chpr2";

   procedure cblas_zhemv
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      N : int;
      alpha : System.Address;
      A : System.Address;
      lda : int;
      X : System.Address;
      incX : int;
      beta : System.Address;
      Y : System.Address;
      incY : int)  -- /usr/include/gsl/gsl_cblas.h:408
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_zhemv";

   procedure cblas_zhbmv
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      N : int;
      K : int;
      alpha : System.Address;
      A : System.Address;
      lda : int;
      X : System.Address;
      incX : int;
      beta : System.Address;
      Y : System.Address;
      incY : int)  -- /usr/include/gsl/gsl_cblas.h:412
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_zhbmv";

   procedure cblas_zhpmv
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      N : int;
      alpha : System.Address;
      Ap : System.Address;
      X : System.Address;
      incX : int;
      beta : System.Address;
      Y : System.Address;
      incY : int)  -- /usr/include/gsl/gsl_cblas.h:416
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_zhpmv";

   procedure cblas_zgeru
     (order : CBLAS_ORDER;
      M : int;
      N : int;
      alpha : System.Address;
      X : System.Address;
      incX : int;
      Y : System.Address;
      incY : int;
      A : System.Address;
      lda : int)  -- /usr/include/gsl/gsl_cblas.h:420
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_zgeru";

   procedure cblas_zgerc
     (order : CBLAS_ORDER;
      M : int;
      N : int;
      alpha : System.Address;
      X : System.Address;
      incX : int;
      Y : System.Address;
      incY : int;
      A : System.Address;
      lda : int)  -- /usr/include/gsl/gsl_cblas.h:423
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_zgerc";

   procedure cblas_zher
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      N : int;
      alpha : double;
      X : System.Address;
      incX : int;
      A : System.Address;
      lda : int)  -- /usr/include/gsl/gsl_cblas.h:426
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_zher";

   procedure cblas_zhpr
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      N : int;
      alpha : double;
      X : System.Address;
      incX : int;
      A : System.Address)  -- /usr/include/gsl/gsl_cblas.h:429
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_zhpr";

   procedure cblas_zher2
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      N : int;
      alpha : System.Address;
      X : System.Address;
      incX : int;
      Y : System.Address;
      incY : int;
      A : System.Address;
      lda : int)  -- /usr/include/gsl/gsl_cblas.h:432
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_zher2";

   procedure cblas_zhpr2
     (order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      N : int;
      alpha : System.Address;
      X : System.Address;
      incX : int;
      Y : System.Address;
      incY : int;
      Ap : System.Address)  -- /usr/include/gsl/gsl_cblas.h:435
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_zhpr2";

  -- * ===========================================================================
  -- * Prototypes for level 3 BLAS
  -- * ===========================================================================
  --  

  -- 
  -- * Routines with standard 4 prefixes (S, D, C, Z)
  --  

   procedure cblas_sgemm
     (Order : CBLAS_ORDER;
      TransA : CBLAS_TRANSPOSE;
      TransB : CBLAS_TRANSPOSE;
      M : int;
      N : int;
      K : int;
      alpha : float;
      A : access float;
      lda : int;
      B : access float;
      ldb : int;
      beta : float;
      C : access float;
      ldc : int)  -- /usr/include/gsl/gsl_cblas.h:448
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_sgemm";

   procedure cblas_ssymm
     (Order : CBLAS_ORDER;
      Side : CBLAS_SIDE;
      Uplo : CBLAS_UPLO;
      M : int;
      N : int;
      alpha : float;
      A : access float;
      lda : int;
      B : access float;
      ldb : int;
      beta : float;
      C : access float;
      ldc : int)  -- /usr/include/gsl/gsl_cblas.h:453
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_ssymm";

   procedure cblas_ssyrk
     (Order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      Trans : CBLAS_TRANSPOSE;
      N : int;
      K : int;
      alpha : float;
      A : access float;
      lda : int;
      beta : float;
      C : access float;
      ldc : int)  -- /usr/include/gsl/gsl_cblas.h:458
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_ssyrk";

   procedure cblas_ssyr2k
     (Order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      Trans : CBLAS_TRANSPOSE;
      N : int;
      K : int;
      alpha : float;
      A : access float;
      lda : int;
      B : access float;
      ldb : int;
      beta : float;
      C : access float;
      ldc : int)  -- /usr/include/gsl/gsl_cblas.h:462
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_ssyr2k";

   procedure cblas_strmm
     (Order : CBLAS_ORDER;
      Side : CBLAS_SIDE;
      Uplo : CBLAS_UPLO;
      TransA : CBLAS_TRANSPOSE;
      Diag : CBLAS_DIAG;
      M : int;
      N : int;
      alpha : float;
      A : access float;
      lda : int;
      B : access float;
      ldb : int)  -- /usr/include/gsl/gsl_cblas.h:467
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_strmm";

   procedure cblas_strsm
     (Order : CBLAS_ORDER;
      Side : CBLAS_SIDE;
      Uplo : CBLAS_UPLO;
      TransA : CBLAS_TRANSPOSE;
      Diag : CBLAS_DIAG;
      M : int;
      N : int;
      alpha : float;
      A : access float;
      lda : int;
      B : access float;
      ldb : int)  -- /usr/include/gsl/gsl_cblas.h:472
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_strsm";

   procedure cblas_dgemm
     (Order : CBLAS_ORDER;
      TransA : CBLAS_TRANSPOSE;
      TransB : CBLAS_TRANSPOSE;
      M : int;
      N : int;
      K : int;
      alpha : double;
      A : access double;
      lda : int;
      B : access double;
      ldb : int;
      beta : double;
      C : access double;
      ldc : int)  -- /usr/include/gsl/gsl_cblas.h:478
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_dgemm";

   procedure cblas_dsymm
     (Order : CBLAS_ORDER;
      Side : CBLAS_SIDE;
      Uplo : CBLAS_UPLO;
      M : int;
      N : int;
      alpha : double;
      A : access double;
      lda : int;
      B : access double;
      ldb : int;
      beta : double;
      C : access double;
      ldc : int)  -- /usr/include/gsl/gsl_cblas.h:483
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_dsymm";

   procedure cblas_dsyrk
     (Order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      Trans : CBLAS_TRANSPOSE;
      N : int;
      K : int;
      alpha : double;
      A : access double;
      lda : int;
      beta : double;
      C : access double;
      ldc : int)  -- /usr/include/gsl/gsl_cblas.h:488
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_dsyrk";

   procedure cblas_dsyr2k
     (Order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      Trans : CBLAS_TRANSPOSE;
      N : int;
      K : int;
      alpha : double;
      A : access double;
      lda : int;
      B : access double;
      ldb : int;
      beta : double;
      C : access double;
      ldc : int)  -- /usr/include/gsl/gsl_cblas.h:492
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_dsyr2k";

   procedure cblas_dtrmm
     (Order : CBLAS_ORDER;
      Side : CBLAS_SIDE;
      Uplo : CBLAS_UPLO;
      TransA : CBLAS_TRANSPOSE;
      Diag : CBLAS_DIAG;
      M : int;
      N : int;
      alpha : double;
      A : access double;
      lda : int;
      B : access double;
      ldb : int)  -- /usr/include/gsl/gsl_cblas.h:497
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_dtrmm";

   procedure cblas_dtrsm
     (Order : CBLAS_ORDER;
      Side : CBLAS_SIDE;
      Uplo : CBLAS_UPLO;
      TransA : CBLAS_TRANSPOSE;
      Diag : CBLAS_DIAG;
      M : int;
      N : int;
      alpha : double;
      A : access double;
      lda : int;
      B : access double;
      ldb : int)  -- /usr/include/gsl/gsl_cblas.h:502
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_dtrsm";

   procedure cblas_cgemm
     (Order : CBLAS_ORDER;
      TransA : CBLAS_TRANSPOSE;
      TransB : CBLAS_TRANSPOSE;
      M : int;
      N : int;
      K : int;
      alpha : System.Address;
      A : System.Address;
      lda : int;
      B : System.Address;
      ldb : int;
      beta : System.Address;
      C : System.Address;
      ldc : int)  -- /usr/include/gsl/gsl_cblas.h:508
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_cgemm";

   procedure cblas_csymm
     (Order : CBLAS_ORDER;
      Side : CBLAS_SIDE;
      Uplo : CBLAS_UPLO;
      M : int;
      N : int;
      alpha : System.Address;
      A : System.Address;
      lda : int;
      B : System.Address;
      ldb : int;
      beta : System.Address;
      C : System.Address;
      ldc : int)  -- /usr/include/gsl/gsl_cblas.h:513
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_csymm";

   procedure cblas_csyrk
     (Order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      Trans : CBLAS_TRANSPOSE;
      N : int;
      K : int;
      alpha : System.Address;
      A : System.Address;
      lda : int;
      beta : System.Address;
      C : System.Address;
      ldc : int)  -- /usr/include/gsl/gsl_cblas.h:518
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_csyrk";

   procedure cblas_csyr2k
     (Order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      Trans : CBLAS_TRANSPOSE;
      N : int;
      K : int;
      alpha : System.Address;
      A : System.Address;
      lda : int;
      B : System.Address;
      ldb : int;
      beta : System.Address;
      C : System.Address;
      ldc : int)  -- /usr/include/gsl/gsl_cblas.h:522
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_csyr2k";

   procedure cblas_ctrmm
     (Order : CBLAS_ORDER;
      Side : CBLAS_SIDE;
      Uplo : CBLAS_UPLO;
      TransA : CBLAS_TRANSPOSE;
      Diag : CBLAS_DIAG;
      M : int;
      N : int;
      alpha : System.Address;
      A : System.Address;
      lda : int;
      B : System.Address;
      ldb : int)  -- /usr/include/gsl/gsl_cblas.h:527
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_ctrmm";

   procedure cblas_ctrsm
     (Order : CBLAS_ORDER;
      Side : CBLAS_SIDE;
      Uplo : CBLAS_UPLO;
      TransA : CBLAS_TRANSPOSE;
      Diag : CBLAS_DIAG;
      M : int;
      N : int;
      alpha : System.Address;
      A : System.Address;
      lda : int;
      B : System.Address;
      ldb : int)  -- /usr/include/gsl/gsl_cblas.h:532
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_ctrsm";

   procedure cblas_zgemm
     (Order : CBLAS_ORDER;
      TransA : CBLAS_TRANSPOSE;
      TransB : CBLAS_TRANSPOSE;
      M : int;
      N : int;
      K : int;
      alpha : System.Address;
      A : System.Address;
      lda : int;
      B : System.Address;
      ldb : int;
      beta : System.Address;
      C : System.Address;
      ldc : int)  -- /usr/include/gsl/gsl_cblas.h:538
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_zgemm";

   procedure cblas_zsymm
     (Order : CBLAS_ORDER;
      Side : CBLAS_SIDE;
      Uplo : CBLAS_UPLO;
      M : int;
      N : int;
      alpha : System.Address;
      A : System.Address;
      lda : int;
      B : System.Address;
      ldb : int;
      beta : System.Address;
      C : System.Address;
      ldc : int)  -- /usr/include/gsl/gsl_cblas.h:543
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_zsymm";

   procedure cblas_zsyrk
     (Order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      Trans : CBLAS_TRANSPOSE;
      N : int;
      K : int;
      alpha : System.Address;
      A : System.Address;
      lda : int;
      beta : System.Address;
      C : System.Address;
      ldc : int)  -- /usr/include/gsl/gsl_cblas.h:548
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_zsyrk";

   procedure cblas_zsyr2k
     (Order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      Trans : CBLAS_TRANSPOSE;
      N : int;
      K : int;
      alpha : System.Address;
      A : System.Address;
      lda : int;
      B : System.Address;
      ldb : int;
      beta : System.Address;
      C : System.Address;
      ldc : int)  -- /usr/include/gsl/gsl_cblas.h:552
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_zsyr2k";

   procedure cblas_ztrmm
     (Order : CBLAS_ORDER;
      Side : CBLAS_SIDE;
      Uplo : CBLAS_UPLO;
      TransA : CBLAS_TRANSPOSE;
      Diag : CBLAS_DIAG;
      M : int;
      N : int;
      alpha : System.Address;
      A : System.Address;
      lda : int;
      B : System.Address;
      ldb : int)  -- /usr/include/gsl/gsl_cblas.h:557
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_ztrmm";

   procedure cblas_ztrsm
     (Order : CBLAS_ORDER;
      Side : CBLAS_SIDE;
      Uplo : CBLAS_UPLO;
      TransA : CBLAS_TRANSPOSE;
      Diag : CBLAS_DIAG;
      M : int;
      N : int;
      alpha : System.Address;
      A : System.Address;
      lda : int;
      B : System.Address;
      ldb : int)  -- /usr/include/gsl/gsl_cblas.h:562
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_ztrsm";

  -- 
  -- * Routines with prefixes C and Z only
  --  

   procedure cblas_chemm
     (Order : CBLAS_ORDER;
      Side : CBLAS_SIDE;
      Uplo : CBLAS_UPLO;
      M : int;
      N : int;
      alpha : System.Address;
      A : System.Address;
      lda : int;
      B : System.Address;
      ldb : int;
      beta : System.Address;
      C : System.Address;
      ldc : int)  -- /usr/include/gsl/gsl_cblas.h:572
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_chemm";

   procedure cblas_cherk
     (Order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      Trans : CBLAS_TRANSPOSE;
      N : int;
      K : int;
      alpha : float;
      A : System.Address;
      lda : int;
      beta : float;
      C : System.Address;
      ldc : int)  -- /usr/include/gsl/gsl_cblas.h:577
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_cherk";

   procedure cblas_cher2k
     (Order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      Trans : CBLAS_TRANSPOSE;
      N : int;
      K : int;
      alpha : System.Address;
      A : System.Address;
      lda : int;
      B : System.Address;
      ldb : int;
      beta : float;
      C : System.Address;
      ldc : int)  -- /usr/include/gsl/gsl_cblas.h:581
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_cher2k";

   procedure cblas_zhemm
     (Order : CBLAS_ORDER;
      Side : CBLAS_SIDE;
      Uplo : CBLAS_UPLO;
      M : int;
      N : int;
      alpha : System.Address;
      A : System.Address;
      lda : int;
      B : System.Address;
      ldb : int;
      beta : System.Address;
      C : System.Address;
      ldc : int)  -- /usr/include/gsl/gsl_cblas.h:587
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_zhemm";

   procedure cblas_zherk
     (Order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      Trans : CBLAS_TRANSPOSE;
      N : int;
      K : int;
      alpha : double;
      A : System.Address;
      lda : int;
      beta : double;
      C : System.Address;
      ldc : int)  -- /usr/include/gsl/gsl_cblas.h:592
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_zherk";

   procedure cblas_zher2k
     (Order : CBLAS_ORDER;
      Uplo : CBLAS_UPLO;
      Trans : CBLAS_TRANSPOSE;
      N : int;
      K : int;
      alpha : System.Address;
      A : System.Address;
      lda : int;
      B : System.Address;
      ldb : int;
      beta : double;
      C : System.Address;
      ldc : int)  -- /usr/include/gsl/gsl_cblas.h:596
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_zher2k";

   procedure cblas_xerbla
     (p : int;
      rout : Interfaces.C.Strings.chars_ptr;
      form : Interfaces.C.Strings.chars_ptr  -- , ...
      )  -- /usr/include/gsl/gsl_cblas.h:602
   with Import => True, 
        Convention => C, 
        External_Name => "cblas_xerbla";

end gsl_gsl_cblas_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
