-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class CGI_REMOTE_INFO
   --
   -- REMOTE_ADDR, REMOTE_HOST, REMOTE_IDENT, REMOTE_USER
   --

create {CGI}
   make

feature {CGI_HANDLER}
   --| addr: ???
   --| host: ???
   ident, user: FIXED_STRING

feature {CGI}
   error: STRING

feature {}
   make (a, h, i, u: STRING)
      do
         if i /= Void then
            ident := i.intern
         end
         if u /= Void then
            user := u.intern
         end
      end

   set_error (t: STRING)
      require
         t /= Void
      do
         error := "Invalid REMOTE_INFO: "
         error.append(t)
      end

end -- class CGI_REMOTE_INFO
--
-- Copyright (c) 2009-2014 by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software
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