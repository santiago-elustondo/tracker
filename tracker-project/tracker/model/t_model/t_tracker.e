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
	make, reset

feature

	max_phase_rad: VALUE
	max_container_rad: VALUE
	phases: STRING_TABLE[T_PHASE]
	error: STRING

	current_num_actions: INTEGER;
	current_state_id: INTEGER;

feature{NONE} -- Initialization

	make
		do
			precursor
			create phases.make (10)
			error := {ERROR_HANDLING}.err_ok
			current_num_actions := 0;
			current_state_id := 0;
		end

feature -- commands

	reset
		do
			make
		end

	wipe_out(a_max_phase_rad: VALUE; a_max_container_rad: VALUE)
		require
			tracker_not_in_use : not tracker_in_use
			max_phase_rad_is_positive: not (max_phase_rad < 0.0)
    		max_container_rad_is_positive: not (max_container_rad < 0.0)
			max_phase_rad_is_not_smaller_than_max_container_rad: not (max_container_rad > max_phase_rad)
		do
			max_phase_rad := a_max_phase_rad
			max_container_rad := a_max_container_rad
		end

	add_phase(a_phase: T_PHASE)
		require
			tracker_not_in_use : not tracker_in_use
			pid_is_valid: not a_phase.get_pid.is_empty and then a_phase.get_pid[1].is_alpha_numeric
			name_is_valid: not a_phase.get_name.is_empty and then a_phase.get_name[1].is_alpha_numeric
			phase_not_exists: not has_phase (a_phase.get_pid)
			capacity_not_negative: not (a_phase.get_capacity <= 0)
			materials_expected: not (a_phase.get_materials.get_count = 0)
		do
			phases.put(a_phase, a_phase.get_pid)
		ensure
			phase_exists: has_phase(a_phase.get_pid)
		end

	remove_phase(a_pid: STRING)
		require
			phase_exists: has_phase(a_pid)
			tracker_not_in_use : not tracker_in_use
		do
			phases.remove(a_pid)
		ensure
			phase_no_longer_exists: not has_phase(a_pid)
		end

	set_error(a_error: STRING)
		do
			error := a_error
		ensure
			error = a_error
		end

	set_current_state_id(a_id: INTEGER)
		do
			current_state_id := a_id
		ensure
			current_state_id = a_id
		end

	increment_num_actions
		do
			current_num_actions := current_num_actions + 1
		ensure
			current_num_actions = old current_num_actions + 1
		end


feature -- queries

	tracker_in_use: BOOLEAN
		do
			Result := across phases as p some
				p.item.get_count /= 0
			end
		ensure
			phases = old phases
		end

	get_current_num_actions: INTEGER
		do
			Result := current_num_actions
		ensure
			current_num_actions = old current_num_actions
		end

	get_current_state_id: INTEGER
		do
			Result := current_state_id
		ensure
			current_state_id = old current_state_id
		end

	get_error: STRING
		do
			Result := error
		ensure
			error = old error
		end

	get_max_phase_rad: VALUE
		do
			Result := max_phase_rad
		ensure
			max_phase_rad = old max_phase_rad
		end

	get_max_container_rad: VALUE
		do
			Result := max_container_rad
		ensure
			max_container_rad = old max_container_rad
		end

	get_phase_rad_exceeded(pid: STRING; rad: VALUE) : BOOLEAN
		do
			Result := (get_phase(pid).get_radiation + rad) > get_max_phase_rad
		ensure
			get_phase(pid).get_radiation = old get_phase(pid).get_radiation
			max_phase_rad = old max_phase_rad
		end

	get_container_rad_exceeded(rad: VALUE) : BOOLEAN
		do
			Result := rad > get_max_container_rad
		ensure
			max_container_rad = old max_container_rad
		end

	has_phase(pid: STRING): BOOLEAN
		require
			pid_is_not_empty: not pid.is_empty
			pis_starts_with_letter_or_number: pid.at(1).is_alpha_numeric
		do
			Result := phases.has(pid)
		ensure
			phases = old phases
		end

	get_phase(pid: STRING): T_PHASE
		require
			pid_exists: current.has_phase(pid)
		do
			check attached phases.item(pid) as p then
				Result := p
			end
		end

	has_container(cid: STRING): BOOLEAN
		require
			cid_is_valid: not cid.is_empty and then cid[1].is_alpha_numeric
		do
			Result := across phases as p some
				p.item.has_container(cid)
			end
		end

	find_container(cid: STRING) : detachable T_PHASE
		require
			cid_is_valid: not cid.is_empty and then cid[1].is_alpha_numeric
		do
			across phases as p loop
				if p.item.has_container(cid) then
					Result := p.item
				end
			end
		end


feature -- print

	print_old_state : BOOLEAN
		do
			Result := (get_current_state_id /= get_current_num_actions)
				and then (error /= {ERROR_HANDLING}.err_undo)
				and then (error /= {ERROR_HANDLING}.err_redo)
		end

	print_tracker: STRING
		do
			Create Result.make_from_string("%N  max_phase_radiation: ")
			Result.append (get_max_phase_rad.out)
			Result.append (", max_container_radiation: ")
			Result.append (get_max_container_rad.out)
			Result.append ("%N  phases: pid->name:capacity,count,radiation")
			Result.append (print_phases)
			Result.append ("%N  containers: cid->pid->material,radioactivity")
			Result.append (print_containers)
		end

	print_state : STRING -- this method needs to be replaced
		do
			Create Result.make_from_string ("  state ")
			Result.append (get_current_num_actions.out)
			if print_old_state then
				Result.append(" (to ")
				Result.append(current_state_id.out)
				Result.append(")")
			end
			Result.append (" ")
		end

	print_phases : STRING
		local
			ph: SORTED_TWO_WAY_LIST[T_PHASE]
		do
			Create ph.make
			Create Result.make_empty
			across phases as p loop
				ph.extend(p.item)
			end
			across ph as p loop
				Result.append("%N"+p.item.print_phase)
			end
		end

	print_containers : STRING
		local
			con : SORTED_TWO_WAY_LIST[T_CONTAINER]
		do
			Create con.make
			Create Result.make_empty
			across phases as p loop
				across p.item.get_containers as c loop
					con.extend (c.item)
				end
			end
			across con as c loop
				Result.append("%N"+c.item.print_container)
			end
		end

	out : STRING
		do
			create Result.make_from_string ("")
			Result.append (print_state + error)
			if (error ~ {ERROR_HANDLING}.err_ok) then
				Result.append (print_tracker)
			end
		end

end
