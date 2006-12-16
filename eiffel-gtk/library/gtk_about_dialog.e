indexing
	description: "GtkAboutDialog ���� Display information about an application."
	copyright: "[ Copyright (C) 2006 Paolo Redaelli, GTK+ team
					
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

					-- Description: The GtkAboutDialog offers a simple way to display
					-- information about a program like its logo, name, copyright,
					-- website and license. It is also possible to give credits to
					-- the authors, documenters, translators and artists who have
					-- worked on the program. An about dialog is typically opened
					-- when the user selects the About option from the Help menu. All
					-- parts of the dialog are optional.

					-- About dialog often contain links and email
					-- addresses. GtkAboutDialog supports this by offering global
					-- hooks, which are called when the user clicks on a link or
					-- email address, see gtk_about_dialog_set_email_hook() and
					-- gtk_about_dialog_set_url_hook(). Email addresses in the
					-- authors, documenters and artists properties are recognized by
					-- looking for <user@host>, URLs are recognized by looking for
					-- http://url, with url extending to the next space, tab or line
					-- break.

					-- To make constructing a GtkAboutDialog as convenient as
					-- possible, you can use the function gtk_show_about_dialog()
					-- which constructs and shows a dialog and keeps it around so
					-- that it can be shown again.
					
class GTK_ABOUT_DIALOG
 
inherit
	GTK_DIALOG
		-- TODO: GtkAboutDialog implements AtkImplementorIface.	

		-- insert FOO_EXTERNALS

creation make, from_external_pointer

feature {} -- Creation
	make is
			-- a newly created GtkAboutDialog
		do
			from_external_pointer (gtk_about_dialog_new)
		end

feature
	name: STRING is
			-- the program name displayed in the about dialog.
		do
			-- The string returned by gtk_about_dialog_get_name is owned
			-- by the about dialog and must not be modified.
			create {CONST_STRING} Result.from_external_pointer (gtk_about_dialog_get_name(handle))
		end

	set_name (a_name: STRING) is
			-- Sets the name to display in the about dialog. If this is
			-- not set, it defaults to result of the C function-g_get_application_name().
		require
			name_not_void: a_name/=Void
		do
			gtk_about_dialog_set_name (handle, a_name.to_external)
		end

	version: STRING is
		do
			create {CONST_STRING} Result.from_external
			(gtk_about_dialog_get_version (handle))
		end

	set_version (a_version: STRING) is
			-- Sets the version string to display in the about dialog.
		require version_not_void: a_version /= Void
		do
			gtk_about_dialog_set_version (handle, a_version.to_external)
		end

	copyright: STRING is
			-- the copyright string
		do
			create {CONST_STRING} Result.from_external
			(gtk_about_dialog_get_copyright (handle))
		end

	set_copyright (a_copyright: STRING) is
			-- Sets the copyright string to display in the about dialog. This
			-- should be a short string of one or two lines.
		require copyright_not_void: a_copyright /= Void
		do
			gtk_about_dialog_set_copyright (handle, a_copyright.to_external)
		end

	comments: STRING is
		do
			create {CONST_STRING} Result
			(gtk_about_dialog_get_comments (handle))
		end

	set_comments (some_comments: STRING) is
			-- Sets the comments string to display in the about dialog. This should
			-- be a short string of one or two lines.
		require comments_not_void: some_comments /= Void
		do
			gtk_about_dialog_set_comments (handle,	some_comments.to_external)
		end

	license: STRING is
			-- the license information
		do
			create {CONST_STRING} Result.from_external
			(gtk_about_dialog_get_license (handle))
		end

	set_license (a_license: STRING) is
			-- Sets the license information to be displayed in the secondary
			-- license dialog. 
		require license_not_void: a_license /= Void
		do
			-- Note: if license is NULL, the license button is hidden.
			gtk_about_dialog_set_license (handle, a_license.to_external)
		end

	hide_license is
			-- Hide the license button.
		do
			gtk_about_dialog_set_license (handle, default_pointer)
		end

	is_license_wrapped: BOOLEAN is
			-- Is the license text in about automatically wrapped?
		do
			Result:=(gtk_about_dialog_get_wrap_license(handle)).to_boolean
		end

	set_wrap_license is
			-- Automatically wraps the license text in about.
		do
			gtk_about_dialog_set_wrap_license (handle, 1)
		end

	unset_wrap_license is
			-- Automatically unwraps the license text in about.
		do
			gtk_about_dialog_set_wrap_license (handle, 0)
		end

	website: STRING is
		do

