note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_NEW_PHASE
inherit
	ETF_NEW_PHASE_INTERFACE
		redefine new_phase end
create
	make
feature -- command
	new_phase(pid: STRING ; phase_name: STRING ; capacity: INTEGER_64 ; expected_materials: ARRAY[INTEGER_64])
		require else
			new_phase_precond(pid, phase_name, capacity, expected_materials)
    	local
			e: STRING
    	do
    		if model.tracker_in_use then
    			e := error.err_tracker_in_use
    		elseif not pid [1].is_alpha_numeric then
    			e := error.err_name_start
    		elseif model.has_phase (pid) then
    			e := error.err_phase_id_exists
    		elseif not phase_name [1].is_alpha_numeric then
    			e := error.err_name_start
	   		elseif model.get_phase(pid).get_capacity <= 0 then
				e := error.err_phase_cap_negative
			elseif expected_materials.count = 0 then
				e := error.err_phase_no_materials
    		else
    			e := error.ok
				model.default_update
			end
			etf_cmd_container.on_change.notify ([Current])
    	end

end
