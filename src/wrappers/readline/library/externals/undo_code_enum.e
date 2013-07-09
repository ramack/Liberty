-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class UNDO_CODE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = undo_begin_low_level)  or else
				(a_value = undo_delete_low_level)  or else
				(a_value = undo_end_low_level)  or else
				(a_value = undo_insert_low_level) )
		end

feature -- Setters
	default_create,
	set_undo_begin is
		do
			value := undo_begin_low_level
		end

	set_undo_delete is
		do
			value := undo_delete_low_level
		end

	set_undo_end is
		do
			value := undo_end_low_level
		end

	set_undo_insert is
		do
			value := undo_insert_low_level
		end

feature -- Queries
	is_undo_begin: BOOLEAN is
		do
			Result := (value=undo_begin_low_level)
		end

	is_undo_delete: BOOLEAN is
		do
			Result := (value=undo_delete_low_level)
		end

	is_undo_end: BOOLEAN is
		do
			Result := (value=undo_end_low_level)
		end

	is_undo_insert: BOOLEAN is
		do
			Result := (value=undo_insert_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	undo_begin_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "UNDO_BEGIN"
 			}"
 		end

	undo_delete_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "UNDO_DELETE"
 			}"
 		end

	undo_end_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "UNDO_END"
 			}"
 		end

	undo_insert_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "UNDO_INSERT"
 			}"
 		end


end -- class UNDO_CODE_ENUM