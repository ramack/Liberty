-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCOLORBUTTONCLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkcolorbuttonclass_struct_set_color_set (a_structure: POINTER; a_value: POINTER) is
			-- Setter for color_set field of GTKCOLORBUTTONCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcolorbuttonclass_struct_set_color_set"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtkcolorbuttonclass_struct_get_color_set (a_structure: POINTER): POINTER is
			-- Query for color_set field of GTKCOLORBUTTONCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcolorbuttonclass_struct_get_color_set"
		}"
		end

	-- Unwrappable field _gtk_reserved1.
	-- Unwrappable field _gtk_reserved2.
	-- Unwrappable field _gtk_reserved3.
	-- Unwrappable field _gtk_reserved4.
feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkColorButtonClass"
		}"
		end

end -- class GTKCOLORBUTTONCLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
