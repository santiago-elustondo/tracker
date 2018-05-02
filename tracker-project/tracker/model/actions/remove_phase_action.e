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
		do
			set_target(a_target)
			pid := a_pid
			if target.has_phase (pid) then
				phase_name := target.get_phase (pid).get_name
				capacity := target.get_phase (pid).get_capacity
				expected_materials := target.get_phase (pid).get_materials.as_integer_array
			end
			set_default_error
		end

feature{NONE} -- params

	pid: STRING
	phase_name: detachable STRING
	capacity: INTEGER_64
	expected_materials: detachable ARRAY[INTEGER_64]

feature

	clear_history:BOOLEAN = FALSE
	remember: BOOLEAN = TRUE

	apply
    	do
    		precursor
    		if target.tracker_in_use then
    			set_error(error.err_tracker_in_use)
			elseif not target.get_phases.has (pid) then
				set_error(error.err_phase_id_not_exists)
			else
				set_error(error.err_ok)
				target.remove_phase (pid)
    		end
    	end

	undo
		do
			if action_success then
				if (attached phase_name as pn) and (attached expected_materials as em) then
					target.add_phase(create {T_PHASE}.make(
						pid,
						pn,
						capacity,
						em
					))
				end
			end
			precursor
		end

end
