indexing
	description: "."
	copyright: "[
					Copyright (C) 2007 $EWLC_developer, $original_copyright_holder
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

deferred class G_OPTION_ENTRY
	-- A GOptionEntry defines a single option. To have an effect, they
	-- must be added to a G_OPTION_GROUP with G_OPTION_CONTEXT's
	-- `add_main_entries' or G_OPTION_GROUP's `add_entries'.

inherit
	C_STRUCT redefine fill_tagged_out_memory end
	MIXED_MEMORY_HANDLING redefine fill_tagged_out_memory end

insert 
	GOPTION_ENTRY_STRUCT undefine fill_tagged_out_memory end
	-- G_OPTION_ARG_ENUM undefine fill_tagged_out_memory end

feature {} -- Creation
	make (a_long_name: STRING; a_short_name: CHARACTER; a_description: STRING) is
		require
			long_name_not_void: a_long_name /= Void
			description_not_void: a_description /= Void
		do
			allocate
			goption_entry_struct_set_long_name (handle, a_long_name.to_external)
			goption_entry_struct_set_short_name (handle,a_short_name)
			goption_entry_struct_set_description (handle, a_description.to_external)
			
			-- GOptionArg arg; The type of the option, as a GOptionArg.	
			
			--gpointer arg_data; If the arg type is G_OPTION_ARG_CALLBACK, then
			--arg_data must point to a GOptionArgFunc callback function, which
			--will be called to handle the extra argument. Otherwise, arg_data
			--is a pointer to a location to store the value, the required type
			--of the location depends on the arg type:
			
			-- G_OPTION_ARG_NONE           gboolean
			-- G_OPTION_ARG_STRING         gchar*
			-- G_OPTION_ARG_INT            gint
			-- G_OPTION_ARG_FILENAME       gchar*
			-- G_OPTION_ARG_STRING_ARRAY   gchar**
			-- G_OPTION_ARG_FILENAME_ARRAY gchar**
			-- G_OPTION_ARG_DOUBLE         gdouble
		end

feature {ANY} -- Queries
	long_name: FIXED_STRING is
			-- The long name of an option can be used to specify it in a
			-- commandline as --long_name. Every option must have a long
			-- name. To resolve conflicts if multiple option groups
			-- contain the same long name, it is also possible to specify
			-- the option as "--groupname-long_name".
		do
			create Result.from_external
			(goption_entry_struct_get_long_name(handle))
		end

	short_name: CHARACTER is
			-- If an option has a short name, it can be specified
			-- -short_name in a commandline. short_name must be a
			-- printable ASCII character different from '-', or zero if
			-- the option has no short name.
		do
			Result:=goption_entry_struct_get_short_name(handle)
		end

	flags: GOPTION_FLAGS_ENUM is
		-- Flags from GOptionFlags.
	do
		Result.change_value(goption_entry_struct_get_flags(handle))
	end

	
	argument_type: GOPTION_ARG_ENUM is
		--The type of the option, as a GOptionArg.
	do
		Result.change_value(goption_entry_struct_get_arg(handle))
	end

	-- TODO: gpointer arg_data; If the arg type is G_OPTION_ARG_CALLBACK, then
	--arg_data must point to a GOptionArgFunc callback function, which
	--will be called to handle the extra argument. Otherwise, arg_data
	--is a pointer to a location to store the value, the required type
	--of the location depends on the arg type:
	
	-- G_OPTION_ARG_NONE           gboolean
	-- G_OPTION_ARG_STRING         gchar*
	-- G_OPTION_ARG_INT            gint
	-- G_OPTION_ARG_FILENAME       gchar*
	-- G_OPTION_ARG_STRING_ARRAY   gchar**
	-- G_OPTION_ARG_FILENAME_ARRAY gchar**
	-- G_OPTION_ARG_DOUBLE         gdouble
	
	description: FIXED_STRING is
		-- the description for the option in "--help" output.  The description
		-- is translated using the translate_func of the group, see
		-- G_OPTION_GROUP.set_translation_domain.
	do
		create Result.from_external(goption_entry_struct_get_description(handle))
	end

	-- gchar *arg_description; The placeholder to use for the extra
	-- argument parsed by the option in --help output. The
	-- arg_description is translated using the translate_func of the
	-- group, see g_option_group_set_translation_domain().

	fill_tagged_out_memory is
		do
			tagged_out_memory.append(long_name)
			tagged_out_memory.append(once " '")
			tagged_out_memory.extend(short_name)
			tagged_out_memory.append(once "' %"")
			tagged_out_memory.append(description)
			tagged_out_memory.append(once "%" ")
		end

end -- class G_OPTION_ENTRY
