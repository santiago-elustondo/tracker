note
	description: "The Tracker central state model"
	author: "Josh Phillip & Santiago Elustondo"
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

feature -- model

	model: FUN[STRING, T_PHASE]
			-- abstraction function
		do
			create Result.make_empty
			across phases as p loop
				Result.extend([p.item.get_pid, p.item])
			end
		ensure
			model.is_function
		end

feature -- commands

	new_tracker(a_max_phase_rad: VALUE; a_max_container_rad: VALUE)
			-- creates a new tracker with `a_max_phase_rad' and `a_max_container_rad'
		require
			tracker_not_in_use : not tracker_in_use
			max_phase_rad_is_positive: not (a_max_phase_rad < 0.0)
    		max_container_rad_is_positive: not (a_max_container_rad < 0.0)
			max_phase_rad_is_not_smaller_than_max_container_rad: not (a_max_container_rad > a_max_phase_rad)
		do
			max_phase_rad := a_max_phase_rad
			max_container_rad := a_max_container_rad
		ensure
			model_unchanged: model ~ old model.deep_twin
--			phases_unchanged: phases ~ old get_phases.deep_twin
		end

	add_phase(a_phase: T_PHASE)
			-- adds `a_phase' to tracker
		require
			tracker_not_in_use : not tracker_in_use
			pid_is_valid: not a_phase.get_pid.is_empty and then a_phase.get_pid[1].is_alpha_numeric
			name_is_valid: not a_phase.get_name.is_empty and then a_phase.get_name[1].is_alpha_numeric
--			phase_not_exists: not get_phases.has (a_phase.get_pid)
			capacity_not_negative: not (a_phase.get_capacity <= 0)
			materials_expected: not (a_phase.get_materials.count = 0)
			phase_not_exists: not model.has ([a_phase.get_pid, a_phase])
		do
			phases.put(a_phase, a_phase.get_pid)
		ensure
--			phase_exists: get_phases.has(a_phase.get_pid)
--			phases_count_increased: get_phases.count = old get_phases.count + 1
--			phase_added: current ~ old current.deep_twin |-> (a_phase)
			phase_added: model ~ old model.deep_twin + [a_phase.get_pid, a_phase]
		end

	remove_phase(a_pid: STRING)
			-- removes phase associated with `a_pid' from tracker
		require
--			phase_exists: get_phases.has(a_pid)
			tracker_not_in_use : not tracker_in_use
			phase_exists: model.has ([a_pid, model[a_pid]])
		do
			phases.remove(a_pid)
		ensure
--			phase_no_longer_exists: not get_phases.has(a_pid)
--			phases_count_decreased: get_phases.count = old get_phases.count - 1
--			phase_removed: current ~ old current.deep_twin |-/> (a_pid)
			phased_removed: model ~ old model.deep_twin - old [a_pid, get_phase(a_pid)]
		end

	move_container(a_container: T_CONTAINER; a_pid1, a_pid2: STRING)
			-- moves `a_container' from `a_pid1' to `a_pid2'
		require
			container_doesnt_exist: get_phase(a_pid1).get_containers.has (a_container.get_cid)
			cid_is_valid: not a_container.get_cid.is_empty and then a_container.get_cid[1].is_alpha_numeric
			radioactivity_non_negative: not (a_container.get_props.radioactivity < 0.0)
			max_capacity_not_exceeded: not get_phase(a_pid2).max_capacity
			phase_rad_not_exceeded: not get_phase_rad_exceeded (a_pid2, a_container.get_props.radioactivity)
			material_expected: get_phase(a_pid2).get_materials.material_expected (a_container.get_props.material.get_mid)
--			has_container: get_phase(a_pid1).get_containers.has_item (a_container)
			old_has_container: get_phase(a_pid1).model.has ([a_container.get_cid, a_container])
			new_not_has_container: not get_phase(a_pid2).model.has ([a_container.get_cid, a_container])
		do
			a_container.set_pid (a_pid2)
			get_phase(a_pid1).get_containers.remove (a_container.get_cid)
			get_phase(a_pid2).get_containers.put (a_container, a_container.get_cid)
		ensure
			container_removed_from_old: get_phase(a_pid1).model ~ old get_phase(a_pid1).model - [a_container.get_cid, a_container]
			container_added_to_new: get_phase(a_pid2).model ~ old get_phase(a_pid2).model + [a_container.get_cid, get_phase(a_pid2).get_container (a_container.get_cid)]
--			phase_moved: (get_phase(a_pid2) ~ old get_phase(a_pid2).deep_twin |-> (a_container))
--				and (get_phase(a_pid1) ~ old get_phase(a_pid1).deep_twin |-/> (a_container.get_cid))
--			container_moved_to_new: get_phase(a_pid2).get_containers.has(a_container.get_cid)
--			container_removed_from_old: not get_phase(a_pid1).get_containers.has(a_container.get_cid)
--			container_count_increased_new: get_phase(a_pid2).get_containers.count = old get_phase(a_pid2).get_containers.count + 1
--			container_count_increased_old: get_phase(a_pid1).get_containers.count = old get_phase(a_pid1).get_containers.count - 1
--			container_has_correct_pid: get_phase(a_pid2).get_container(a_container.get_cid).get_pid ~ a_pid2
		end

	set_error(a_error: STRING)
			-- sets error message
		do
			error := a_error
		ensure
			error = a_error
		end

	set_current_state_id(a_id: INTEGER)
			-- sets the id of the current state
		do
			current_state_id := a_id
		ensure
			current_state_id = a_id
		end

	increment_num_actions
			-- incremements the action counter
		do
			current_num_actions := current_num_actions + 1
		ensure
			current_num_actions = old current_num_actions + 1
		end

