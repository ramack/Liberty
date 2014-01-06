-- -----------------------------------------------------------------------------------------------------------
-- This file is part of the ESE library.
-- Copyright(C) 2006-2009: Cyril ADRIAN <cyril.adrian@gmail.com> and others (see AUTHORS)
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
-- associated documentation files (the "Software"), to deal in the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the
-- following conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
-- IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
-- USE OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://ese.sourceforge.net
-- -----------------------------------------------------------------------------------------------------------
deferred class EDC_CONSTRAINT
   --
   -- A column constraint
   --

inherit
   ESE_VISITABLE
      redefine is_equal
      end

insert
   HASHABLE

feature {ANY}
   is_equal (other: like Current): BOOLEAN is
      do
         Result := Current = other
      end

   hash_code: INTEGER is
      do
         Result := to_pointer.hash_code
      end

feature {EDC_COLUMN}
   valid_value (a_value: EDC_DATUM): BOOLEAN is
      deferred
      end

end -- class EDC_CONSTRAINT