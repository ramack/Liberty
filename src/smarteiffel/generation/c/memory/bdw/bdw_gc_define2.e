-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class BDW_GC_DEFINE2

inherit
   STATIC_TYPE_MARK_VISITOR
   GENERIC_TYPE_MARK_VISITOR
   NON_GENERIC_TYPE_MARK_VISITOR

insert
   GLOBALS

create {BDW_GC}
   make

feature {BDW_GC}
   for (lt: like live_type)
      require
         lt.at_run_time
      do
         live_type := lt
         lt.canonical_type_mark.accept(Current)
         live_type := Void
      end

   extra_functions
      local
         nat_idx: INTEGER
--         gc_kind_var: STRING
      do
         cpp.prepare_c_function
         cpp.pending_c_function_signature.append(once "void bdw_run_finalizers(void)")
         cpp.pending_c_function_body.append(once "if(bdw_in_assign)bdw_delayed_finalize=1;%N%
                                                 %else{%N%
                                                 %handle(SE_HANDLE_ENTER_GC,NULL);%N")
         if bdw.info_flag then
            cpp.pending_c_function_body.append(once "GC_dump();%N")
         end
         cpp.pending_c_function_body.append(once "GC_invoke_finalizers();%N%
                                                 %handle(SE_HANDLE_EXIT_GC,NULL);}%N")
         cpp.dump_pending_c_function(True)

         -- generate global kind variables
--         create gc_kind_var.make(32)

--         from
--            nat_idx := native_arraytypes.lower
--         until
--            nat_idx > native_arraytypes.upper
--         loop
--            gc_kind_var.wipe_out
--            gc_kind_var.append(once "unsigned int T")
--            native_arraytypes.item(nat_idx).id.append_in(gc_kind_var)
--            gc_kind_var.append("_gc_kind")
--            cpp.write_extern_1(gc_kind_var)
--            nat_idx := nat_idx + 1
--         end

         cpp.write_extern_1("unsigned int bdw_nac_gc_kind")
         cpp.pending_c_function_signature.append(once "void bdw_init_kinds(void)")
         cpp.pending_c_function_body.append(once "%N")
-- TODO: add special handling for non-boost prototype with additional parameter
         
-- TODO: Rmk: this doesn work, as the number of kinds is very limited 
-- -> create only ONE kind for all NATIVE_ARRAYs
--         from
--            nat_idx := native_arraytypes.lower
--         until
--            nat_idx > native_arraytypes.upper
--         loop
--            cpp.pending_c_function_body.append(once "T")
--            native_arraytypes.item(nat_idx).id.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "bdw_nac_gc_kind = GC_new_kind (GC_new_free_list (), GC_MAKE_PROC (GC_new_proc ((GC_mark_proc)bdw_mark_na_collector")
--            native_arraytypes.item(nat_idx).id.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "), 0), 0, 1);%N")
--            nat_idx := nat_idx + 1
--         end

         cpp.dump_pending_c_function(True)

         cpp.pending_c_function_signature.append(once "struct GC_ms_entry *bdw_mark_na_collector(void *obj, struct GC_ms_entry *mark_stack_ptr, struct GC_ms_entry *mark_stack_limit, GC_word env)")
         cpp.pending_c_function_body.append(once "%N")
         cpp.pending_c_function_body.append(once "T0 *C = (T0*)obj;%N")
         
         cpp.pending_c_function_body.append(once "switch(C->id){%N")

         from
            nat_idx := native_arraytypes.lower
         until
            nat_idx > native_arraytypes.upper
         loop
            cpp.pending_c_function_body.append(once "case ")
            native_arraytypes.item(nat_idx).id.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once ":%N  T")
            native_arraytypes.item(nat_idx).id.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "_mark((T")
            native_arraytypes.item(nat_idx).id.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "*)C, mark_stack_ptr, mark_stack_limit, env);%N  break;%N")
            nat_idx := nat_idx + 1
         end
         cpp.pending_c_function_body.append(once "default:%N  printf(%"mmmooooehp %%d\n%", C->id);%N  break;%N}%N")
--TODO: check whether this function should return mark_stack_ptr and whether C has to be marked here (I guess not)
         cpp.dump_pending_c_function(True)

      end

