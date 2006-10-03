indexing
	description: "Configuration Access/Management of libgda configuration."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GDA team
					
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

class GDA_CONFIG

inherit WRAPPER_HANDLER

insert GDA_CONFIG_EXTERNALS

creation default_create

feature -- Configuration
	
	get_string (a_path: STRING): STRING is
			-- the value of the configuration entry `a_path'.
		require
			path_not_void: a_path /= Void
		do
			create Result.from_external(gda_config_get_string(a_path.to_external))
		end

	get_int (a_path: STRING): INTEGER is
			-- the  value of the configuration entry `a_path' as an integer.
		require
			path_not_void: a_path /= Void
		do
			Result := gda_config_get_int(a_path.to_external)
		end

	get_real (a_path: STRING): REAL is
			-- the value of the configuration entry `a_path' as a float.
		require
			path_not_void: a_path /= Void
		do
			Result := gda_config_get_float (a_path.to_external)
		end

	get_boolean (a_path: STRING): BOOLEAN is
			-- the value of the configuration entry `a_path' as a boolean.
		require
			path_not_void: a_path /= Void
		do
			Result := (gda_config_get_boolean(a_path.to_external)).to_boolean
		end

	is_successful: BOOLEAN
	
	set_string (a_path, a_new_value: STRING) is
			-- Sets the configuration entry `a_path' to contain
			-- `a_new_value'. `is_successful' will be True if no errors
			-- occurred
		require
			path_not_void: a_path /= Void
			value_not_void: a_new_value /= Void
		do
			is_successful := (gda_config_set_string (a_path.to_external,
																  a_new_value.to_external)).to_boolean
		ensure set: get_string(a_path).is_equal(a_new_value)
		end

	set_int (a_path: STRING; a_new_value: INTEGER ) is
			-- Sets the configuration entry `a_path' to contain `a_new_value'.
			-- `is_successful' will be True if no errors occurred
		require
			path_not_void: a_path /= Void
		do
			is_successful := (gda_config_set_int (a_path.to_external, a_new_value)).to_boolean
			ensure set: get_int (a_path) = a_new_value
		end

	set_real (a_path: STRING; a_new_value: REAL) is
			-- Sets the configuration entry `a_path' to contain
			-- `a_new_value'. `is_successful' will be True if no errors
			-- occurred
		require
			path_not_void: a_path /= Void
		do
			is_successful:=(gda_config_set_float(a_path.to_external, a_new_value)).to_boolean
		ensure set: get_real (a_path) = a_new_value
		end

	set_boolean (a_path: STRING; a_new_value: BOOLEAN) is
			-- Sets the given configuration entry to contain a boolean.
			-- `is_successful' will be True if no errors occurred
		require
			path_not_void: a_path /= Void
		do
			is_successful:=(gda_config_set_boolean(a_path.to_external, a_new_value)).to_boolean
		ensure set: get_boolean (a_path) = a_new_value
		end

	remove_section (a_path: STRING) is
			-- Removes the given section from the configuration database.
		require
			path_not_void: a_path /= Void
		do
			gda_config_remove_section (a_path.to_external)
		end

	remove_key (a_path: STRING) is
			-- Removes the given entry from the configuration
			-- database. If the section is empty, also remove the
			-- section.
		require
			path_not_void: a_path /= Void
		do
			gda_config_remove_key (a_path.to_external)
		end
	
	has_section (a_path: STRING): BOOLEAN is
			-- Does the section `a_path' exists in the configuration
			-- system?
		require
			path_not_void: a_path /= Void
		do
			Result:=gda_config_has_section(a_path.to_external).to_boolean
		end

	has_key (a_path: STRING): BOOLEAN is
			-- Does the key `a_path' exists in the configuration system?
		require
			path_not_void: a_path /= Void
		do
			Result:=gda_config_has_key(a_path.to_external).to_boolean
		end

	-- sections: TODO (this is messy because the disposing is 
	-- "redefined" here) GList* gda_config_list_sections (const gchar
	-- *path);
	
	-- Returns a GList containing the names of all the sections
	-- available under the given root directory.

	-- To free the returned value, you can use gda_config_free_list.

	-- path : 	path for root dir.
	-- Returns : 	a list containing all the section names.
	-- gda_config_list_keys ()

	-- GList*      gda_config_list_keys            (const gchar *path);

	-- Returns a list of all keys that exist under the given path.

	-- To free the returned value, you can use gda_config_free_list.

	-- path : 	path for root dir.
	-- Returns : 	a list containing all the key names.
	-- gda_config_free_list ()

	-- void        gda_config_free_list            (GList *list);

	-- Frees all memory used by the given GList, which must be the return value from either gda_config_list_sections and gda_config_list_keys.

	-- list : 	list to be freed.
	-- gda_config_get_provider_list ()

	-- GList*      gda_config_get_provider_list    (void);

	-- Returns a list of all providers currently installed in the system. Each of the nodes in the returned GList is a GdaProviderInfo.

	-- Returns : 	a GList of GdaProviderInfo structures, don't free or modify it!
	-- gda_config_free_provider_list ()

	-- void        gda_config_free_provider_list   (GList *list);

	-- Frees a list of GdaProviderInfo structures.

	-- list : 	the list to be freed.
	-- gda_config_get_provider_by_name ()

	-- GdaProviderInfo* gda_config_get_provider_by_name
	--                                             (const gchar *name);

	-- Gets a GdaProviderInfo structure from the provider list given its name, don't modify or free it.

	-- name : 	name of the provider to search for.
	-- Returns : 	a GdaProviderInfo structure, if found, or NULL if not found.
	-- gda_config_get_provider_model ()

	-- GdaDataModel* gda_config_get_provider_model (void);

	-- Fills and returns a new GdaDataModel object using information from all providers which are currently installed in the system.

	-- Rows are separated in 3 columns: 'Id', 'Location' and 'Description'.

	-- Returns : 	a new GdaDataModel object.
	-- gda_provider_info_copy ()

	-- GdaProviderInfo* gda_provider_info_copy     (GdaProviderInfo *src);

	-- Creates a new GdaProviderInfo structure from an existing one.

	-- src : 	provider information to get a copy from.
	-- Returns : 	a newly allocated GdaProviderInfo with contains a copy of information in src.
	-- gda_provider_info_free ()

	-- void        gda_provider_info_free          (GdaProviderInfo *provider_info);

	-- Deallocates all memory associated to the given GdaProviderInfo.

	-- provider_info : 	provider information to free.
	-- gda_config_get_data_source_list ()

	-- GList*      gda_config_get_data_source_list (void);

	-- Returns a list of all data sources currently configured in the system. Each of the nodes in the returned GList is a GdaDataSourceInfo. To free the returned list, call the gda_config_free_data_source_list function.

	-- Returns : 	a GList of GdaDataSourceInfo structures.
	-- gda_config_find_data_source ()

	-- GdaDataSourceInfo* gda_config_find_data_source
	--                                             (const gchar *name);

	-- Gets a GdaDataSourceInfo structure from the data source list given its name. After usage, the returned structure's memory must be freed using gda_data_source_info_free().

	-- name : 	name of the data source to search for.
	-- Returns : 	a new GdaDataSourceInfo structure, if found, or NULL if not found.
	-- gda_data_source_info_copy ()

	-- GdaDataSourceInfo* gda_data_source_info_copy
	--                                             (GdaDataSourceInfo *src);

	-- Creates a new GdaDataSourceInfo structure from an existing one.

	-- src : 	data source information to get a copy from.
	-- Returns : 	a newly allocated GdaDataSourceInfo with contains a copy of information in src.
	-- gda_data_source_info_equal ()

	-- gboolean    gda_data_source_info_equal      (GdaDataSourceInfo *info1,
	--                                              GdaDataSourceInfo *info2);

	-- Tells if info1 and info2 are equal

	-- info1 : 	a data source information
	-- info2 : 	a data source information
	-- Returns : 	TRUE if info1 and info2 are equal
	-- gda_data_source_info_free ()

	-- void        gda_data_source_info_free       (GdaDataSourceInfo *info);

	-- Deallocates all memory associated to the given GdaDataSourceInfo.

	-- info : 	data source information to free.
	-- gda_config_free_data_source_list ()

	-- void        gda_config_free_data_source_list
	--                                             (GList *list);

	-- Frees a list of GdaDataSourceInfo structures.

	-- list : 	the list to be freed.
	-- gda_config_get_data_source_model ()

	-- GdaDataModel* gda_config_get_data_source_model
	--                                             (void);

	-- Fills and returns a new GdaDataModel object using information from all data sources which are currently configured in the system.

	-- Rows are separated in 7 columns: 'Name', 'Provider', 'Connection string', 'Description', 'Username', 'Password' and 'Global'.

	-- Returns : 	a new GdaDataModel object.
	-- gda_config_can_modify_global_config ()

	-- gboolean    gda_config_can_modify_global_config
	--                                             (void);

	-- Tells if the calling program can modify the global configured data sources.

	-- Returns : 	TRUE if modifications are possible

	save_data_source (a_name, a_provider, a_connection_string, a_description, a_username, a_password: STRING) is
			-- Adds a new data source (or update an existing one) to the
			-- GDA configuration, based on the parameters given.

			-- `a_name' is the name for the data source to be saved.
		
			-- `a_provider': the provider ID for the new data source.
		
			-- `a_connection_string': the connection string for the new
			--data source.
		
			-- `a_description' : description for the new data source.
		
			-- `a_username' : user name for the new data source.
		
			-- `a_password' : 	password to use when authenticating 
			-- username.
		
			-- `is_global' : 	TRUE if the data source is system-wide
		
			-- `a_username' and `a_password' can be Void if you do not
			-- need them to enter the database

			-- `is_successful' will be update (True in case of no
			-- errors).
		local username_ptr, password_ptr: POINTER
		do
			if a_username/=Void then username_ptr:=a_username.to_external end
			if a_password/=Void then password_ptr:=a_password.to_external end
			
			is_successful := (gda_config_save_data_source
									(a_name.to_external, a_provider.to_external.
									 a_connection_string.to_external,
									 a_description.to_external,
									 username_ptr,
									 password_ptr,
									 is_global.to_integer)).to_boolean
		end
	
		-- gda_config_save_data_source_info ()

		-- gboolean    gda_config_save_data_source_info
		--                                             (GdaDataSourceInfo *dsn_info);

		-- Saves a data source in the libgda configuration given a GdaDataSourceInfo structure containing all the information about the data source.

		-- dsn_info : 	a GdaDataSourceInfo structure.
		-- Returns : 	TRUE if no error occurred

	remove_data_source (a_data_source: STRING) is
			-- Removes `a_data_source' from the GDA configuration.
		require
			source_not_void: a_data_source /= Void
		do
			gda_config_remove_data_source (a_name.to_external)
		end


		-- name : 	name for the data source to be removed.
		-- gda_config_add_listener ()

		-- guint       gda_config_add_listener         (const gchar *path,
		--                                              GdaConfigListenerFunc func,
		--                                              gpointer user_data);

		-- Installs a configuration listener, which is a callback function which will be called every time a change occurs on a given configuration entry.

		-- path : 	configuration path to listen to.
		-- func : 	callback function.
		-- user_data : 	data to be passed to the callback function.
		-- Returns : 	the ID of the listener, which you will need for calling gda_config_remove_listener. If an error occurs, 0 is returned.
		-- gda_config_remove_listener ()

		-- void        gda_config_remove_listener      (guint id);

		-- Removes a configuration listener previously installed with gda_config_add_listener, given its ID.

		-- id : 	the ID of the listener to remove.


end -- class GDA_CONFIG

