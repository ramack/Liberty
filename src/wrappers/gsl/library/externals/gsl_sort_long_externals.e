-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_SORT_LONG_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_sort_long (a_data: POINTER; a_stride: like size_t; a_n: like size_t) is
 		-- gsl_sort_long
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sort_long"
		}"
		end

	gsl_sort_long_index (a_p: POINTER; a_data: POINTER; a_stride: like size_t; a_n: like size_t) is
 		-- gsl_sort_long_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sort_long_index"
		}"
		end

	gsl_sort_long_largest (a_dest: POINTER; a_k: like size_t; a_src: POINTER; a_stride: like size_t; a_n: like size_t): INTEGER is
 		-- gsl_sort_long_largest
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sort_long_largest"
		}"
		end

	gsl_sort_long_largest_index (a_p: POINTER; a_k: like size_t; a_src: POINTER; a_stride: like size_t; a_n: like size_t): INTEGER is
 		-- gsl_sort_long_largest_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sort_long_largest_index"
		}"
		end

	gsl_sort_long_smallest (a_dest: POINTER; a_k: like size_t; a_src: POINTER; a_stride: like size_t; a_n: like size_t): INTEGER is
 		-- gsl_sort_long_smallest
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sort_long_smallest"
		}"
		end

	gsl_sort_long_smallest_index (a_p: POINTER; a_k: like size_t; a_src: POINTER; a_stride: like size_t; a_n: like size_t): INTEGER is
 		-- gsl_sort_long_smallest_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sort_long_smallest_index"
		}"
		end


end -- class GSL_SORT_LONG_EXTERNALS