feature {ANY_TYPE_MARK}
   visit_any_type_mark (visited: ANY_TYPE_MARK)
      do
         alloc_reference(visited)
      end

feature {CLASS_TYPE_MARK}
   visit_class_type_mark (visited: CLASS_TYPE_MARK)
      do
         if visited.is_reference then
            alloc_reference(visited)
         end
         if is_na_collector then
            mark_native_arrays(visited)
         end
      end

feature {BOOLEAN_TYPE_MARK}
   visit_boolean_type_mark (visited: BOOLEAN_TYPE_MARK)
      do
      end

feature {CHARACTER_TYPE_MARK}
   visit_character_type_mark (visited: CHARACTER_TYPE_MARK)
      do
      end

feature {INTEGER_TYPE_MARK}
   visit_integer_type_mark (visited: INTEGER_TYPE_MARK)
      do
      end

feature {NATURAL_TYPE_MARK}
   visit_natural_type_mark (visited: NATURAL_TYPE_MARK)
      do
      end

feature {POINTER_TYPE_MARK}
   visit_pointer_type_mark (visited: POINTER_TYPE_MARK)
      do
      end

feature {REAL_TYPE_MARK}
   visit_real_type_mark (visited: REAL_TYPE_MARK)
      do
      end

feature {STRING_TYPE_MARK}
   visit_string_type_mark (visited: STRING_TYPE_MARK)
      do
         alloc_reference(visited)
         if is_na_collector then
            mark_native_arrays(visited)
         end
      end

feature {AGENT_TYPE_MARK}
   visit_agent_type_mark (visited: AGENT_TYPE_MARK)
      do
         alloc_reference(visited)
         if is_na_collector then
            mark_native_arrays(visited)
         end
      end

feature {ARRAY_TYPE_MARK}
   visit_array_type_mark (visited: ARRAY_TYPE_MARK)
      do
         alloc_reference(visited)
         if is_na_collector then
            mark_native_arrays(visited)
         end
      end

feature {EMPTY_TUPLE_TYPE_MARK}
   visit_empty_tuple_type_mark (visited: EMPTY_TUPLE_TYPE_MARK)
      do
         alloc_reference(visited)
      end

feature {NATIVE_ARRAY_TYPE_MARK}
   visit_native_array_type_mark (visited: NATIVE_ARRAY_TYPE_MARK)
      do
         alloc_native_array(visited)
      end

feature {NON_EMPTY_TUPLE_TYPE_MARK}
   visit_non_empty_tuple_type_mark (visited: NON_EMPTY_TUPLE_TYPE_MARK)
      do
         alloc_reference(visited)
      end

feature {USER_GENERIC_TYPE_MARK}
   visit_user_generic_type_mark (visited: USER_GENERIC_TYPE_MARK)
      do
         if visited.is_reference then
            alloc_reference(visited)
         end
         if is_na_collector then
            mark_native_arrays(visited)
         end
      end

feature {WEAK_REFERENCE_TYPE_MARK}
   visit_weak_reference_type_mark (visited: WEAK_REFERENCE_TYPE_MARK)
      do
         alloc_weak_reference(visited)
      end

feature {} -- memory-specific handling aspects
   native_array_collector: LIVE_TYPE_NATIVE_ARRAY_COLLECTOR

   native_arraytypes: ARRAY[LIVE_TYPE]
         -- type containing native_arrays
   
