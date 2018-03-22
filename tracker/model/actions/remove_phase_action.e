note
	description: "Summary description for {NEW_PHASE_ACTION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	REMOVE_PHASE_ACTION

inherit
	T_TRACKER_ACTION

create
	make

feature -- params

	pid: STRING;

feature

	clear_history:BOOLEAN = false
	remember: BOOLEAN = true

	make(
		a_target: T_TRACKER;
		a_pid: STRING;
	)
		do
			set_target(a_target)
			pid := a_pid
		end

	apply
    	local
			e: STRING
    	do
    		if target.tracker_in_use then
    			e := error.err_tracker_in_use
			elseif not target.has_phase (pid) then
				e := error.err_phase_id_not_exists
			else
				e := error.ok
				target.default_update
    		end
    	end

	undo
		do end

end
