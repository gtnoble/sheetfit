pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;


package gsl_gsl_errno_h is

   --  arg-macro: procedure GSL_ERROR (reason, gsl_errno)
   --    do { gsl_error (reason, __FILE__, __LINE__, gsl_errno) ; return gsl_errno ; } while (0)
   --  arg-macro: procedure GSL_ERROR_VAL (reason, gsl_errno, value)
   --    do { gsl_error (reason, __FILE__, __LINE__, gsl_errno) ; return value ; } while (0)
   --  arg-macro: procedure GSL_ERROR_VOID (reason, gsl_errno)
   --    do { gsl_error (reason, __FILE__, __LINE__, gsl_errno) ; return ; } while (0)
   --  arg-macro: procedure GSL_ERROR_NULL (reason, gsl_errno)
   --    GSL_ERROR_VAL(reason, gsl_errno, 0)
   --  arg-macro: function GSL_ERROR_SELECT_2 (a, b)
   --    return (a) /= GSL_SUCCESS ? (a) : ((b) /= GSL_SUCCESS ? (b) : GSL_SUCCESS);
   --  arg-macro: function GSL_ERROR_SELECT_3 (a, b, c)
   --    return (a) /= GSL_SUCCESS ? (a) : GSL_ERROR_SELECT_2(b,c);
   --  arg-macro: function GSL_ERROR_SELECT_4 (a, b, c, d)
   --    return (a) /= GSL_SUCCESS ? (a) : GSL_ERROR_SELECT_3(b,c,d);
   --  arg-macro: function GSL_ERROR_SELECT_5 (a, b, c, d, e)
   --    return (a) /= GSL_SUCCESS ? (a) : GSL_ERROR_SELECT_4(b,c,d,e);
   --  arg-macro: procedure GSL_STATUS_UPDATE (sp, s)
   --    do { if ((s) /= GSL_SUCCESS) *(sp) := (s);} while(0)
  -- err/gsl_errno.h
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

  -- iteration has not converged  
  -- input domain error, e.g sqrt(-1)  
  -- output range error, e.g. exp(1e100)  
  -- invalid pointer  
  -- invalid argument supplied by user  
  -- generic failure  
  -- factorization failed  
  -- sanity check failed - shouldn't happen  
  -- malloc failed  
  -- problem with user-supplied function  
  -- iterative process is out of control  
  -- exceeded max number of iterations  
  -- tried to divide by zero  
  -- user specified an invalid tolerance  
  -- failed to reach the specified tolerance  
  -- underflow  
  -- overflow   
  -- loss of accuracy  
  -- failed because of roundoff error  
  -- matrix, vector lengths are not conformant  
  -- matrix not square  
  -- apparent singularity detected  
  -- integral or series is divergent  
  -- requested feature is not supported by the hardware  
  -- requested feature not (yet) implemented  
  -- cache limit exceeded  
  -- table limit exceeded  
  -- iteration is not making progress towards solution  
  -- jacobian evaluations are not improving the solution  
  -- cannot reach the specified tolerance in F  
  -- cannot reach the specified tolerance in X  
  -- cannot reach the specified tolerance in gradient  
  -- end of file  
   procedure gsl_error
     (reason : Interfaces.C.Strings.chars_ptr;
      file : Interfaces.C.Strings.chars_ptr;
      line : int;
      gsl_errno : int)  -- /usr/include/gsl/gsl_errno.h:77
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_error";

   procedure gsl_stream_printf
     (label : Interfaces.C.Strings.chars_ptr;
      file : Interfaces.C.Strings.chars_ptr;
      line : int;
      reason : Interfaces.C.Strings.chars_ptr)  -- /usr/include/gsl/gsl_errno.h:80
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_stream_printf";

   function gsl_strerror (gsl_errno : int) return Interfaces.C.Strings.chars_ptr  -- /usr/include/gsl/gsl_errno.h:83
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_strerror";

   --  skipped function type gsl_error_handler_t

   --  skipped function type gsl_stream_handler_t

   function gsl_set_error_handler (new_handler : access procedure
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : int;
         arg4 : int)) return access procedure
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : int;
         arg4 : int)  -- /usr/include/gsl/gsl_errno.h:92
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_set_error_handler";

   function gsl_set_error_handler_off return access procedure
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : int;
         arg4 : int)  -- /usr/include/gsl/gsl_errno.h:95
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_set_error_handler_off";

   function gsl_set_stream_handler (new_handler : access procedure
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : int;
         arg4 : Interfaces.C.Strings.chars_ptr)) return access procedure
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : int;
         arg4 : Interfaces.C.Strings.chars_ptr)  -- /usr/include/gsl/gsl_errno.h:98
   with Import => True, 
        Convention => C, 
        External_Name => "gsl_set_stream_handler";

  -- GSL_ERROR: call the error handler, and return the error code  
  -- GSL_ERROR_VAL: call the error handler, and return the given value  
  -- GSL_ERROR_VOID: call the error handler, and then return
  --   (for void functions which still need to generate an error)  

  -- GSL_ERROR_NULL suitable for out-of-memory conditions  
  -- Sometimes you have several status results returned from
  -- * function calls and you want to combine them in some sensible
  -- * way. You cannot produce a "total" status condition, but you can
  -- * pick one from a set of conditions based on an implied hierarchy.
  -- *
  -- * In other words:
  -- *    you have: status_a, status_b, ...
  -- *    you want: status = (status_a if it is bad, or status_b if it is bad,...)
  -- *
  -- * In this example you consider status_a to be more important and
  -- * it is checked first, followed by the others in the order specified.
  -- *
  -- * Here are some dumb macros to do this.
  --  

end gsl_gsl_errno_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