feature {}
   live_type: LIVE_TYPE
   bdw: BDW_GC
   
   is_na_collector: BOOLEAN
      local
         na: TAGGED_FLAG
      do
         na := native_array_collector.must_collect(live_type)
         Result := na /= Void and then na.item
      end

   make (a_bdw: like bdw; a_native_array_collector: like native_array_collector)
      require
         a_bdw /= Void
         a_native_array_collector /= Void
      do
         bdw := a_bdw
         native_array_collector := a_native_array_collector
         create native_arraytypes.with_capacity(7, 0)
      ensure
         bdw = a_bdw
         native_array_collector = a_native_array_collector
      end

   put_alloc_function (tm: TYPE_MARK)
      require
         tm = live_type.canonical_type_mark
      do
         cpp.prepare_c_function
         cpp.pending_c_function_signature.append(cpp.target_type.for(tm))
         cpp.pending_c_function_signature.append(once " bdw_mallocT")
         live_type.id.append_in(cpp.pending_c_function_signature)
         cpp.pending_c_function_signature.append(once "(int n)")
         cpp.pending_c_function_body.append(cpp.target_type.for(tm))
         if tm.is_expanded then
            cpp.pending_c_function_body.extend(' ')
         end
         cpp.pending_c_function_body.append(once "R=(")
         cpp.pending_c_function_body.append(cpp.target_type.for(tm))
         cpp.pending_c_function_body.append(once ")bdw_malloc_innerT")
         live_type.id.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once "(&n);%N%
                                                 %if(GC_should_invoke_finalizers())bdw_run_finalizers();%N%
                                                 %return R;%N")
         cpp.dump_pending_c_function(True)
      end

   prepare_alloc_inner_function (tm: TYPE_MARK)
      require
         tm = live_type.canonical_type_mark
      do
         cpp.prepare_c_function
         cpp.pending_c_function_signature.append(cpp.target_type.for(tm))
         cpp.pending_c_function_signature.append(once " bdw_malloc_innerT")
         live_type.id.append_in(cpp.pending_c_function_signature)
         cpp.pending_c_function_signature.append(once "(int*n)")
      end

   alloc_reference (tm: TYPE_MARK)
      require
         live_type.is_reference
         tm = live_type.canonical_type_mark
      local
         has_finalizer: BOOLEAN
      do
         has_finalizer := finalize_reference(tm)
io.put_string("alloc_reference : " + tm.written_mark + "%N")

         prepare_alloc_inner_function(tm)
         cpp.pending_c_function_body.append(cpp.target_type.for(tm))
         cpp.pending_c_function_body.append(once "R=(")
         cpp.pending_c_function_body.append(cpp.target_type.for(tm))

         if is_na_collector then
            cpp.pending_c_function_body.append(once ")GC_generic_malloc ((*n)*sizeof (T")
            live_type.id.append_in(cpp.pending_c_function_body)
            
            cpp.pending_c_function_body.append(once "), ")
--            live_type.type.id.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "bdw_nac_gc_kind);%N")

            io.put_string("  NATIVE_ARRAY_COLLECTORs in NATIVE_ARRAY%N")
            if ace.boost then
               cpp.pending_c_function_body.append(once "/* Allocation of NATIVE_ARRAY_COLLECTORs in NATIVE_ARRAYs is currently not supported.")
               cpp.pending_c_function_body.append(once "*/%Nif(*n != 1) se_signal_handler(14/*System_level_type_error*/);%N")
            else
               cpp.pending_c_function_body.append(once "if(*n != 1) error0(%"%
                   %Allocation of NATIVE_ARRAY_COLLECTORs in NATIVE_ARRAYs is currently not supported.%", NULL);%N")
            end
            -- TODO: check what we can do to allow this
            
         else
            cpp.pending_c_function_body.append(once ")se_malloc((*n)*sizeof(T")
            live_type.id.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "/*")
            cpp.pending_c_function_body.append(live_type.structure_signature)
            cpp.pending_c_function_body.append(once "*/));%N")
         end
         
         if has_finalizer then
            cpp.pending_c_function_body.append(once "GC_REGISTER_FINALIZER_NO_ORDER(R, bdw_finalizeT")
            live_type.id.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once ",NULL,NULL,NULL);%N")
         end
         -- TODO: check whether we really need to set id here, at 
         -- least for STRINGs is it updated in some other places, too
         if cpp.need_struct.for(tm) then
            cpp.pending_c_function_body.append(once "*R=M")
            live_type.id.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once ";%N")
         end
         cpp.pending_c_function_body.append(once "return R;%N")
         cpp.dump_pending_c_function(True)

         put_alloc_function(tm)
      end

   alloc_weak_reference (tm: WEAK_REFERENCE_TYPE_MARK)
      require
         live_type.is_reference
         tm = live_type.canonical_type_mark
      do
