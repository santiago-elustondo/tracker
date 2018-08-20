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
    	do
    		model.do_action(create {NEW_PHASE_ACTION}.make(
    			model,
    			pid,
    			phase_name,
    			capacity.to_integer_32,
    			expected_materials
    		))
			etf_cmd_container.on_change.notify ([Current])
    	end

end