-- const gchar* gtk_about_dialog_get_website   (GtkAboutDialog *about);

-- Returns the website URL.

-- about : 	a GtkAboutDialog
-- Returns : 	The website URL. The string is owned by the about dialog and must not be modified.

-- Since 2.6
-- gtk_about_dialog_set_website ()

-- void        gtk_about_dialog_set_website    (GtkAboutDialog *about,
-- 															const gchar *website);

-- Sets the URL to use for the website link.

-- about : 	a GtkAboutDialog
-- website : 	a URL string starting with "http://"

-- Since 2.6
-- gtk_about_dialog_get_website_label ()

-- const gchar* gtk_about_dialog_get_website_label
-- 														  (GtkAboutDialog *about);

-- Returns the label used for the website link.

-- about : 	a GtkAboutDialog
-- Returns : 	The label used for the website link. The string is owned by the about dialog and must not be modified.

-- Since 2.6
-- gtk_about_dialog_set_website_label ()

-- void        gtk_about_dialog_set_website_label
-- 														  (GtkAboutDialog *about,
-- 															const gchar *website_label);

-- Sets the label to be used for the website link. It defaults to the website URL.

-- about : 	a GtkAboutDialog
-- website_label : 	the label used for the website link

-- Since 2.6
-- gtk_about_dialog_get_authors ()

-- const gchar* const * gtk_about_dialog_get_authors
-- 														  (GtkAboutDialog *about);

-- Returns the string which are displayed in the authors tab of the secondary credits dialog.

-- about : 	a GtkAboutDialog
-- Returns : 	A NULL-terminated string array containing the authors. The array is owned by the about dialog and must not be modified.

-- Since 2.6
-- gtk_about_dialog_set_authors ()

-- void        gtk_about_dialog_set_authors    (GtkAboutDialog *about,
-- 															const gchar **authors);

-- Sets the strings which are displayed in the authors tab of the secondary credits dialog.

-- about : 	a GtkAboutDialog
-- authors : 	a NULL-terminated array of strings

-- Since 2.6
-- gtk_about_dialog_get_artists ()

-- const gchar* const * gtk_about_dialog_get_artists
-- 														  (GtkAboutDialog *about);

-- Returns the string which are displayed in the artists tab of the secondary credits dialog.

-- about : 	a GtkAboutDialog
-- Returns : 	A NULL-terminated string array containing the artists. The array is owned by the about dialog and must not be modified.

-- Since 2.6
-- gtk_about_dialog_set_artists ()

-- void        gtk_about_dialog_set_artists    (GtkAboutDialog *about,
-- 															const gchar **artists);

-- Sets the strings which are displayed in the artists tab of the secondary credits dialog.

-- about : 	a GtkAboutDialog
-- artists : 	a NULL-terminated array of strings

-- Since 2.6
-- gtk_about_dialog_get_documenters ()

-- const gchar* const * gtk_about_dialog_get_documenters
-- 														  (GtkAboutDialog *about);

-- Returns the string which are displayed in the documenters tab of the secondary credits dialog.

-- about : 	a GtkAboutDialog
-- Returns : 	A NULL-terminated string array containing the documenters. The array is owned by the about dialog and must not be modified.

-- Since 2.6
-- gtk_about_dialog_set_documenters ()

-- void        gtk_about_dialog_set_documenters
-- 														  (GtkAboutDialog *about,
-- 															const gchar **documenters);

-- Sets the strings which are displayed in the documenters tab of the secondary credits dialog.

-- about : 	a GtkAboutDialog
-- documenters : 	a NULL-terminated array of strings

-- Since 2.6
-- gtk_about_dialog_get_translator_credits ()

-- const gchar* gtk_about_dialog_get_translator_credits
-- 														  (GtkAboutDialog *about);

-- Returns the translator credits string which is displayed in the translators tab of the secondary credits dialog.

-- about : 	a GtkAboutDialog
-- Returns : 	The translator credits string. The string is owned by the about dialog and must not be modified.

