note
	description: "Summary description for {NEW_PHASE_ACTION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	REMOVE_PHASE_ACTION

inherit
	T_TRACKER_ACTION
		redefine apply, undo end

create
	make

feature{NONE} -- Initialization

	make(
		a_target: T_TRACKER;
		a_pid: STRING;
	)
		local
			ph: T_PHASE
		do
			set_target(a_target)
			ph := target.get_phase (a_pid)
			pid := a_pid
			phase_name := ph.get_name
			capacity := ph.get_capacity
			expected_materials := ph.get_materials.to_array
			set_default_error
		end

feature{NONE} -- params

	pid: STRING
	phase_name: STRING
	capacity: INTEGER_64
	expected_materials: ARRAY[INTEGER_64]

feature

	clear_history:BOOLEAN = FALSE
	remember: BOOLEAN = TRUE

	apply
    	do
    		precursor
    		if target.tracker_in_use then
    			set_error(error.err_tracker_in_use)
			elseif not target.has_phase (pid) then
				set_error(error.err_phase_id_not_exists)
			else
				set_error(error.err_ok)
--				phase := target.get_phase (pid)
				target.remove_phase (pid)
    		end
    	end

	undo
		do
--			if action_success then
--				if attached phase as p then
--					target.add_phase (p)
--				end
--			end
			if action_success then
				target.add_phase(create {T_PHASE}.make(
					pid,
					phase_name,
					capacity,
					expected_materials
				))
			end
			precursor
		end

end
