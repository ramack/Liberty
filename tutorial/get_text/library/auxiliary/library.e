class LIBRARY

create {ANY}
   make

feature {ANY}
   print_hello is
      do
         io.put_string(translator.translation("Hello from the library"))
         io.put_new_line
      end

feature {}
   make (translator_: GET_TEXT[STRING]) is
      require
         translator_ /= Void
      local
         library_translator: LIBRARY_TRANSLATOR
      do
         create library_translator.connect_to(translator_)
         translator_reference.set_item(library_translator)
      end

   translator: LIBRARY_TRANSLATOR is
      do
         Result := translator_reference.item
      end

   translator_reference: REFERENCE[LIBRARY_TRANSLATOR] is
      once
         create Result
      end

end -- class LIBRARY
