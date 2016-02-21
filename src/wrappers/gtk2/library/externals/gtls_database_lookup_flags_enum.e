-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTLS_DATABASE_LOOKUP_FLAGS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_tls_database_lookup_keypair_low_level)  or else
				(a_value = g_tls_database_lookup_none_low_level) )
		end

feature -- Setters
	default_create,
	set_g_tls_database_lookup_keypair is
		do
			value := g_tls_database_lookup_keypair_low_level
		end

	set_g_tls_database_lookup_none is
		do
			value := g_tls_database_lookup_none_low_level
		end

feature -- Queries
	is_g_tls_database_lookup_keypair: BOOLEAN is
		do
			Result := (value=g_tls_database_lookup_keypair_low_level)
		end

	is_g_tls_database_lookup_none: BOOLEAN is
		do
			Result := (value=g_tls_database_lookup_none_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_tls_database_lookup_keypair_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TLS_DATABASE_LOOKUP_KEYPAIR"
 			}"
 		end

	g_tls_database_lookup_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TLS_DATABASE_LOOKUP_NONE"
 			}"
 		end


end -- class GTLS_DATABASE_LOOKUP_FLAGS_ENUM
