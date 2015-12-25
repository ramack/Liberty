class TEST_WR01
   -- test weak references

insert
   MEMORY
   EIFFELTEST_TOOLS
   
create {}
   make

feature {}
   make
      local
         s: STRING
         w: WEAK_REFERENCE[STRING]
      do
         s := "some text%N"
         collection_off
         create w.set_item(s)

         label_assert("reference set correctly", w.item /= Void)

         if w.item /= Void then
            io.put_string(w.item)
         else
            io.put_string("already collected")
         end
         
         collection_on
      end
end -- class TEST_WR01
