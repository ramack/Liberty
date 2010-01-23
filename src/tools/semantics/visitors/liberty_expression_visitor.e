-- This file is part of Liberty Eiffel.
--
-- Liberty Eiffel is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, version 3 of the License.
--
-- Liberty Eiffel is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Liberty Eiffel.  If not, see <http://www.gnu.org/licenses/>.
--
deferred class LIBERTY_EXPRESSION_VISITOR

inherit
	LIBERTY_ADD_VISITOR
	LIBERTY_AGENT_VISITOR
	LIBERTY_AND_VISITOR
	LIBERTY_AND_THEN_VISITOR
	LIBERTY_ARRAY_MANIFEST_VISITOR
	LIBERTY_ASSIGNMENT_TEST_VISITOR
	LIBERTY_BOOLEAN_MANIFEST_VISITOR
	LIBERTY_CALL_EXPRESSION_VISITOR
	LIBERTY_CHARACTER_MANIFEST_VISITOR
	LIBERTY_CREATION_EXPRESSION_VISITOR
	LIBERTY_DIVIDE_VISITOR
	LIBERTY_ENTITY_EXPRESSION_VISITOR
	LIBERTY_ENTITY_REFERENCE_VISITOR
	LIBERTY_EQUALS_VISITOR
	LIBERTY_GREATER_OR_EQUAL_VISITOR
	LIBERTY_GREATER_THAN_VISITOR
	LIBERTY_IMPLIES_VISITOR
	LIBERTY_INFIX_OPERATOR_VISITOR
	LIBERTY_INT_DIVIDE_VISITOR
	LIBERTY_INTEGER_16_MANIFEST_VISITOR
	LIBERTY_INTEGER_32_MANIFEST_VISITOR
	LIBERTY_INTEGER_64_MANIFEST_VISITOR
	LIBERTY_INTEGER_8_MANIFEST_VISITOR
	LIBERTY_INTEGER_TYPED_MANIFEST_VISITOR
	LIBERTY_INT_REMAINDER_VISITOR
	LIBERTY_LESS_OR_EQUAL_VISITOR
	LIBERTY_LESS_THAN_VISITOR
	LIBERTY_NEGATIVE_VISITOR
	LIBERTY_NOT_VISITOR
	LIBERTY_NOT_EQUALS_VISITOR
	LIBERTY_OLD_VISITOR
	LIBERTY_OPEN_ARGUMENT_VISITOR
	LIBERTY_OR_VISITOR
	LIBERTY_OR_ELSE_VISITOR
	LIBERTY_POSITIVE_VISITOR
	LIBERTY_POWER_VISITOR
	LIBERTY_PRECURSOR_EXPRESSION_VISITOR
	LIBERTY_PREFIX_OPERATOR_VISITOR
	LIBERTY_REAL_MANIFEST_VISITOR
	LIBERTY_REAL_TYPED_MANIFEST_VISITOR
	LIBERTY_STRING_MANIFEST_VISITOR
	LIBERTY_STRING_TYPED_MANIFEST_VISITOR
	LIBERTY_SUBTRACT_VISITOR
	LIBERTY_TIMES_VISITOR
	LIBERTY_TUPLE_VISITOR
	LIBERTY_VOID_VISITOR
	LIBERTY_XOR_VISITOR

end -- class LIBERTY_EXPRESSION_VISITOR
