note
	description: "Summary description for {NEW_PHASE_ACTION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	NEW_PHASE_ACTION

inherit
	T_TRACKER_ACTION
		redefine apply, undo end

create
	make

feature{NONE} -- Initialization

	make(
		a_target: T_TRACKER;
		a_pid: STRING;
		a_phase_name: STRING;
		a_capacity: INTEGER;
	    a_expected_materials: ARRAY[INTEGER_64]
	)
		do
			set_target(a_target)
			pid := a_pid
			phase_name := a_phase_name
			capacity := a_capacity
			expected_materials := a_expected_materials
			set_default_error
		end


feature{NONE} -- params

	pid: STRING
	phase_name: STRING
	capacity: INTEGER
	expected_materials: ARRAY[INTEGER_64]

feature -- commands

	clear_history:BOOLEAN = FALSE
	remember: BOOLEAN = TRUE

	apply
    	do
    		precursor
    		if target.tracker_in_use then
    			set_error(error.err_tracker_in_use)
    		elseif (pid.is_empty) or else not pid [1].is_alpha_numeric then
    			set_error(error.err_name_start)
    		elseif target.get_phases.has (pid) then
    			set_error(error.err_phase_id_exists)
    		elseif (phase_name.is_empty) or else not phase_name [1].is_alpha_numeric then
    			set_error(error.err_name_start)
	   		elseif capacity <= 0 then
				set_error(error.err_phase_cap_negative)
			elseif expected_materials.count = 0 then
				set_error(error.err_phase_no_materials)
    		else
    			set_error(error.err_ok)
				target.add_phase(create {T_PHASE}.make(
					pid,
					phase_name,
					capacity,
					expected_materials
				))
				end
    	end

	undo
		do
			if action_success then
				target.remove_phase(pid)
			end
			precursor
		end

end