feature { NONE } -- state

	max_phase_rad: VALUE
	max_container_rad: VALUE
	phases: STRING_TABLE[T_PHASE]
	error: STRING

	current_num_actions: INTEGER;
	current_state_id: INTEGER;

feature -- public queries

	tracker_in_use: BOOLEAN
			-- returns whether tracker is in use
		do
			Result := across phases as p some
				p.item.get_containers.count /= 0
			end
		ensure
			-- result = ∀p( p ∈ phases -> p has a container )
			result = across phases as p some
				p.item.get_containers.count /= 0
			end
		end

	get_current_num_actions: INTEGER
			-- returns action counter
		do
			Result := current_num_actions
		ensure
			result = current_num_actions
		end

	get_current_state_id: INTEGER
			-- returns the current state id
		do
			Result := current_state_id
		ensure
			result = current_state_id
		end

	get_error: STRING
			-- returns the current error message
		do
			Result := error
		ensure
			result = error
		end

	get_max_phase_rad: VALUE
			-- returns the max radiation for phase
		do
			Result := max_phase_rad
		ensure
			result = max_phase_rad
		end

	get_max_container_rad: VALUE
			-- returns the max radiation per container
		do
			Result := max_container_rad
		ensure
			result = max_container_rad
		end

	get_phase_rad_exceeded(pid: STRING; rad: VALUE) : BOOLEAN
			-- returns whether max phase radiation is exceeded
		do
			Result := (get_phase(pid).get_radiation + rad) > get_max_phase_rad
		ensure
			get_phase(pid).get_radiation = old get_phase(pid).get_radiation
			result = ((get_phase(pid).get_radiation + rad) > get_max_phase_rad)
		end

	get_container_rad_exceeded(rad: VALUE) : BOOLEAN
			-- returns whether max container radiation is exceeded
		do
			Result := rad > get_max_container_rad
		ensure
			result = (rad > max_container_rad)
		end

	get_phase(pid: STRING): T_PHASE
			-- returns the phase associated with `pid'
		require
			pid_exists: model.domain.has (pid)
		do
			check attached phases.item(pid) as p then
				Result := p
			end
		ensure
			Result = model[pid]
		end

	get_phases : STRING_TABLE[T_PHASE]
			-- returns a list of phases
		do
			Result := phases
		ensure
			result = phases
		end

	has_phase(pid: STRING): BOOLEAN
			-- returns whether phase associated with `pid' exists
		do
			Result := phases.has (pid)
		ensure
			Result = model.domain.has (pid)
		end

	find_container(cid: STRING) : detachable T_PHASE
			-- returns the phase associated with `cid' if it exists
		do
			across phases as p loop
				if p.item.get_containers.has (cid) then
					Result := p.item
				end
			end
		ensure
			attached Result implies Result.model.domain.has (cid)
		end

	print_old_state : BOOLEAN
			-- prints the old state
		do
			Result := (get_current_state_id /= get_current_num_actions)
				and then (error /= {ERROR_HANDLING}.err_undo)
				and then (error /= {ERROR_HANDLING}.err_redo)
		end

	is_equal (other: like current): BOOLEAN
		do
			Result := current = other
			or else get_current_num_actions = other.get_current_num_actions
			and then get_current_state_id = other.get_current_state_id
			and then get_error ~ other.get_error
			and then get_max_phase_rad = other.get_max_phase_rad
			and then get_max_container_rad = other.get_max_container_rad
			and then get_phases ~ other.get_phases
		end


feature -- print

	do_visit(visitor: T_VISITOR)
		do
			visitor.visit_tracker (current)
		end

	out : STRING
		local
			printer: T_PRINT
		do
			create printer.make
			do_visit(printer)
			Result := printer.out
		end

invariant

	-- max_phase_rad >= max_container_rad >= 0
	max_phase_rad_not_smaller_than_max_container_rad: not (max_phase_rad < max_container_rad);
	max_rads_are_positive: not (max_container_rad < 0.0);

	-- current_num_actions >= current_state_id >= 0
	current_num_actions_not_smaller_than_current_state_id:
		not (current_num_actions < current_state_id);
	current_actions_and_state_id_are_not_negative:
		not (current_num_actions < 0);

	capacity_not_exceeded: across get_phases as p all p.item.get_containers.count <= p.item.get_capacity end
	phase_rad_not_exceeded: across get_phases as p all p.item.get_radiation <= get_max_phase_rad end
	con_rad_not_exceeded: across get_phases as p all
		across p.item.get_containers as c all not get_container_rad_exceeded(c.item.get_props.radioactivity) end
	end


end