-- Since 2.6
-- gtk_about_dialog_set_translator_credits ()

-- void        gtk_about_dialog_set_translator_credits
-- 														  (GtkAboutDialog *about,
-- 															const gchar *translator_credits);

-- Sets the translator credits string which is displayed in the translators tab of the secondary credits dialog.

-- The intended use for this string is to display the translator of the language which is currently used in the user interface. Using gettext(), a simple way to achieve that is to mark the string for translation:

--  gtk_about_dialog_set_translator_credits (about, _("translator-credits"));

-- It is a good idea to use the customary msgid "translator-credits" for this purpose, since translators will already know the purpose of that msgid, and since GtkAboutDialog will detect if "translator-credits" is untranslated and hide the tab.

-- about : 	a GtkAboutDialog
-- translator_credits : 	the translator credits

-- Since 2.6
-- gtk_about_dialog_get_logo ()

-- GdkPixbuf*  gtk_about_dialog_get_logo       (GtkAboutDialog *about);

-- Returns the pixbuf displayed as logo in the about dialog.

-- about : 	a GtkAboutDialog
-- Returns : 	the pixbuf displayed as logo. The pixbuf is owned by the about dialog. If you want to keep a reference to it, you have to call g_object_ref() on it.

-- Since 2.6
-- gtk_about_dialog_set_logo ()

-- void        gtk_about_dialog_set_logo       (GtkAboutDialog *about,
-- 															GdkPixbuf *logo);

-- Sets the pixbuf to be displayed as logo in the about dialog. If it is NULL, the default window icon set with gtk_window_set_default_icon() will be used.

-- about : 	a GtkAboutDialog
-- logo : 	a GdkPixbuf, or NULL

-- Since 2.6
-- gtk_about_dialog_get_logo_icon_name ()

-- const gchar* gtk_about_dialog_get_logo_icon_name
-- 														  (GtkAboutDialog *about);

-- Returns the icon name displayed as logo in the about dialog.

-- about : 	a GtkAboutDialog
-- Returns : 	the icon name displayed as logo. The string is owned by the dialog. If you want to keep a reference to it, you have to call g_strdup() on it.

-- Since 2.6
-- gtk_about_dialog_set_logo_icon_name ()

-- void        gtk_about_dialog_set_logo_icon_name
-- 														  (GtkAboutDialog *about,
-- 															const gchar *icon_name);

-- Sets the pixbuf to be displayed as logo in the about dialog. If it is NULL, the default window icon set with gtk_window_set_default_icon() will be used.

-- about : 	a GtkAboutDialog
-- icon_name : 	an icon name, or NULL

-- Since 2.6
-- GtkAboutDialogActivateLinkFunc ()

-- void        (*GtkAboutDialogActivateLinkFunc)
-- 														  (GtkAboutDialog *about,
-- 															const gchar *link,
-- 															gpointer data);

-- The type of a function which is called when a URL or email link is activated.
-- about : 	the GtkAboutDialog in which the link was activated
-- link : 	the URL or email address to whiche the activated link points
-- data : 	user data that was passed when the function was registered with gtk_about_dialog_set_email_hook() or gtk_about_dialog_set_url_hook()
-- gtk_about_dialog_set_email_hook ()

-- GtkAboutDialogActivateLinkFunc gtk_about_dialog_set_email_hook
-- 														  (GtkAboutDialogActivateLinkFunc func,
-- 															gpointer data,
-- 															GDestroyNotify destroy);

-- Installs a global function to be called whenever the user activates an email link in an about dialog.

-- func : 	a function to call when an email link is activated.
-- data : 	data to pass to func
-- destroy : 	GDestroyNotify for data
-- Returns : 	the previous email hook.

-- Since 2.6
-- gtk_about_dialog_set_url_hook ()

-- GtkAboutDialogActivateLinkFunc gtk_about_dialog_set_url_hook
-- 														  (GtkAboutDialogActivateLinkFunc func,
-- 															gpointer data,
-- 															GDestroyNotify destroy);

-- Installs a global function to be called whenever the user activates a URL link in an about dialog.

-- func : 	a function to call when a URL link is activated.
-- data : 	data to pass to func
-- destroy : 	GDestroyNotify for data
-- Returns : 	the previous URL hook.

-- Since 2.6
-- gtk_show_about_dialog ()

