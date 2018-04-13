note
	description: "A default business model."
	author: "Jackie Wang"
	date: "$Date$"
	revision: "$Revision$"

-- this is the Tracker application's central state repository.
-- it conforms to the perscribed access pattern of `historical_lib`,
--    in order to leverage it's undo/redo functionality.
class
	T_TRACKER


inherit
	HISTORICAL[T_TRACKER_ACTION]
		redefine
			make,
			out,
			is_equal
		end


create { ANY }
	make, reset

feature { NONE } -- state

	error: STRING
	max_phase_rad: VALUE
	max_container_rad: VALUE
	phases: STRING_TABLE[T_PHASE]

	current_num_actions: INTEGER;
	current_state_id: INTEGER;

feature{ NONE } -- Initialization

	make
		do
			precursor
			create phases.make (10)
			phases.compare_objects
			error := {ERROR_HANDLING}.err_ok
			current_num_actions := 0;
			current_state_id := 0;
		end

feature { ETF_MODEL_FACADE }-- commands

	-- this feature needs to be available to
	-- the class that instantiates T_TRACKER
	reset
		do
			make
		end

feature { T_TRACKER_ACTION, T_TRACKER } -- commands

	new_tracker(a_max_phase_rad: VALUE; a_max_container_rad: VALUE)
		require
			tracker_not_in_use : not tracker_in_use
			max_phase_rad_is_positive: not (get_max_phase_rad < 0.0)
    		max_container_rad_is_positive: not (get_max_container_rad < 0.0)
			max_phase_rad_is_not_smaller_than_max_container_rad: not (get_max_container_rad > get_max_phase_rad)
		do
			max_phase_rad := a_max_phase_rad
			max_container_rad := a_max_container_rad
		ensure
			phases_unchanged: phases ~ old get_phases.deep_twin
		end

	add_phase(a_phase: T_PHASE)
		require
			tracker_not_in_use : not tracker_in_use
			pid_is_valid: not a_phase.get_pid.is_empty and then a_phase.get_pid[1].is_alpha_numeric
			name_is_valid: not a_phase.get_name.is_empty and then a_phase.get_name[1].is_alpha_numeric
			phase_not_exists: not get_phases.has (a_phase.get_pid)
			capacity_not_negative: not (a_phase.get_capacity <= 0)
			materials_expected: not (a_phase.get_materials.count = 0)
		do
			phases.put(a_phase, a_phase.get_pid)
		ensure
			phase_exists: get_phases.has(a_phase.get_pid)
			phases_count_increased: get_phases.count = old get_phases.count + 1
			phase_added: current ~ (old current.deep_twin) |-> (a_phase)
		end

	remove_phase(a_pid: STRING)
		require
			phase_exists: get_phases.has(a_pid)
			tracker_not_in_use : not tracker_in_use
		do
			phases.remove(a_pid)
		ensure
			phase_no_longer_exists: not get_phases.has(a_pid)
			phases_count_decreased: get_phases.count = old get_phases.count - 1
			phase_removed: current ~ (old current.deep_twin) |-/> (a_pid)
		end

	move_container(a_container: T_CONTAINER; a_pid1, a_pid2: STRING)
		require
			container_doesnt_exist: get_phase(a_pid1).get_containers.has (a_container.get_cid)
			cid_is_valid: not a_container.get_cid.is_empty and then a_container.get_cid[1].is_alpha_numeric
			radioactivity_non_negative: not (a_container.get_props.radioactivity < 0.0)
			max_capacity_not_exceeded: not get_phase(a_pid2).max_capacity
			material_expected: get_phase(a_pid2).get_materials.material_expected (a_container.get_props.material.get_mid)
			has_container: get_phase(a_pid1).get_containers.has_item (a_container)
		do
			a_container.set_pid (a_pid2)
			get_phase(a_pid1).get_containers.remove (a_container.get_cid)
			get_phase(a_pid2).get_containers.put (a_container, a_container.get_cid)
		ensure
			phase_moved: (get_phase(a_pid2) ~ (old get_phase(a_pid2).deep_twin) |-> (a_container))
				and (get_phase(a_pid1) ~ (old get_phase(a_pid1).deep_twin) |-/> (a_container.get_cid))
			container_moved_to_new: get_phase(a_pid2).get_containers.has(a_container.get_cid)
			container_removed_from_old: not get_phase(a_pid1).get_containers.has(a_container.get_cid)
			container_count_increased_new: get_phase(a_pid2).get_containers.count = old get_phase(a_pid2).get_containers.count + 1
			container_count_increased_old: get_phase(a_pid1).get_containers.count = old get_phase(a_pid1).get_containers.count - 1
			container_has_correct_pid: get_phase(a_pid2).get_container(a_container.get_cid).get_pid ~ a_pid2
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

