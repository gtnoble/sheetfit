pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with stddef_h;
with gsl_gsl_cblas_h;

package gsl_gsl_blas_types_h is

   -- blas/gsl_blas_types.h
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

   -- * Author:  G. Jungman
   --

   -- Based on draft BLAST C interface specification  [Jul 7 1998]
   --

   subtype CBLAS_INDEX_t is
     stddef_h.size_t;  -- /usr/include/gsl/gsl_blas_types.h:42

   subtype CBLAS_ORDER_t is
     gsl_gsl_cblas_h.CBLAS_ORDER;  -- /usr/include/gsl/gsl_blas_types.h:43

   subtype CBLAS_TRANSPOSE_t is
     gsl_gsl_cblas_h.CBLAS_TRANSPOSE;  -- /usr/include/gsl/gsl_blas_types.h:44

   subtype CBLAS_UPLO_t is
     gsl_gsl_cblas_h.CBLAS_UPLO;  -- /usr/include/gsl/gsl_blas_types.h:45

   subtype CBLAS_DIAG_t is
     gsl_gsl_cblas_h.CBLAS_DIAG;  -- /usr/include/gsl/gsl_blas_types.h:46

   subtype CBLAS_SIDE_t is
     gsl_gsl_cblas_h.CBLAS_SIDE;  -- /usr/include/gsl/gsl_blas_types.h:47

   -- typedef  gsl_complex  COMPLEX;
end gsl_gsl_blas_types_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
