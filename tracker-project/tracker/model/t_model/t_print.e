note
	description: "Summary description for {T_PRINT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	T_PRINT

inherit
	T_VISITOR
		redefine is_equal end

create
	make

feature{ANY}
	string: STRING

feature{NONE}
	make
		do
			string := ""
		end

feature
	visit_phase(phase: T_PHASE)
		do
			string.append("%N    ")
			string.append (phase.get_pid)
			string.append ("->")
			string.append (phase.get_name + ":")
			string.append (phase.get_capacity.out + ",")
			string.append (phase.get_containers.count.out + ",")
			string.append (phase.get_radiation.out + ",")
			phase.get_materials.do_print (current)
		end

	visit_container(con: T_CONTAINER)
		do
			string.append("%N    ")
			string.append (con.get_cid)
			string.append ("->")
			string.append (con.get_pid)
			string.append ("->")
			string.append (con.get_props.material.get_name + ",")
			string.append (con.get_props.radioactivity.out)
		end

	visit_materials(mat: T_MATERIAL_SET)
		do
			string.append ("{")
			across 1 |..| (mat.count - 1) as i loop
				string.append(mat[i.item].get_name+ ",")
			end
			string.append (mat[mat.count].get_name+ "}")
		end

	visit_tracker(tracker: T_TRACKER)
		do
			create string.make_empty
			tracker_helper_print_state(tracker)
			if (tracker.get_error ~ {ERROR_HANDLING}.err_ok) then
				tracker_helper_main(tracker)
			end
		end

feature{NONE} --helper methods

	tracker_helper_main(tracker: T_TRACKER)
		do
			string.append("%N  max_phase_radiation: ")
			string.append (tracker.get_max_phase_rad.out)
			string.append (", max_container_radiation: ")
			string.append (tracker.get_max_container_rad.out)
			string.append ("%N  phases: pid->name:capacity,count,radiation")
			tracker_helper_phases(tracker.get_phases)
			string.append ("%N  containers: cid->pid->material,radioactivity")
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
				p.item.do_print (current)
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
				c.item.do_print (current)
			end
		end

	tracker_helper_print_state(tracker: T_TRACKER)
		do
			string.append ("  state ")
			string.append (tracker.get_current_num_actions.out)
			if tracker.print_old_state then
				string.append(" (to ")
				string.append(tracker.get_current_state_id.out)
				string.append(")")
			end
			string.append (" "+tracker.get_error)
		end

	is_equal (other: like current): BOOLEAN
		do
			Result := string ~ other.string
		end
end
