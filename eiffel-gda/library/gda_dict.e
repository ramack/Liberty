indexing
	description: "GdaDict GDA dictionary."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GTK+ team
					
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

class GDA_DICT

inherit
	SHARED_C_STRUCT

-- insert GDA_DICT_EXTERNALS

creation make, from_external_pointer

feature {} -- Creation
	-- Prev 	Up 	Home 	GNOME Data Access manual 	Next
	-- Top  |  Description  |  Object Hierarchy  |  Properties  |  Signals
	-- GdaDict


	
	-- Synopsis



	--             GdaDict;
	-- GObject*    gda_dict_new                    (void);
	-- void        gda_dict_extend_with_functions  (GdaDict *dict);
	-- void        gda_dict_set_connection         (GdaDict *dict,
	--                                              GdaConnection *cnc);
	-- GdaConnection* gda_dict_get_connection      (GdaDict *dict);
	-- GdaDictDatabase* gda_dict_get_database      (GdaDict *dict);
	-- void        gda_dict_declare_object_string_id_change
	--                                             (GdaDict *dict,
	--                                              GdaObject *obj,
	--                                              const gchar *oldid);
	-- GdaObject*  gda_dict_get_object_by_string_id
	--                                             (GdaDict *dict,
	--                                              const gchar *strid);
	-- gboolean    gda_dict_update_dbms_data       (GdaDict *dict,
	--                                              GType limit_to_type,
	--                                              const gchar *limit_obj_name,
	--                                              GError **error);
	-- void        gda_dict_stop_update_dbms_data  (GdaDict *dict);
	-- gchar*      gda_dict_compute_xml_filename   (GdaDict *dict,
	--                                              const gchar *datasource,
	--                                              const gchar *app_id,
	--                                              GError **error);
	-- void        gda_dict_set_xml_filename       (GdaDict *dict,
	--                                              const gchar *xmlfile);
	-- const gchar* gda_dict_get_xml_filename      (GdaDict *dict);
	-- gboolean    gda_dict_load                   (GdaDict *dict,
	--                                              GError **error);
	-- gboolean    gda_dict_save                   (GdaDict *dict,
	--                                              GError **error);
	-- gboolean    gda_dict_load_xml_file          (GdaDict *dict,
	--                                              const gchar *xmlfile,
	--                                              GError **error);
	-- gboolean    gda_dict_save_xml_file          (GdaDict *dict,
	--                                              const gchar *xmlfile,
	--                                              GError **error);
	-- GdaDataHandler* gda_dict_get_handler        (GdaDict *dict,
	--                                              GType for_type);
	-- GdaDataHandler* gda_dict_get_default_handler
	--                                             (GdaDict *dict,
	--                                              GType for_type);
	-- #define     gda_dict_get_queries            (dict)
	-- #define     gda_dict_get_query_by_xml_id    (dict,xml_id)
	-- #define     gda_dict_get_dict_types         (dict)
	-- #define     gda_dict_get_dict_type_by_name  (dict,type_name)
	-- #define     gda_dict_get_dict_type_by_xml_id(dict,xml_id)
	-- #define     gda_dict_get_functions          (dict)
	-- #define     gda_dict_get_functions_by_name  (dict,funcname)
	-- #define     gda_dict_get_function_by_name_arg(dict,funcname,argtypes)
	-- #define     gda_dict_get_function_by_xml_id (dict,xml_id)
	-- #define     gda_dict_get_function_by_dbms_id(dict,dbms_id)
	-- #define     gda_dict_get_aggregates         (dict)
	-- #define     gda_dict_get_aggregates_by_name (dict,aggname)
	-- #define     gda_dict_get_aggregate_by_name_arg(dict,argname,argtype)
	-- #define     gda_dict_get_aggregate_by_xml_id(dict,xml_id)
	-- #define     gda_dict_get_aggregate_by_dbms_id(dict,dbmsid)
	-- void        gda_dict_declare_object         (GdaDict *dict,
	--                                              GdaObject *object);
	-- void        gda_dict_declare_object_as      (GdaDict *dict,
	--                                              GdaObject *object,
	--                                              GType as_type);
	-- void        gda_dict_assume_object          (GdaDict *dict,
	--                                              GdaObject *object);
	-- void        gda_dict_assume_object_as       (GdaDict *dict,
	--                                              GdaObject *object,
	--                                              GType as_type);
	-- void        gda_dict_unassume_object        (GdaDict *dict,
	--                                              GdaObject *object);
	-- GSList*     gda_dict_get_objects            (GdaDict *dict,
	--                                              GType type);
	-- GdaObject*  gda_dict_get_object_by_name     (GdaDict *dict,
	--                                              GType type,
	--                                              const gchar *name);
	-- GdaObject*  gda_dict_get_object_by_xml_id   (GdaDict *dict,
	--                                              GType type,
	--                                              const gchar *xml_id);


	-- Object Hierarchy

	--   GObject
	--    +----GdaDict

	-- Properties

	--   "dsn"                  gchararray            : Read / Write
	--   "username"             gchararray            : Read / Write

	-- Signals

	-- "changed"   void        user_function      (GdaDict *gdadict,
	--                                             gpointer user_data)      : Run first
	-- "data-update-finished"
	--             void        user_function      (GdaDict *gdadict,
	--                                             gpointer user_data)      : Run first
	-- "data-update-started"
	--             void        user_function      (GdaDict *gdadict,
	--                                             gpointer user_data)      : Run first
	-- "object-act-changed"
	--             void        user_function      (GdaDict *gdadict,
	--                                             gpointer arg1,
	--                                             gpointer user_data)      : Run first
	-- "object-added"
	--             void        user_function      (GdaDict *gdadict,
	--                                             gpointer arg1,
	--                                             gpointer user_data)      : Run first
	-- "object-removed"
	--             void        user_function      (GdaDict *gdadict,
	--                                             gpointer arg1,
	--                                             gpointer user_data)      : Run first
	-- "object-updated"
	--             void        user_function      (GdaDict *gdadict,
	--                                             gpointer arg1,
	--                                             gpointer user_data)      : Run first
	-- "update-progress"
	--             void        user_function      (GdaDict *gdadict,
	--                                             gpointer arg1,
	--                                             guint    arg2,
	--                                             guint    arg3,
	--                                             gpointer user_data)      : Run first

	-- Description

	-- This object is a "proxy repository" for all the objects:

	--     *

	--       existing within a database such as data types (see the GdaDictType object), functions (see the GdaDictFunction object), aggregates (see the GdaDictAggregate object), and the database structure (through the GdaDictDatabase and associated object)
	--     *

	--       pre-defined queries as GdaQuery objects
	--     *

	--       graphs as GdaGraph objects

	-- Each GdaDict object can be saved to an XML file and loaded back in an efficient way; any GdaDict object can be assigned a GdaConnection object which tells it how to use a real connection to a data source.

	-- The GdaDict object is responsible for the life management of all the objects it handles; see the GdaObject object for more information.
	-- Details
	-- GdaDict

	-- typedef struct _GdaDict GdaDict;

	-- gda_dict_new ()

	-- GObject*    gda_dict_new                    (void);

	-- Create a new GdaDict object.

	-- Returns : 	the newly created object.
	-- gda_dict_extend_with_functions ()

	-- void        gda_dict_extend_with_functions  (GdaDict *dict);

	-- Make dict handle functions and aggregates

	-- dict : 	a GdaDict object
	-- gda_dict_set_connection ()

	-- void        gda_dict_set_connection         (GdaDict *dict,
	--                                              GdaConnection *cnc);

	-- Sets the associated connection to dict. This connection is then used when the dictionary synchronises itself, and when manipulating data (the gda_dict_get_handler() method).

	-- dict : 	a GdaDict object
	-- cnc : 	a GdaConnection object
	-- gda_dict_get_connection ()

	-- GdaConnection* gda_dict_get_connection      (GdaDict *dict);

	-- Fetch a pointer to the GdaConnection used by the GdaDict object.

	-- dict : 	a GdaDict object
	-- Returns : 	a pointer to the GdaConnection, if one has been assigned to dict
	-- gda_dict_get_database ()

	-- GdaDictDatabase* gda_dict_get_database      (GdaDict *dict);

	-- Fetch a pointer to the GdaDictDatabase used by the GdaDict object.

	-- dict : 	a GdaDict object
	-- Returns : 	a pointer to the GdaDictDatabase
	-- gda_dict_declare_object_string_id_change ()

	-- void        gda_dict_declare_object_string_id_change
	--                                             (GdaDict *dict,
	--                                              GdaObject *obj,
	--                                              const gchar *oldid);

	-- Internal function, not to be used directly.

	-- dict : 	
	-- obj : 	
	-- oldid : 	
	-- gda_dict_get_object_by_string_id ()

	-- GdaObject*  gda_dict_get_object_by_string_id
	--                                             (GdaDict *dict,
	--                                              const gchar *strid);

	-- Fetch a pointer to the GdaObject which has the strid string ID.

	-- dict : 	a GdaDict object
	-- strid : 	a string
	-- Returns : 	the corresponding GdaObject, or NULL if none found
	-- gda_dict_update_dbms_data ()

	-- gboolean    gda_dict_update_dbms_data       (GdaDict *dict,
	--                                              GType limit_to_type,
	--                                              const gchar *limit_obj_name,
	--                                              GError **error);

	-- Updates the list of data types, functions, tables, etc from the database, which means that the dict object uses an opened connection to the DBMS. Use gda_dict_set_connection() to set a GdaConnection to dict.

	-- dict : 	a GdaDict object
	-- limit_to_type : 	limit the DBMS update to this type, or 0 for no limit
	-- limit_obj_name : 	limit the DBMS update to objects of this name, or NULL for no limit
	-- error : 	location to store error, or NULL
	-- Returns : 	TRUE if no error
	-- gda_dict_stop_update_dbms_data ()

	-- void        gda_dict_stop_update_dbms_data  (GdaDict *dict);

	-- When the dictionary updates its internal lists of DBMS objects, a call to this function will stop that update process. It has no effect when the dictionary is not updating its DBMS data.

	-- dict : 	a GdaDict object
	-- gda_dict_compute_xml_filename ()

	-- gchar*      gda_dict_compute_xml_filename   (GdaDict *dict,
	--                                              const gchar *datasource,
	--                                              const gchar *app_id,
	--                                              GError **error);

	-- Get the prefered filename which represents the data dictionary associated to the datasource data source. Using the returned value in conjunction with gda_dict_load_xml_file() and gda_dict_save_xml_file() has the advantage of letting the library handle file naming onventions.

	-- if datasource is NULL, and a GdaConnection object has been assigned to dict, then the returned string will take into account the data source used by that connection.

	-- The app_id argument allows to give an extra identification to the request, when some special features must be saved but not interfere with the default dictionary.

	-- dict : 	a GdaDict object
	-- datasource : 	a data source, or NULL
	-- app_id : 	an extra identification, or NULL
	-- error : 	location to store error, or NULL
	-- Returns : 	a new string
	-- gda_dict_set_xml_filename ()

	-- void        gda_dict_set_xml_filename       (GdaDict *dict,
	--                                              const gchar *xmlfile);

	-- Sets the filename dict will use when gda_dict_save_xml() and gda_dict_load_xml() are called.

	-- dict : 	a GdaDict object
	-- xmlfile : 	a file name
	-- gda_dict_get_xml_filename ()

	-- const gchar* gda_dict_get_xml_filename      (GdaDict *dict);

	-- Get the filename dict will use when gda_dict_save_xml() and gda_dict_load_xml() are called.

	-- dict : 	a GdaDict object
	-- Returns : 	the filename, or NULL if none have been set.
	-- gda_dict_load ()

	-- gboolean    gda_dict_load                   (GdaDict *dict,
	--                                              GError **error);

	-- Loads an XML file which respects the Libgda DTD, and creates all the necessary objects that are defined within the XML file. During the creation of the other objects, all the normal signals are emitted.

	-- If the GdaDict object already has some contents, then it is first of all destroyed (to return its state as when it was first created).

	-- If an error occurs during loading then the GdaDict object is left as empty as when it is first created.

	-- The file loaded is the one specified using gda_dict_set_xml_filename()

	-- dict : 	a GdaDict object
	-- error : 	location to store error, or NULL
	-- Returns : 	TRUE if loading was successfull and FALSE otherwise.
	-- gda_dict_save ()

	-- gboolean    gda_dict_save                   (GdaDict *dict,
	--                                              GError **error);

	-- Saves the contents of a GdaDict object to a file which is specified using the gda_dict_set_xml_filename() method.

	-- dict : 	a GdaDict object
	-- error : 	location to store error, or NULL
	-- Returns : 	TRUE if saving was successfull and FALSE otherwise.
	-- gda_dict_load_xml_file ()

	-- gboolean    gda_dict_load_xml_file          (GdaDict *dict,
	--                                              const gchar *xmlfile,
	--                                              GError **error);

	-- Loads an XML file which respects the Libgda DTD, and creates all the necessary objects that are defined within the XML file. During the creation of the other objects, all the normal signals are emitted.

	-- If the GdaDict object already has some contents, then it is first of all destroyed (to return its state as when it was first created).

	-- If an error occurs during loading then the GdaDict object is left as empty as when it is first created.

	-- dict : 	a GdaDict object
	-- xmlfile : 	the name of the file to which the XML will be written to
	-- error : 	location to store error, or NULL
	-- Returns : 	TRUE if loading was successfull and FALSE otherwise.
	-- gda_dict_save_xml_file ()

	-- gboolean    gda_dict_save_xml_file          (GdaDict *dict,
	--                                              const gchar *xmlfile,
	--                                              GError **error);

	-- Saves the contents of a GdaDict object to a file which is given as argument.

	-- dict : 	a GdaDict object
	-- xmlfile : 	the name of the file to which the XML will be written to
	-- error : 	location to store error, or NULL
	-- Returns : 	TRUE if saving was successfull and FALSE otherwise.
	-- gda_dict_get_handler ()

	-- GdaDataHandler* gda_dict_get_handler        (GdaDict *dict,
	--                                              GType for_type);

	-- Obtain a pointer to a GdaDataHandler which can convert GValue values of type for_type.

	-- Unlike the gda_dict_get_default_handler() method, this method asks the provider (for the connection assigned to dict using gda_dict_set_connection()) if there is any.

	-- It fallbacks to the same data handler as gda_dict_get_default_handler() if no connection has been assigned, or if the assigned'd provider offers no data handler for that type.

	-- The returned pointer is NULL if there is no data handler available for the for_type type.

	-- dict : 	a GdaDict object
	-- for_type : 	a GType type
	-- Returns : 	a GdaDataHandler
	-- gda_dict_get_default_handler ()

	-- GdaDataHandler* gda_dict_get_default_handler
	--                                             (GdaDict *dict,
	--                                              GType for_type);

	-- Obtain a pointer to a GdaDataHandler which can manage GValue values of type for_type

	-- The returned pointer is NULL if there is no default data handler available for the for_type data type

	-- dict : 	a GdaDict object
	-- for_type : 	a GType type
	-- Returns : 	a GdaDataHandler
	-- gda_dict_get_queries()

	-- #define gda_dict_get_queries(dict) gda_dict_get_objects((dict), GDA_TYPE_QUERY)

	-- dict : 	
	-- Returns : 	
	-- gda_dict_get_query_by_xml_id()

	-- #define gda_dict_get_query_by_xml_id(dict,xml_id) ((GdaQuery*)gda_dict_get_object_by_xml_id((dict), GDA_TYPE_QUERY, (xml_id)))

	-- dict : 	
	-- xml_id : 	
	-- Returns : 	
	-- gda_dict_get_dict_types()

	-- #define gda_dict_get_dict_types(dict) gda_dict_get_objects((dict), GDA_TYPE_DICT_TYPE)

	-- dict : 	
	-- Returns : 	
	-- gda_dict_get_dict_type_by_name()

	-- #define gda_dict_get_dict_type_by_name(dict,type_name) ((GdaDictType*)gda_dict_get_object_by_name((dict), GDA_TYPE_DICT_TYPE, (type_name)))

	-- dict : 	
	-- type_name : 	
	-- Returns : 	
	-- gda_dict_get_dict_type_by_xml_id()

	-- #define gda_dict_get_dict_type_by_xml_id(dict,xml_id) ((GdaDictType*)gda_dict_get_object_by_xml_id((dict), GDA_TYPE_DICT_TYPE, (xml_id)))

	-- dict : 	
	-- xml_id : 	
	-- Returns : 	
	-- gda_dict_get_functions()

	-- #define gda_dict_get_functions(dict) gda_dict_get_objects ((dict), GDA_TYPE_DICT_FUNCTION)

	-- dict : 	
	-- Returns : 	
	-- gda_dict_get_functions_by_name()

	-- #define gda_dict_get_functions_by_name(dict,funcname) gda_functions_get_by_name ((dict), (funcname))

	-- dict : 	
	-- funcname : 	
	-- Returns : 	
	-- gda_dict_get_function_by_name_arg()

	-- #define gda_dict_get_function_by_name_arg(dict,funcname,argtypes) gda_functions_get_by_name_arg ((dict), (funcname), (argtypes))

	-- dict : 	
	-- funcname : 	
	-- argtypes : 	
	-- Returns : 	
	-- gda_dict_get_function_by_xml_id()

	-- #define gda_dict_get_function_by_xml_id(dict,xml_id) gda_dict_get_object_by_xml_id ((dict), GDA_TYPE_DICT_FUNCTION, (xml_id))

	-- dict : 	
	-- xml_id : 	
	-- Returns : 	
	-- gda_dict_get_function_by_dbms_id()

	-- #define gda_dict_get_function_by_dbms_id(dict,dbms_id) gda_functions_get_by_dbms_id ((dict), (dbms_id))

	-- To find a DBMS functions which is uniquely identified by its name and the type of its argument.

	-- dict : 	a GdaDict object
	-- dbms_id : 	
	-- Returns : 	The function or NULL if not found
	-- gda_dict_get_aggregates()

	-- #define gda_dict_get_aggregates(dict) gda_dict_get_objects((dict), GDA_TYPE_DICT_AGGREGATE)

	-- dict : 	
	-- Returns : 	
	-- gda_dict_get_aggregates_by_name()

	-- #define gda_dict_get_aggregates_by_name(dict,aggname) gda_aggregates_get_by_name((dict), (aggname))

	-- dict : 	
	-- aggname : 	
	-- Returns : 	
	-- gda_dict_get_aggregate_by_name_arg()

	-- #define gda_dict_get_aggregate_by_name_arg(dict,argname,argtype) gda_aggregates_get_by_name_arg ((dict), (argname), (argtype))

	-- dict : 	
	-- argname : 	
	-- argtype : 	
	-- Returns : 	
	-- gda_dict_get_aggregate_by_xml_id()

	-- #define gda_dict_get_aggregate_by_xml_id(dict,xml_id) gda_dict_get_object_by_xml_id((dict), GDA_TYPE_DICT_AGGREGATE, (xml_id))

	-- dict : 	
	-- xml_id : 	
	-- Returns : 	
	-- gda_dict_get_aggregate_by_dbms_id()

	-- #define gda_dict_get_aggregate_by_dbms_id(dict,dbmsid) gda_aggregates_get_by_dbms_id((dict),(dbmsid))

	-- To find a DBMS functions which is uniquely identified by its name and the type of its argument.

	-- dict : 	a GdaDict object
	-- dbmsid : 	
	-- Returns : 	The aggregate or NULL if not found
	-- gda_dict_declare_object ()

	-- void        gda_dict_declare_object         (GdaDict *dict,
	--                                              GdaObject *object);

	-- Declares the existence of a new object to dict: dict knows about object but does not hold any reference to it. If dict must hold such a reference, then use gda_dict_assume_object().

	-- dict : 	a GdaDict object
	-- object : 	a GdaObject object
	-- gda_dict_declare_object_as ()

	-- void        gda_dict_declare_object_as      (GdaDict *dict,
	--                                              GdaObject *object,
	--                                              GType as_type);

	-- Same as gda_dict_declare_object() but forces to use the as_type type instead of object's realtype

	-- dict : 	a GdaDict object
	-- object : 	a GdaObject object
	-- as_type : 	type parent type of object to take into account
	-- gda_dict_assume_object ()

	-- void        gda_dict_assume_object          (GdaDict *dict,
	--                                              GdaObject *object);

	-- Declares the existence of a new object to dict, and force dict to hold a reference to object so it is not destroyed.

	-- dict : 	a GdaDict object
	-- object : 	a GdaObject object
	-- gda_dict_assume_object_as ()

	-- void        gda_dict_assume_object_as       (GdaDict *dict,
	--                                              GdaObject *object,
	--                                              GType as_type);

	-- Same as gda_dict_assume_object() but forces to use the as_type type instead of object's realtype

	-- dict : 	a GdaDict object
	-- object : 	a GdaObject object
	-- as_type : 	parent type of object to take into account
	-- gda_dict_unassume_object ()

	-- void        gda_dict_unassume_object        (GdaDict *dict,
	--                                              GdaObject *object);

	-- Makes dict release its reference on object.

	-- dict : 	a GdaDict object
	-- object : 	a GdaObject object
	-- gda_dict_get_objects ()

	-- GSList*     gda_dict_get_objects            (GdaDict *dict,
	--                                              GType type);

	-- dict : 	a GdaDict object
	-- type : 	a Gtype type of object
	-- Returns : 	a new list of all the objects of type type managed by dict.
	-- gda_dict_get_object_by_name ()

	-- GdaObject*  gda_dict_get_object_by_name     (GdaDict *dict,
	--                                              GType type,
	--                                              const gchar *name);

	-- Tries to find an object from its name, among the objects managed by dict of type type.

	-- dict : 	a GdaDict object
	-- type : 	a Gtype type of object
	-- name : 	
	-- Returns : 	a pointer to the requested object, or NULL if the object was not found
	-- gda_dict_get_object_by_xml_id ()

	-- GdaObject*  gda_dict_get_object_by_xml_id   (GdaDict *dict,
	--                                              GType type,
	--                                              const gchar *xml_id);

	-- For the objects which implement the GdaXmlStorage interface, this function allows to find an object from its XML Id. The object is looked from the managed objects of type type, and also from the list of all declared objects.

	-- dict : 	a GdaDict object
	-- type : 	a Gtype type of object
	-- xml_id : 	
	-- Returns : 	a pointer to the requested object, or NULL if the object was not found
	-- Property Details
	-- The "dsn" property

	--   "dsn"                  gchararray            : Read / Write

	-- Default value: NULL
	-- The "username" property

	--   "username"             gchararray            : Read / Write

	-- Default value: NULL
	-- Signal Details
	-- The "changed" signal

	-- void        user_function                  (GdaDict *gdadict,
	--                                             gpointer user_data)      : Run first

	-- dbdict : 	the object which received the signal.
	-- user_data : 	user data set when the signal handler was connected.
	-- The "data-update-finished" signal

	-- void        user_function                  (GdaDict *gdadict,
	--                                             gpointer user_data)      : Run first

	-- gdadict : 	the object which received the signal.
	-- user_data : 	user data set when the signal handler was connected.
	-- The "data-update-started" signal

	-- void        user_function                  (GdaDict *gdadict,
	--                                             gpointer user_data)      : Run first

	-- gdadict : 	the object which received the signal.
	-- user_data : 	user data set when the signal handler was connected.
	-- The "object-act-changed" signal

	-- void        user_function                  (GdaDict *gdadict,
	--                                             gpointer arg1,
	--                                             gpointer user_data)      : Run first

	-- gdadict : 	the object which received the signal.
	-- arg1 : 	
	-- user_data : 	user data set when the signal handler was connected.
	-- The "object-added" signal

	-- void        user_function                  (GdaDict *gdadict,
	--                                             gpointer arg1,
	--                                             gpointer user_data)      : Run first

	-- gdadict : 	the object which received the signal.
	-- arg1 : 	
	-- user_data : 	user data set when the signal handler was connected.
	-- The "object-removed" signal

	-- void        user_function                  (GdaDict *gdadict,
	--                                             gpointer arg1,
	--                                             gpointer user_data)      : Run first

	-- gdadict : 	the object which received the signal.
	-- arg1 : 	
	-- user_data : 	user data set when the signal handler was connected.
	-- The "object-updated" signal

	-- void        user_function                  (GdaDict *gdadict,
	--                                             gpointer arg1,
	--                                             gpointer user_data)      : Run first

	-- gdadict : 	the object which received the signal.
	-- arg1 : 	
	-- user_data : 	user data set when the signal handler was connected.
	-- The "update-progress" signal

	-- void        user_function                  (GdaDict *gdadict,
	--                                             gpointer arg1,
	--                                             guint    arg2,
	--                                             guint    arg3,
	--                                             gpointer user_data)      : Run first

	-- gdadict : 	the object which received the signal.
	-- arg1 : 	
	-- arg2 : 	
	-- arg3 : 	
	-- user_data : 	user data set when the signal handler was connected.
end -- class GDA_DICT
