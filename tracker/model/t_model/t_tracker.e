note
	description: "A default business model."
	author: "Jackie Wang"
	date: "$Date$"
	revision: "$Revision$"

class
	T_TRACKER


inherit
	HISTORICAL[T_TRACKER_ACTION]
		redefine
			make,
			out
		end

create {T_TRACKER_ACCESS}
	make


feature

	max_phase_rad: VALUE
	max_container_rad: VALUE
	phases: STRING_TABLE[T_PHASE]
	error: STRING
	state: INTEGER

	current_num_actions: INTEGER;
	current_state_id: INTEGER;
	next_state_id: INTEGER;

feature -- commands

	make
		do
			precursor
			create phases.make (10)
			error := "ok"
			current_num_actions := 0;
			current_state_id := 0;
		end

	reset
		do
			make
		end

	wipe_out(a_max_phase_rad: VALUE; a_max_container_rad: VALUE)
		do
			make
			max_phase_rad := a_max_phase_rad
			max_container_rad := a_max_container_rad
		end

	add_phase(a_phase: T_PHASE)
		do
			phases.put(a_phase, a_phase.get_pid)
		end

	remove_phase(a_pid: STRING)
		do
			phases.remove(a_pid)
		end

	set_error(a_error: STRING)
		do
			error := a_error
		end

	set_current_state_id(a_id: INTEGER)
		do
			current_state_id := a_id
		end

	set_next_state_id(a_id: INTEGER)
		do
			next_state_id := a_id
		end

	increment_num_actions
		do
			current_num_actions := current_num_actions + 1
		end


feature -- queries

	tracker_in_use: BOOLEAN
		do
			Result := across phases as p some
				p.item.get_count /= 0
			end
		end

	get_error: STRING
		do
			Result := error
		end

	get_state: INTEGER
		do
			Result := state
		end

	get_max_phase_rad: VALUE
		do
			Result := max_phase_rad
		end

	get_max_container_rad: VALUE
		do
			Result := max_container_rad
		end

	has_phase(pid: STRING): BOOLEAN
		do
			Result := phases.has (pid)
		end

	get_phase(pid: STRING): T_PHASE
		do
			check attached phases.item (pid) as p then
				Result := p
			end
		end

	has_container(cid: STRING): BOOLEAN
		do
			Result := across phases as p some
				p.item.has_container (cid)
			end
		end

	find_container(cid: STRING) : detachable T_PHASE
		do
			across phases as p loop
				if p.item.has_container (cid) then
					Result := p.item
				end
			end
		end

	print_tracker: STRING
		do
			Create Result.make_from_string("  max_phase_radiation: ")
			Result.append_double (get_max_phase_rad.as_double)
			Result.append (", max_container_radiation: ")
			Result.append_double (get_max_container_rad.as_double)
		end

	print_state : STRING
		do
			Create Result.make_from_string ("  state ")
			Result.append_integer (get_state)
			if get_state /= (get_history.get_cursor) then
				Result.append(" (to ")
				Result.append_integer(get_history.get_cursor)
				Result.append(")")
			end
			Result.append (" ")
			state := state + 1
		end

	sort_phases : SORTED_TWO_WAY_LIST[T_PHASE]
		do
			Create Result.make
			across phases as p loop
				Result.extend(p.item)
			end
		end

	sort_containers : SORTED_TWO_WAY_LIST[T_CONTAINER]
		do
			Create Result.make
			across phases as p loop
				across p.item.get_containers as c loop
					Result.extend(c.item)
				end
			end
		end

	out : STRING
		do
			create Result.make_from_string ("")
			Result.append (print_state + error+"%N")
			Result.append (print_tracker+"%N")
			Result.append ("  phases: pid->name:capacity,count,radiation%N")
			across sort_phases as p loop
				Result.append(p.item.print_phase+"%N")
			end
			Result.append ("  containers: cid->pid->material,radioactivity%N")
			across sort_containers as c loop
				Result.append(c.item.print_container+"%N")
			end
		end

end