-- void        gtk_show_about_dialog           (GtkWindow *parent,
-- 															const gchar *first_property_name,
-- 															...);

-- This is a convenience function for showing an application's about box. The constructed dialog is associated with the parent window and reused for future invocations of this function.

-- parent : 	transient parent, or NULL for none
-- first_property_name : 	the name of the first property
-- ... : 	value of first property, followed by more properties, NULL-terminated

-- Since 2.6
-- Property Details
-- The "artists" property

--   "artists"              GStrv                 : Read / Write

-- The people who contributed artwork to the program, as a NULL-terminated array of strings. Each string may contain email addresses and URLs, which will be displayed as links, see the introduction for more details.

-- Since 2.6
-- The "authors" property

--   "authors"              GStrv                 : Read / Write

-- The authors of the program, as a NULL-terminated array of strings. Each string may contain email addresses and URLs, which will be displayed as links, see the introduction for more details.

-- Since 2.6
-- The "comments" property

--   "comments"             gchararray            : Read / Write

-- Comments about the program. This string is displayed in a label in the main dialog, thus it should be a short explanation of the main purpose of the program, not a detailed list of features.

-- Default value: NULL

-- Since 2.6
-- The "copyright" property

--   "copyright"            gchararray            : Read / Write

-- Copyright information for the program.

-- Default value: NULL

-- Since 2.6
-- The "documenters" property

--   "documenters"          GStrv                 : Read / Write

-- The people documenting the program, as a NULL-terminated array of strings. Each string may contain email addresses and URLs, which will be displayed as links, see the introduction for more details.

-- Since 2.6
-- The "license" property

--   "license"              gchararray            : Read / Write

-- The license of the program. This string is displayed in a text view in a secondary dialog, therefore it is fine to use a long multi-paragraph text. Note that the text is only wrapped in the text view if the "wrap-license" property is set to TRUE; otherwise the text itself must contain the intended linebreaks.

-- Default value: NULL

-- Since 2.6
-- The "logo" property

--   "logo"                 GdkPixbuf             : Read / Write

-- A logo for the about box. If this is not set, it defaults to gtk_window_get_default_icon_list().

-- Since 2.6
-- The "logo-icon-name" property

--   "logo-icon-name"       gchararray            : Read / Write

-- A named icon to use as the logo for the about box. This property overrides the logo property.

-- Default value: NULL

-- Since 2.6
-- The "name" property

--   "name"                 gchararray            : Read / Write

-- The name of the program. If this is not set, it defaults to g_get_application_name().

-- Default value: NULL

-- Since 2.6
-- The "translator-credits" property

--   "translator-credits"   gchararray            : Read / Write

-- Credits to the translators. This string should be marked as translatable. The string may contain email addresses and URLs, which will be displayed as links, see the introduction for more details.

-- Default value: NULL

-- Since 2.6
-- The "version" property

--   "version"              gchararray            : Read / Write

-- The version of the program.

-- Default value: NULL

-- Since 2.6
-- The "website" property

--   "website"              gchararray            : Read / Write

-- The URL for the link to the website of the program. This should be a string starting with "http://.

-- Default value: NULL

-- Since 2.6
-- The "website-label" property

--   "website-label"        gchararray            : Read / Write

-- The label for the link to the website of the program. If this is not set, it defaults to the URL specified in the website property.

-- Default value: NULL

-- Since 2.6
-- The "wrap-license" property

--   "wrap-license"         gboolean              : Read / Write

-- Whether to wrap the text in the license dialog.

-- Default value: FALSE

-- Since 2.8
-- See Als

-- feature -- 
-- Properties

--   "artists"              GStrv                 : Read / Write
--   "authors"              GStrv                 : Read / Write
--   "comments"             gchararray            : Read / Write
--   "copyright"            gchararray            : Read / Write
--   "documenters"          GStrv                 : Read / Write
--   "license"              gchararray            : Read / Write
--   "logo"                 GdkPixbuf             : Read / Write
--   "logo-icon-name"       gchararray            : Read / Write
--   "name"                 gchararray            : Read / Write
--   "translator-credits"   gchararray            : Read / Write
--   "version"              gchararray            : Read / Write
--   "website"              gchararray            : Read / Write
--   "website-label"        gchararray            : Read / Write
--   "wrap-license"         gboolean              : Read / Write

