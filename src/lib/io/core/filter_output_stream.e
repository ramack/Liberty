-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class FILTER_OUTPUT_STREAM
   --
   -- A filtered output stream.
   --

inherit
   OUTPUT_STREAM
insert
   FILTER
      redefine stream
      end

feature {ANY}
   can_put_character (c: CHARACTER): BOOLEAN
      do
         Result := is_connected and then stream.can_put_character(c)
      end

   disconnect
      do
         stream.filtered_flush
         stream.disconnect
         stream := Void
      end

feature {STREAM}
   do_detach
      do
         if filter /= Void then
            filter.do_detach
            filter := Void
         end
         stream.filtered_flush
         stream := Void
      end

feature {}
   stream: OUTPUT_STREAM

end -- class FILTER_OUTPUT_STREAM
--
-- Copyright (C) 2009-2016: by all the people cited in the AUTHORS file.
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
