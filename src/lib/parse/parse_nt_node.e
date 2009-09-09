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
class PARSE_NT_NODE
	--
	-- An internal class used by PARSE_NON_TERMINAL that implements the LL(n) parsing algorithm.
	--

insert
	ANY
		redefine
			copy, is_equal
		end

creation {PARSE_NON_TERMINAL}
	root

creation {PARSE_NT_NODE}
	make

feature {PARSE_NON_TERMINAL}
	add (rule: TRAVERSABLE[STRING]; a_action: PROCEDURE[TUPLE[STRING, TRAVERSABLE[STRING]]]) is
		local
			node: PARSE_NT_NODE; name: STRING
		do
			check
				is_root: prefix_name = Void
			end
			if rule.is_empty then
				-- a non-terminal with Epsilon
				if a_action /= Void then
					action := agent call_non_terminal_builder(a_action, rule)
				end
				end_of_rule := True
			else
				name := rule.first
				node := suffices.reference_at(name)
				if node = Void then
					create node.make(name, nt)
					suffices.add(node, name)
				end
				node.do_add(a_action, rule, rule.lower)
			end
		end

	parse (buffer: MINI_PARSER_BUFFER; actions: COLLECTION[PARSE_ACTION]): STRING is
		local
			parse_action: PARSE_ACTION
		do
			check
				is_root: prefix_name = Void
			end
			Result := parse_suffices(buffer, actions)
			if Result /= Void and then end_of_rule then
				-- Epsilon
				Result := Void
				create parse_action.make(action)
				debug ("parse")
					parse_action.set_name(once "Reduce %"" + nt.name + once "%"")
				end
				actions.add_last(parse_action)
			end
		ensure
			actions.count >= old actions.count
			Result /= Void implies buffer.current_index = old buffer.current_index and then actions.count = old actions.count
		end