io.put_string("alloc_weak_reference : " + tm.written_mark + "%N")
         prepare_weakref_accessors

         prepare_alloc_inner_function(tm)
         cpp.pending_c_function_body.append(cpp.target_type.for(tm))
         cpp.pending_c_function_body.append(once "R=(")
         cpp.pending_c_function_body.append(cpp.target_type.for(tm))
         cpp.pending_c_function_body.append(once ")bdw_weakref_new(*n);%N%
                                                 %*R=M")
         live_type.id.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once ";%N%
                                                 %return R;%N")
         cpp.dump_pending_c_function(True)

         put_alloc_function(tm)
      end

   alloc_native_array (tm: NATIVE_ARRAY_TYPE_MARK)
      require
         live_type.is_native_array
         tm = live_type.canonical_type_mark
      local
         et: TYPE
      do
         et := live_type.type.generic_list.first
io.put_string("alloc_native_array : " + tm.written_mark + "%N")
         
         prepare_alloc_inner_function(tm)
         cpp.pending_c_function_body.append(cpp.target_type.for(tm))
         cpp.pending_c_function_body.append(once " R=(")
         cpp.pending_c_function_body.append(cpp.target_type.for(tm))

         if is_na_collector then
            -- allocate native_array storage, which is not marked by 
            -- generic marking but rely on specific mark_antive_arrays procedure 
            -- in the NATIVE_ARRAY_COLLECTOR
            cpp.pending_c_function_body.append(once ")GC_MALLOC_ATOMIC((*n) * sizeof(T")
            if et.is_reference then
               cpp.pending_c_function_body.append(once "0*));%N")
            else
               -- TODO: check: are references in these expandeds 
               -- correctly marked?
               et.id.append_in(cpp.pending_c_function_body)
               cpp.pending_c_function_body.append(once "/*")
               cpp.pending_c_function_body.append(et.live_type.structure_signature)
               cpp.pending_c_function_body.append(once "*/));%N")
            end
         else
            -- 
            cpp.pending_c_function_body.append(once ")se_calloc(*n, sizeof(T")
            if et.is_reference then
               cpp.pending_c_function_body.append(once "0*));%N")
            else
               et.id.append_in(cpp.pending_c_function_body)
               cpp.pending_c_function_body.append(once "/*")
               cpp.pending_c_function_body.append(et.live_type.structure_signature)
               cpp.pending_c_function_body.append(once "*/));%N")
            end
         end
         cpp.pending_c_function_body.append(once "return R;%N")
         cpp.dump_pending_c_function(True)

         put_alloc_function(tm)
      end

   finalize_reference (tm: TYPE_MARK): BOOLEAN
         -- Append the extra C code for the MEMORY.dispose call if any.
      require
         not live_type.is_expanded
         not live_type.is_native_array
         tm = live_type.canonical_type_mark
      local
         rf3: RUN_FEATURE_3; o: STRING
      do
         rf3 := bdw.get_memory_dispose(live_type)
         if rf3 /= Void then
            cpp.prepare_c_function
            cpp.pending_c_function_signature.append(once "void bdw_finalizeT")
            live_type.id.append_in(cpp.pending_c_function_signature)
            cpp.pending_c_function_signature.append(once "(void*obj,void*_)")
            o := once "................"
            o.copy(once "((")
            o.append(cpp.target_type.for(tm))
            o.append(once ")obj)")
            bdw.generate_dispose(o, rf3, live_type)
            cpp.dump_pending_c_function(True)
            Result := True
         end
      end

   prepare_weakref_accessors
      once
         cpp.out_h_buffer.copy(once "typedef struct bdw_Swr{Tid id;T0*o;}bdw_Twr;%N")
         cpp.write_out_h_buffer
         cpp.prepare_c_function
         cpp.pending_c_function_signature.append(once "void bdw_weakref_setlink(bdw_Twr*wr,T0*r)")
--         TODO: disappearing_links are to be un-registered and registered again, in case of realloc...
         cpp.pending_c_function_body.append(once "GC_disable();%N%
                                                 %if(wr->o)GC_unregister_disappearing_link((void**)&(wr->o));%N%
                                                 %wr->o=r;%N%
                                                 %if(r)GC_GENERAL_REGISTER_DISAPPEARING_LINK((void**)&(wr->o),(void*)r);%N%
                                                 %GC_enable();%N")
         cpp.dump_pending_c_function(True)

         cpp.prepare_c_function
         cpp.pending_c_function_signature.append(once "T0*bdw_weakref_getlink(bdw_Twr*wr)")
         cpp.pending_c_function_body.append(once "return wr->o;%N")
         cpp.dump_pending_c_function(True)

         cpp.prepare_c_function
         cpp.pending_c_function_signature.append(once "void*bdw_weakref_new(int n)")
--TODO:        Rmk: is it correct to use GC_MALLOC_ATOMIC here?
         cpp.pending_c_function_body.append(once "void*result=GC_MALLOC_ATOMIC(n*sizeof(bdw_Twr));%N%
                                                 %se_check_malloc(result, %"No more memory (GC_MALLOC_ATOMIC failed).\n%");%N%
                                                 %return result;%N")
         cpp.dump_pending_c_function(True)
      end

   mark_native_arrays (type_mark: TYPE_MARK)
      local
         fct_name: STRING
         wa: ARRAY[RUN_FEATURE_2]
         a: RUN_FEATURE_2; t: TYPE
         i: INTEGER
      do
         -- TODO: add header comment
         -- store necessary data to create the new "kind" for this NA type in bdw_init_kinds
         native_arraytypes.add_last(live_type)
io.put_string("mark_native_arrays : " + type_mark.written_mark + "%N")

         create fct_name.with_capacity(256)
         fct_name.append(once "struct GC_ms_entry *T")
         live_type.id.append_in(fct_name)
         fct_name.append(once "_mark(T");
         live_type.id.append_in(fct_name)
         fct_name.append(once " *C, struct GC_ms_entry *mark_stack_ptr, struct GC_ms_entry *mark_stack_limit, GC_word env)")
         cpp.pending_c_function_signature.append(fct_name)
         cpp.pending_c_function_body.append(once "%N")

         cpp.pending_c_function_body.append(once "bdw_mark_data_T mark_data = {mark_stack_ptr, mark_stack_limit, 0};%N")

--     TODO: /* It is likely that the GC passed us a pointer to a free-list element
--       which we must ignore (see warning in `gc/gc_mark.h').  */
--       this is especially harmful in case we use the Tid to 
--       identify the type/kind

         -- mark the references in this object
         wa := live_type.writable_attributes
         if wa /= Void then
            from
               i := wa.lower
            until
               i > wa.upper
            loop
               a := wa.item(i)
               t := a.result_type.resolve_in(live_type.type)
               if t.is_reference then
                  -- mark this attribute
                  cpp.pending_c_function_body.append(once "mark_data.mark_stack_ptr = GC_mark_and_push((&(C)->_")
                  cpp.pending_c_function_body.append(wa.item(i).name.to_string)
                  cpp.pending_c_function_body.append(once "), mark_data.mark_stack_ptr, mark_data.mark_stack_limit, NULL);%N")
               else
                  -- TODO: mark also elements in expanded types (this 
                  -- is common with BDW_GC.mark_item
               end
               i := i + 1
            end
         end

         -- now mark the native arrays by calling the eiffel feature
         cpp.pending_c_function_body.extend('r')
         live_type.id.append_in(cpp.pending_c_function_body)

         cpp.pending_c_function_body.append(once "mark_native_arrays(")
         if not ace.boost then
            -- Hope there is no bug in `mark_native_arrays'...
            cpp.pending_c_function_body.append(once "NULL,")
         end
         if ace.profile then
            cpp.pending_c_function_body.append(once "NULL,")
         end
         cpp.pending_c_function_body.append(once "C, &mark_data);%N")
         cpp.pending_c_function_body.append(once "return mark_data.mark_stack_ptr;%N")
            
         cpp.dump_pending_c_function(True)
      end

invariant
   bdw /= Void

end -- class BDW_GC_DEFINE2
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- Liberty Eiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with Liberty Eiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 2011-2015: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
--
-- http://www.gnu.org/software/liberty-eiffel/
--
--
-- Liberty Eiffel is based on SmartEiffel (Copyrights below)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