--   feature {} -- External calls 
-- #include <gtk/gtk.h>


-- 				GtkAboutDialog;
-- GtkWidget*  gtk_about_dialog_new            (void);
-- const gchar* gtk_about_dialog_get_name      (GtkAboutDialog *about);
-- void        gtk_about_dialog_set_name       (GtkAboutDialog *about,
-- 															const gchar *name);
-- const gchar* gtk_about_dialog_get_version   (GtkAboutDialog *about);
-- void        gtk_about_dialog_set_version    (GtkAboutDialog *about,
-- 															const gchar *version);
-- const gchar* gtk_about_dialog_get_copyright (GtkAboutDialog *about);
-- void        gtk_about_dialog_set_copyright  (GtkAboutDialog *about,
-- 															const gchar *copyright);
-- const gchar* gtk_about_dialog_get_comments  (GtkAboutDialog *about);
-- void        gtk_about_dialog_set_comments   (GtkAboutDialog *about,
-- 															const gchar *comments);
-- const gchar* gtk_about_dialog_get_license   (GtkAboutDialog *about);
-- void        gtk_about_dialog_set_license    (GtkAboutDialog *about,
-- 															const gchar *license);
-- gboolean    gtk_about_dialog_get_wrap_license
-- 														  (GtkAboutDialog *about);
-- void        gtk_about_dialog_set_wrap_license
-- 														  (GtkAboutDialog *about,
-- 															gboolean wrap_license);
-- const gchar* gtk_about_dialog_get_website   (GtkAboutDialog *about);
-- void        gtk_about_dialog_set_website    (GtkAboutDialog *about,
-- 															const gchar *website);
-- const gchar* gtk_about_dialog_get_website_label
-- 														  (GtkAboutDialog *about);
-- void        gtk_about_dialog_set_website_label
-- 														  (GtkAboutDialog *about,
-- 															const gchar *website_label);
-- const gchar* const * gtk_about_dialog_get_authors
-- 														  (GtkAboutDialog *about);
-- void        gtk_about_dialog_set_authors    (GtkAboutDialog *about,
-- 															const gchar **authors);
-- const gchar* const * gtk_about_dialog_get_artists
-- 														  (GtkAboutDialog *about);
-- void        gtk_about_dialog_set_artists    (GtkAboutDialog *about,
-- 															const gchar **artists);
-- const gchar* const * gtk_about_dialog_get_documenters
-- 														  (GtkAboutDialog *about);
-- void        gtk_about_dialog_set_documenters
-- 														  (GtkAboutDialog *about,
-- 															const gchar **documenters);
-- const gchar* gtk_about_dialog_get_translator_credits
-- 														  (GtkAboutDialog *about);
-- void        gtk_about_dialog_set_translator_credits
-- 														  (GtkAboutDialog *about,
-- 															const gchar *translator_credits);
-- GdkPixbuf*  gtk_about_dialog_get_logo       (GtkAboutDialog *about);
-- void        gtk_about_dialog_set_logo       (GtkAboutDialog *about,
-- 															GdkPixbuf *logo);
-- const gchar* gtk_about_dialog_get_logo_icon_name
-- 														  (GtkAboutDialog *about);
-- void        gtk_about_dialog_set_logo_icon_name
-- 														  (GtkAboutDialog *about,
-- 															const gchar *icon_name);
-- void        (*GtkAboutDialogActivateLinkFunc)
-- 														  (GtkAboutDialog *about,
-- 															const gchar *link,
-- 															gpointer data);
-- GtkAboutDialogActivateLinkFunc gtk_about_dialog_set_email_hook
-- 														  (GtkAboutDialogActivateLinkFunc func,
-- 															gpointer data,
-- 															GDestroyNotify destroy);
-- GtkAboutDialogActivateLinkFunc gtk_about_dialog_set_url_hook
-- 														  (GtkAboutDialogActivateLinkFunc func,
-- 															gpointer data,
-- 															GDestroyNotify destroy);
-- void        gtk_show_about_dialog           (GtkWindow *parent,
-- 															const gchar *first_property_name,
-- 															...);

-- GTK_STOCK_ABOUT
end -- class GTK_ABOUT_DIALOG