feature{T_TRACKER}
	phases_added alias "|->"(a_phase: T_PHASE): like current
		do
			Result := current.deep_twin
			Result.add_phase(a_phase)
		end

	phase_removed alias "|-/>"(a_pid: STRING): like current
		do
			Result := current.deep_twin
			Result.remove_phase(a_pid)
		end

--	container_move aliad |

feature -- public queries

	tracker_in_use: BOOLEAN
		do
			Result := across phases as p some
				p.item.get_containers.count /= 0
			end
		ensure
			result = across phases as p some
				p.item.get_containers.count /= 0
			end
		end

	get_current_num_actions: INTEGER
		do
			Result := current_num_actions
		ensure
			result = current_num_actions
		end

	get_current_state_id: INTEGER
		do
			Result := current_state_id
		ensure
			result = current_state_id
		end

	get_error: STRING
		do
			Result := error
		ensure
			result = error
		end

	get_max_phase_rad: VALUE
		do
			Result := max_phase_rad
		ensure
			result = max_phase_rad
		end

	get_max_container_rad: VALUE
		do
			Result := max_container_rad
		ensure
			result = max_container_rad
		end

	get_phase_rad_exceeded(pid: STRING; rad: VALUE) : BOOLEAN
		do
			Result := (get_phase(pid).get_radiation + rad) > get_max_phase_rad
		ensure
			get_phase(pid).get_radiation = old get_phase(pid).get_radiation
			result = ((get_phase(pid).get_radiation + rad) > get_max_phase_rad)
		end

	get_container_rad_exceeded(rad: VALUE) : BOOLEAN
		do
			Result := rad > get_max_container_rad
		ensure
			result = (rad > max_container_rad)
		end

	get_phase(pid: STRING): T_PHASE
		require
			pid_exists: get_phases.has(pid)
		do
			check attached phases.item(pid) as p then
				Result := p
			end
		end

	get_phases : STRING_TABLE[T_PHASE]
		do
			Result := phases
		ensure
			result = phases
		end

	find_container(cid: STRING) : detachable T_PHASE
		do
			across phases as p loop
				if p.item.get_containers.has (cid) then
					Result := p.item
				end
			end
		end

	is_equal (other: like current): BOOLEAN
		do
			if current = other then
				Result := true
			elseif current_num_actions /= other.get_current_num_actions then
				Result := false
			elseif current_state_id /= other.get_current_state_id then
				Result := false
			elseif error /~ other.get_error then
				Result := false
			elseif max_phase_rad /= other.get_max_phase_rad then
				Result := false
			elseif max_container_rad /= other.get_max_container_rad then
				Result := false
			elseif phases /~ other.get_phases then
				Result := false
			else
				Result := true
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

	print_state : STRING
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
invariant
	capacity_not_exceeded: across get_phases as p all p.item.get_containers.count <= p.item.get_capacity end
	phase_rad_not_exceeded: across get_phases as p all p.item.get_radiation <= get_max_phase_rad end
	con_rad_not_exceeded: across get_phases as p all (across p.item.get_containers as c all not get_container_rad_exceeded (c.item.get_props.radioactivity) end) end
end
