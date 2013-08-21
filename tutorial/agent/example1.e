class EXAMPLE1
	--
	-- To start with agents, just read this first example.
	--

create {ANY}
	make

feature {ANY}
	make is
		local
			my_array: ARRAY[STRING]
		do
			my_array := {ARRAY[STRING] 1, <<"Benedicte", "Lucien", "Marie">>}
			my_array.do_all(agent print_item(?))
		end

feature {}
	print_item (item: STRING) is
		do
			number := number + 1
			std_output.put_character('#')
			std_output.put_integer(number)
			std_output.put_character(' ')
			std_output.put_string(item)
			std_output.put_character('%N')
		end

	number: INTEGER

end -- class EXAMPLE1
