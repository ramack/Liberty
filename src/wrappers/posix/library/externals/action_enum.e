-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class ACTION_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = find_low_level)  or else
				(a_value = enter_low_level) )
		end

feature -- Setters
	default_create,
	set_find is
		do
			value := find_low_level
		end

	set_enter is
		do
			value := enter_low_level
		end

feature -- Queries
	is_find: BOOLEAN is
		do
			Result := (value=find_low_level)
		end

	is_enter: BOOLEAN is
		do
			Result := (value=enter_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	find_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FIND"
 			}"
 		end

	enter_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ENTER"
 			}"
 		end


end -- class ACTION_ENUM
