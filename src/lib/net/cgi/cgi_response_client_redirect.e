-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class CGI_RESPONSE_CLIENT_REDIRECT
   --
   -- CGI response implementation: client redirect
   --

inherit
   CGI_RESPONSE

insert
   CGI_RESPONSE_FIELDS

create {ANY}
   set_redirect

feature {CGI_HANDLER}
   path: FIXED_STRING

   set_redirect (a_path: ABSTRACT_STRING)
      require
         a_path /= Void
      do
         path := a_path.intern
         if a_query /= Void then
            query := a_query.intern
         end
      ensure
         path = a_path.intern
         a_query = Void implies query = Void
         a_query /= Void implies query = a_query.intern
      end

feature {CGI}
   flush
      do
         std_output.put_string(once "Location: ")
         std_output.put_string(path)
         if query /= Void then
            std_output.put_character('?')
            std_output.put_string(query)
         end
         std_output.put_new_line
         flush_fields
      end

end -- class CGI_RESPONSE_CLIENT_REDIRECT
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