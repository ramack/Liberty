indexing
	description: "Generic callback for the changed signal"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$Revision:$"

class CHANGED_CALLBACK

inherit
	CALLBACK
		-- rename object as editable
		redefine object, callback
		end

insert G_OBJECT_RETRIEVER [GTK_EDITABLE]

creation make

feature
	object: GTK_EDITABLE

feature
	callback (instance: POINTER) is --  a_editable: GTK_EDITABLE) is
		do
			debug
				print ("Callback: instance=") print (instance.to_string) print ("%N")
			end
			-- The following is written with the implicit requirement 
			-- that the editable is actually created bu the Eiffel 
			-- application. 
			check
				eiffel_created_the_editable: has_eiffel_wrapper_stored (instance)
			end
			object := retrieve_eiffel_wrapper_from_gobject_pointer (instance)
			-- The above line replaces "create object.from_external_pointer
			-- (instance)" which continuosly creates new Eiffel wrappers
			procedure.call ([object])
		end

	callback_pointer: POINTER is
		do
			Result := get_callback_pointer ($callback)
		ensure
			Result.is_not_null
		end

	connect (an_object: GTK_EDITABLE; a_procedure: PROCEDURE [ANY, TUPLE[GTK_EDITABLE]]) is
		do
			debug
				print ("CHANGED_CALLBACK.connect (an_object=") print (an_object.to_pointer.to_string)
				print (" an_object.handle=") print (an_object.handle.to_string)
				print (") Current=") print (to_pointer.to_string)
				print (" Current.handle=") print (handle.to_string)
				print ("%N")
			end
					 
			handler_id := g_signal_connect_closure (an_object.handle,
													 signal_name.to_external,
													 handle,
													 0 -- i.e. call it before default handler
													 )
			procedure:=a_procedure
		end

	signal_name: STRING is "changed"

	procedure: PROCEDURE [ANY, TUPLE[GTK_EDITABLE]]
end
