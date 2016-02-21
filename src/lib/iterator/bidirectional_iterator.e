-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class BIDIRECTIONAL_ITERATOR[E_]
   -- An iterator that allows to traverse a COLLETION forward and backward.

   -- Those COLLECTIONs can be iterated back and forth even if its items are
   -- not COMPARABLE. For example a two-way list of three-dimensional points
   -- may while the points are not naturally ordered.

inherit
   ITERATOR[E_]

feature {ANY}
   finish
         -- Positions the iterator to the last object in the
         -- aggregate to be traversed.
      deferred
      ensure
         is_valid
      end

   previous
         -- Positions the iterator to the previous object in the
         -- sequence.
      require
         is_valid
         not is_off
      deferred
      end

end -- class BIDIRECTIONAL_ITERATOR
--
-- Copyright (C) 2009-2016: by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
