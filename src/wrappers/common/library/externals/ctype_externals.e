-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class CTYPE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	-- `hidden' function __ctype_b_loc skipped.
	-- `hidden' function __ctype_tolower_loc skipped.
	-- `hidden' function __ctype_toupper_loc skipped.
	isalnum (a_c: INTEGER): INTEGER is
 		-- isalnum
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isalnum"
		}"
		end

	isalnum_l (an_argument_l3380_c7: INTEGER; an_argument_l3381_c7: POINTER): INTEGER is
 		-- isalnum_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isalnum_l"
		}"
		end

	isalpha (a_c: INTEGER): INTEGER is
 		-- isalpha
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isalpha"
		}"
		end

	isalpha_l (an_argument_l3069_c7: INTEGER; an_argument_l3070_c7: POINTER): INTEGER is
 		-- isalpha_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isalpha_l"
		}"
		end

	isascii (a_c: INTEGER): INTEGER is
 		-- isascii
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isascii"
		}"
		end

	isblank (a_c: INTEGER): INTEGER is
 		-- isblank
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isblank"
		}"
		end

	isblank_l (an_argument_l1038_c7: INTEGER; an_argument_l1039_c7: POINTER): INTEGER is
 		-- isblank_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isblank_l"
		}"
		end

	iscntrl (a_c: INTEGER): INTEGER is
 		-- iscntrl
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "iscntrl"
		}"
		end

	iscntrl_l (an_argument_l1007_c7: INTEGER; an_argument_l1008_c7: POINTER): INTEGER is
 		-- iscntrl_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "iscntrl_l"
		}"
		end

	isctype (a_c: INTEGER; a_mask: INTEGER): INTEGER is
 		-- isctype
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isctype"
		}"
		end

	isdigit (a_c: INTEGER): INTEGER is
 		-- isdigit
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isdigit"
		}"
		end

	isdigit_l (an_argument_l723_c7: INTEGER; an_argument_l724_c7: POINTER): INTEGER is
 		-- isdigit_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isdigit_l"
		}"
		end

	isgraph (a_c: INTEGER): INTEGER is
 		-- isgraph
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isgraph"
		}"
		end

	isgraph_l (an_argument_l702_c7: INTEGER; an_argument_l703_c7: POINTER): INTEGER is
 		-- isgraph_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isgraph_l"
		}"
		end

	islower (a_c: INTEGER): INTEGER is
 		-- islower
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "islower"
		}"
		end

	islower_l (an_argument_l2095_c7: INTEGER; an_argument_l2096_c7: POINTER): INTEGER is
 		-- islower_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "islower_l"
		}"
		end

	isprint (a_c: INTEGER): INTEGER is
 		-- isprint
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isprint"
		}"
		end

	isprint_l (an_argument_l2272_c7: INTEGER; an_argument_l2273_c7: POINTER): INTEGER is
 		-- isprint_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isprint_l"
		}"
		end

	ispunct (a_c: INTEGER): INTEGER is
 		-- ispunct
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ispunct"
		}"
		end

	ispunct_l (an_argument_l2246_c7: INTEGER; an_argument_l2247_c7: POINTER): INTEGER is
 		-- ispunct_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ispunct_l"
		}"
		end

	isspace (a_c: INTEGER): INTEGER is
 		-- isspace
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isspace"
		}"
		end

	isspace_l (an_argument_l1509_c7: INTEGER; an_argument_l1510_c7: POINTER): INTEGER is
 		-- isspace_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isspace_l"
		}"
		end

	isupper (a_c: INTEGER): INTEGER is
 		-- isupper
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isupper"
		}"
		end

	isupper_l (an_argument_l2189_c7: INTEGER; an_argument_l2190_c7: POINTER): INTEGER is
 		-- isupper_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isupper_l"
		}"
		end

	isxdigit (a_c: INTEGER): INTEGER is
 		-- isxdigit
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isxdigit"
		}"
		end

	isxdigit_l (an_argument_l1437_c7: INTEGER; an_argument_l1438_c7: POINTER): INTEGER is
 		-- isxdigit_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isxdigit_l"
		}"
		end

	toascii (a_c: INTEGER): INTEGER is
 		-- toascii
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "toascii"
		}"
		end

	tolower (a_c: INTEGER): INTEGER is
 		-- tolower
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tolower"
		}"
		end

	-- `hidden' function _tolower skipped.
	tolower_l (a_c: INTEGER; a_l: POINTER): INTEGER is
 		-- tolower_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tolower_l"
		}"
		end

	-- `hidden' function __tolower_l skipped.
	toupper (a_c: INTEGER): INTEGER is
 		-- toupper
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "toupper"
		}"
		end

	-- `hidden' function _toupper skipped.
	toupper_l (a_c: INTEGER; a_l: POINTER): INTEGER is
 		-- toupper_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "toupper_l"
		}"
		end

	-- `hidden' function __toupper_l skipped.

end -- class CTYPE_EXTERNALS
