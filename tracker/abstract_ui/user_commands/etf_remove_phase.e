note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_REMOVE_PHASE
inherit
	ETF_REMOVE_PHASE_INTERFACE
		redefine remove_phase end
create
	make
feature -- command
	remove_phase(pid: STRING)
		require else
			remove_phase_precond(pid)
		local
			e: STRING
    	do
    		if model.tracker_in_use then
    			e := error.err_tracker_in_use
			elseif not model.has_phase (pid) then
				e := error.err_phase_id_not_exists
			else
				e := error.ok
				model.default_update
    		end
			etf_cmd_container.on_change.notify ([Current])
    	end

end
