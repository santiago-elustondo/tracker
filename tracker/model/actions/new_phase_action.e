note
	description: "Summary description for {NEW_PHASE_ACTION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	NEW_PHASE_ACTION

inherit
	T_TRACKER_ACTION

create
	make

feature -- params

	pid: STRING;
	phase_name: STRING;
	capacity: INTEGER_64;
	expected_materials: ARRAY[INTEGER_64];

feature

	clear_history:BOOLEAN = false
	remember: BOOLEAN = true

	make(
		a_target: T_TRACKER;
		a_pid: STRING;
		a_phase_name: STRING;
		a_capacity: INTEGER_64;
		a_expected_materials: ARRAY[INTEGER_64]
	)
		do
			set_target(a_target)
			pid := a_pid
			phase_name := a_phase_name
			capacity := a_capacity
			expected_materials := a_expected_materials
		end

	apply
    	local
			e: STRING
    	do
    		if target.tracker_in_use then
    			e := error.err_tracker_in_use
    		elseif not pid [1].is_alpha_numeric then
    			e := error.err_name_start
    		elseif target.has_phase (pid) then
    			e := error.err_phase_id_exists
    		elseif not phase_name [1].is_alpha_numeric then
    			e := error.err_name_start
	   		elseif target.get_phase(pid).get_capacity <= 0 then
				e := error.err_phase_cap_negative
			elseif expected_materials.count = 0 then
				e := error.err_phase_no_materials
    		else
    			e := error.err_ok
				target.default_update
			end
    	end

	undo
		do end

end