feature {PARSE_NON_TERMINAL, PARSE_NT_NODE}
	error_message: STRING

	is_coherent: BOOLEAN is
		local
			i: INTEGER
		do
			if prefix_name = Void then
				Result := True
			else
				Result := nt.table.has(prefix_name)
			end
			if suffices /= Void then
				from
					i := suffices.lower
				until
					not Result or else i > suffices.upper
				loop
					Result := suffices.item(i).is_coherent
					i := i + 1
				end
			end
		ensure
			must_be_coherent: Result
		end

	set_default_tree_builder (non_terminal_builder: PROCEDURE[TUPLE[STRING, TRAVERSABLE[STRING]]]
		path: COLLECTION[STRING]) is
		require
			non_terminal_builder /= Void
		local
			i: INTEGER
		do
			if end_of_rule and then action = Void then
				debug ("parse")
					std_error.put_string(once "Setting default non-terminal tree builder for %"")
					std_error.put_string(nt.name)
					std_error.put_string(once "%": ")
					if prefix_name = Void then
						-- root
						check
							path.is_empty
						end
						std_error.put_line(once "Epsilon")
					else
						from
							i := path.lower
						until
							i > path.upper
						loop
							std_error.put_character('"')
							std_error.put_string(path.item(i))
							std_error.put_character('"')
							std_error.put_character(' ')
							i := i + 1
						end
						std_error.put_character('"')
						std_error.put_string(prefix_name)
						std_error.put_character('"')
						std_error.put_character('>')
						std_error.put_new_line
					end
				end
				if prefix_name /= Void then
					path.add_last(prefix_name)
					action := agent call_non_terminal_builder(non_terminal_builder, path.twin)
					path.remove_last
				else
					-- Epsilon rule
					check
						path.is_empty
					end
					action := agent call_non_terminal_builder(non_terminal_builder, path.twin)
				end
			end
			if suffices /= Void then
				if prefix_name = Void then
					-- root
					check
						path.is_empty
					end
					from
						i := suffices.lower
					until
						i > suffices.upper
					loop
						suffices.item(i).set_default_tree_builder(non_terminal_builder, path)
						i := i + 1
					end
				else
					path.add_last(Void)
					from
						i := suffices.lower
					until
						i > suffices.upper
					loop
						path.put(prefix_name, path.upper)
						suffices.item(i).set_default_tree_builder(non_terminal_builder, path)
						i := i + 1
					end
					path.remove_last
				end
			end
		end

	set_non_terminal (a_non_terminal: like nt) is
		local
			i: INTEGER
		do
			nt := a_non_terminal
			if suffices /= Void then
				from
					i := suffices.lower
				until
					i > suffices.upper
				loop
					suffices.item(i).set_non_terminal(a_non_terminal)
					i := i + 1
				end
			end
		ensure
			nt = a_non_terminal
		end

feature {PARSE_NT_NODE}
	do_add (a_action: PROCEDURE[TUPLE[STRING, TRAVERSABLE[STRING]]]; rule: TRAVERSABLE[STRING]; i: INTEGER) is
		require
			rule.valid_index(i)
			rule.item(i).is_equal(prefix_name)
		local
			name: STRING; node: PARSE_NT_NODE
		do
			if i < rule.upper then
				name := rule.item(i + 1)
				if suffices = Void then
					create suffices.make
				end
				node := suffices.reference_at(name)
				if node = Void then
					create node.make(name, nt)
					suffices.add(node, name)
				end
				node.do_add(a_action, rule, i + 1)
			else
				check
					i = rule.upper
				end
				if a_action /= Void then
					action := agent call_non_terminal_builder(a_action, rule)
				end
				end_of_rule := True
			end
		end

	do_parse (buffer: MINI_PARSER_BUFFER; actions: COLLECTION[PARSE_ACTION]): STRING is
		require
			not_root: prefix_name /= Void
		local
			old_index, old_count: INTEGER; atom: PARSE_ATOM
			parse_action: PARSE_ACTION
		do
			old_index := buffer.current_index
			old_count := actions.count
			atom := nt.table.item(prefix_name)
			check
				atom /= Void
			end
			Result := atom.parse(buffer, actions)
			check
				suffices = Void implies end_of_rule
			end
			if suffices = Void then
				create parse_action.make(action)
				debug ("parse")
					parse_action.set_name(once "Reduce %"" + nt.name + once "%"")
				end
				actions.add_last(parse_action)
			elseif Result = Void then
				Result := parse_suffices(buffer, actions)
				if end_of_rule then
					if Result /= Void then
						-- that's fine: we can end here
						Result := Void
						create parse_action.make(action)
						debug ("parse")
							parse_action.set_name(once "Reduce %"" + nt.name + once "%"")
						end
						actions.add_last(parse_action)
					end
				end
			end
			if Result /= Void then
				buffer.set_current_index(old_index)
				if actions.count > old_count then
					actions.remove_tail(actions.count - old_count)
				end
			end
		ensure
			Result /= Void implies buffer.current_index = old buffer.current_index and then actions.count = old actions.count
		end

feature {}
	parse_suffices (buffer: MINI_PARSER_BUFFER; actions: COLLECTION[PARSE_ACTION]): STRING is
		require
			suffices /= Void
		local
			old_index, old_count, i: INTEGER; node: PARSE_NT_NODE; msg, m: STRING
		do
			debug ("parse")
				std_error.put_string(once "Scanning non-terminal %"")
				std_error.put_string(nt.name)
				std_error.put_character('"')
				if prefix_name /= Void then
					std_error.put_string(once " for a suffix of %"")
					std_error.put_string(prefix_name)
					std_error.put_character('"')
				end
				std_error.put_new_line
			end
			old_index := buffer.current_index
			old_count := actions.count
			from
				i := suffices.lower
				Result := once ""
				Result.clear_count
			until
				Result = Void or else i > suffices.upper
			loop
				node := suffices.item(i)
				msg := node.do_parse(buffer, actions)
				if msg = Void then
					Result := Void
				else
					buffer.set_current_index(old_index)
					if actions.count > old_count then
						actions.remove_tail(actions.count - old_count)
					end
					if prefix_name = Void then
						m := msg
					else
						m := prepend(prefix_name, msg)
					end
					if not Result.is_empty then
						Result.extend('%N')
					end
					Result.append(m)
					debug ("parse")
						std_error.put_string(once "Still scanning non-terminal %"")
						std_error.put_string(nt.name)
						std_error.put_character('"')
						if prefix_name /= Void then
							std_error.put_string(once " for a suffix of %"")
							std_error.put_string(prefix_name)
							std_error.put_character('"')
						end
						std_error.put_string(once " (%"")
						std_error.put_string(suffices.key(i))
						std_error.put_line(once "%" did not match)")
					end
					i := i + 1
				end
			end
			if Result /= Void then
				Result := Result.twin
			end
		ensure
			Result /= Void implies buffer.current_index = old buffer.current_index and then actions.count = old actions.count
		end

	prepend (p, msg: STRING): STRING is
		local
			i: INTEGER; c: CHARACTER
		do
			Result := once ""
			Result.copy(p)
			Result.extend(' ')
			from
				i := msg.lower
			until
				i > msg.upper
			loop
				c := msg.item(i)
				if c = '%N' then
					Result.extend(c)
					Result.append(p)
					Result.extend(' ')
				else
					Result.extend(c)
				end
				i := i + 1
			end
		end

feature {}
	call_non_terminal_builder (non_terminal_builder: PROCEDURE[TUPLE[STRING, TRAVERSABLE[STRING]]]
		path: TRAVERSABLE[STRING]) is
		do
			non_terminal_builder.call([nt.name, path])
		end

feature {}
	make (a_prefix_name: like prefix_name; a_nt: like nt) is
		require
			a_prefix_name /= Void
			a_nt /= Void
		do
			prefix_name := a_prefix_name
			nt := a_nt
		ensure
			prefix_name = a_prefix_name
			nt = a_nt
		end

	root (a_nt: like nt) is
		require
			a_nt /= Void
		do
			nt := a_nt
			create suffices.make
		ensure
			nt = a_nt
			suffices /= Void
			is_root: prefix_name = Void
		end

feature {ANY}
	copy (other: like Current) is
		local
			i: INTEGER
		do
			nt := other.nt
			prefix_name := other.prefix_name
			action := other.action
			end_of_rule := other.end_of_rule
			if other.suffices /= Void then
				create suffices.with_capacity(other.suffices.capacity)
				from
					i := other.suffices.lower
				until
					i > other.suffices.upper
				loop
					suffices.add(other.suffices.item(i).twin, other.suffices.key(i))
					i := i + 1
				end
			end
		end

	is_equal (other: like Current): BOOLEAN is
		local
			i: INTEGER
		do
			Result := (prefix_name = other.prefix_name or else (prefix_name /= Void and then prefix_name.is_equal(other.prefix_name)))
				and then action = other.action and then end_of_rule = other.end_of_rule
			if Result and then other.suffices /= Void then
				Result := suffices /= Void and then suffices.count = other.suffices.count
				from
					i := suffices.lower
				until
					not Result or else i > suffices.upper
				loop
					Result := suffices.reference_at(other.suffices.key(i)).is_equal(other.suffices.item(i))
					i := i + 1
				end
			end
		end

feature {PARSE_NT_NODE}
	prefix_name: STRING

	suffices: HASHED_DICTIONARY[PARSE_NT_NODE, STRING]

	nt: PARSE_NON_TERMINAL

	action: PROCEDURE[TUPLE]

	end_of_rule: BOOLEAN

invariant
	backlinked: nt /= Void

end -- class PARSE_NT_NODE
