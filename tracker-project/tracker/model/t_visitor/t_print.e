note
	description: "Summary description for {T_PRINT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	T_PRINT

inherit
	T_VISITOR
		redefine
			is_equal,
			out
		end

create
	make

feature{ANY}
	out: STRING

feature{NONE}
	make
		do
			out := ""
		end

feature
	visit_phase(phase: T_PHASE)
			-- handles output for `phase'
		do
			out.append("%N    ")
			out.append (phase.get_pid)
			out.append ("->")
			out.append (phase.get_name + ":")
			out.append (phase.get_capacity.out + ",")
			out.append (phase.get_containers.count.out + ",")
			out.append (phase.get_radiation.out + ",")
			phase.get_materials.do_visit (current)
		end

	visit_container(con: T_CONTAINER)
			-- handles output for `con'
		do
			out.append("%N    ")
			out.append (con.get_cid)
			out.append ("->")
			out.append (con.get_pid)
			out.append ("->")
			out.append (con.get_props.material.get_name + ",")
			out.append (con.get_props.radioactivity.out)
		end

	visit_materials(mat: T_MATERIAL_SET)
			-- handles output for `mat'
		do
			out.append ("{")
			across 1 |..| (mat.count - 1) as i loop
				out.append(mat[i.item].get_name+ ",")
			end
			out.append (mat[mat.count].get_name+ "}")
		end

	visit_tracker(tracker: T_TRACKER)
			-- handled output for `tracker'
		do
			create out.make_empty
			tracker_helper_print_state(tracker)
			if (tracker.get_error ~ {ERROR_HANDLING}.err_ok) then
				tracker_helper_main(tracker)
			end
		end

feature{NONE} --helper methods

	tracker_helper_main(tracker: T_TRACKER)
		do
			out.append("%N  max_phase_radiation: ")
			out.append (tracker.get_max_phase_rad.out)
			out.append (", max_container_radiation: ")
			out.append (tracker.get_max_container_rad.out)
			out.append ("%N  phases: pid->name:capacity,count,radiation")
			tracker_helper_phases(tracker.get_phases)
			out.append ("%N  containers: cid->pid->material,radioactivity")
			tracker_helper_containers(tracker.get_phases)
		end

	tracker_helper_phases(phases: STRING_TABLE[T_PHASE])
		local
			ph: SORTED_TWO_WAY_LIST[T_PHASE]
		do
			Create ph.make
			across phases as p loop
				ph.extend(p.item)
			end
			across ph as p loop
				p.item.do_visit (current)
			end
		end

	tracker_helper_containers(phases: STRING_TABLE[T_PHASE])
		local
			con : SORTED_TWO_WAY_LIST[T_CONTAINER]
		do
			Create con.make
			across phases as p loop
				across p.item.get_containers as c loop
					con.extend (c.item)
				end
			end
			across con as c loop
				c.item.do_visit (current)
			end
		end

	tracker_helper_print_state(tracker: T_TRACKER)
		do
			out.append ("  state ")
			out.append (tracker.get_current_num_actions.out)
			if tracker.print_old_state then
				out.append(" (to ")
				out.append(tracker.get_current_state_id.out)
				out.append(")")
			end
			out.append (" "+tracker.get_error)
		end

	is_equal (other: like current): BOOLEAN
		do
			Result := out ~ other.out
		end
end
