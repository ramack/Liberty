-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class C_TYPE_FOR_VA_ARG

inherit
   C_TYPE_FOR_ARGUMENT
      redefine
         visit_boolean_type_mark,
         visit_character_type_mark,
         visit_integer_type_mark,
         visit_natural_type_mark,
         visit_real_type_mark
      end

create {C_PRETTY_PRINTER}
   make

feature {BOOLEAN_TYPE_MARK}
   visit_boolean_type_mark (visited: BOOLEAN_TYPE_MARK) is
      do
         buffer.append(once "int")
      end

feature {CHARACTER_TYPE_MARK}
   visit_character_type_mark (visited: CHARACTER_TYPE_MARK) is
      do
         buffer.append(once "int")
      end

feature {INTEGER_TYPE_MARK}
   visit_integer_type_mark (visited: INTEGER_TYPE_MARK) is
      do
         inspect
            visited.bit_count
         when 8, 16, 32 then
            buffer.append(once "int")
         when 64 then
            buffer.append(once "T11")
         end
      end

feature {NATURAL_TYPE_MARK}
   visit_natural_type_mark (visited: NATURAL_TYPE_MARK) is
      do
         if visited.bit_count <= 32 then
            buffer.append(once "uint32")
         else
            buffer.append(once "uint")
            visited.bit_count.append_in(buffer)
            buffer.append(once "_t")
         end
      end

feature {REAL_TYPE_MARK}
   visit_real_type_mark (visited: REAL_TYPE_MARK) is
      do
         inspect
            visited.bit_count
         when 32, 64 then
            buffer.append(once "double")
         else
            buffer.append(once "T12")
         end
      end

end -- class C_TYPE_FOR_VA_ARG
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------