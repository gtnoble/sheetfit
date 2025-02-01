pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;

package gsl_gsl_complex_h is

   --  arg-macro: procedure GSL_COMPLEX_DEFINE (R, C)
   --    typedef struct { R dat(2); } C ;
   --  arg-macro: function GSL_REAL (z)
   --    return (z).dat(0);
   --  arg-macro: function GSL_IMAG (z)
   --    return (z).dat(1);
   --  arg-macro: function GSL_COMPLEX_P (zp)
   --    return (zp).dat;
   --  arg-macro: function GSL_COMPLEX_P_REAL (zp)
   --    return (zp).dat(0);
   --  arg-macro: function GSL_COMPLEX_P_IMAG (zp)
   --    return (zp).dat(1);
   --  arg-macro: function GSL_COMPLEX_EQ (z1, z2)
   --    return ((z1).dat(0) = (z2).dat(0))  and then  ((z1).dat(1) = (z2).dat(1));
   --  arg-macro: procedure GSL_SET_COMPLEX (zp, x, y)
   --    do {(zp).dat(0):=(x); (zp).dat(1):=(y);} while(0)
   --  arg-macro: procedure GSL_SET_REAL (zp, x)
   --    do {(zp).dat(0):=(x);} while(0)
   --  arg-macro: procedure GSL_SET_IMAG (zp, y)
   --    do {(zp).dat(1):=(y);} while(0)
   --  arg-macro: procedure GSL_SET_COMPLEX_PACKED (zp, n, x, y)
   --    do {*((zp)+2*(n)):=(x); *((zp)+(2*(n)+1)):=(y);} while(0)
  -- complex/gsl_complex.h
  -- * 
  -- * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2007 Gerard Jungman, Brian Gough
  -- * Copyright (C) 2020, 2021 Patrick Alken
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

  -- two consecutive built-in types as a complex number  
   type gsl_complex_packed is access all double;  -- /usr/include/gsl/gsl_complex.h:38

   type gsl_complex_packed_float is access all float;  -- /usr/include/gsl/gsl_complex.h:39

   type gsl_complex_packed_long_double is access all long_double;  -- /usr/include/gsl/gsl_complex.h:40

   type gsl_const_complex_packed is access all double;  -- /usr/include/gsl/gsl_complex.h:42

   type gsl_const_complex_packed_float is access all float;  -- /usr/include/gsl/gsl_complex.h:43

   type gsl_const_complex_packed_long_double is access all long_double;  -- /usr/include/gsl/gsl_complex.h:44

  -- 2N consecutive built-in types as N complex numbers  
   type gsl_complex_packed_array is access all double;  -- /usr/include/gsl/gsl_complex.h:48

   type gsl_complex_packed_array_float is access all float;  -- /usr/include/gsl/gsl_complex.h:49

   type gsl_complex_packed_array_long_double is access all long_double;  -- /usr/include/gsl/gsl_complex.h:50

   type gsl_const_complex_packed_array is access all double;  -- /usr/include/gsl/gsl_complex.h:52

   type gsl_const_complex_packed_array_float is access all float;  -- /usr/include/gsl/gsl_complex.h:53

   type gsl_const_complex_packed_array_long_double is access all long_double;  -- /usr/include/gsl/gsl_complex.h:54

  -- Yes... this seems weird. Trust us. The point is just that
  --   sometimes you want to make it obvious that something is
  --   an output value. The fact that it lacks a 'const' may not
  --   be enough of a clue for people in some contexts.
  --  

   type gsl_complex_packed_ptr is access all double;  -- /usr/include/gsl/gsl_complex.h:62

   type gsl_complex_packed_float_ptr is access all float;  -- /usr/include/gsl/gsl_complex.h:63

   type gsl_complex_packed_long_double_ptr is access all long_double;  -- /usr/include/gsl/gsl_complex.h:64

   type gsl_const_complex_packed_ptr is access all double;  -- /usr/include/gsl/gsl_complex.h:66

   type gsl_const_complex_packed_float_ptr is access all float;  -- /usr/include/gsl/gsl_complex.h:67

   type gsl_const_complex_packed_long_double_ptr is access all long_double;  -- /usr/include/gsl/gsl_complex.h:68

  -- * If <complex.h> is included, use the C99 complex type.  Otherwise
  -- * define a type bit-compatible with C99 complex. The GSL_REAL and GSL_IMAG
  -- * macros require C11 functionality also (_Generic)
  --  

  -- older gcc compilers claim to be C11 compliant but do not support _Generic  
  -- * According to the C17 standard, 6.2.5 paragraph 13:
  -- *
  -- * "Each complex type has the same representation and alignment requirements
  -- * as an array type containing exactly two elements of the corresponding real
  -- * type; the first element is equal to the real part, and the second element to
  -- * the imaginary part, of the complex number."
  --  

  --#  define GSL_COMPLEX_DEFINE(R, C) typedef R C[2] 
   type anon_array1650 is array (0 .. 1) of aliased double;
   type gsl_complex is record
      dat : aliased anon_array1650;  -- /usr/include/gsl/gsl_complex.h:136
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/gsl/gsl_complex.h:136

   type anon_array1653 is array (0 .. 1) of aliased long_double;
   type gsl_complex_long_double is record
      dat : aliased anon_array1653;  -- /usr/include/gsl/gsl_complex.h:137
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/gsl/gsl_complex.h:137

   type anon_array1656 is array (0 .. 1) of aliased float;
   type gsl_complex_float is record
      dat : aliased anon_array1656;  -- /usr/include/gsl/gsl_complex.h:138
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/gsl/gsl_complex.h:138

end gsl_gsl_complex_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
