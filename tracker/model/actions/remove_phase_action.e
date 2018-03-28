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

feature{NONE} -- Initialization

	make(
		a_target: T_TRACKER;
		a_pid: STRING;
	)
		do
			set_target(a_target)
			pid := a_pid
			set_default_error
		end

feature{NONE} -- params

	pid: STRING

feature

	clear_history:BOOLEAN = FALSE
	remember: BOOLEAN = TRUE

	apply
    	do
    		increment_num_actions
--    		prev_error := target.get_error
			prev_error := get_prev_error
    		if target.tracker_in_use then
    			set_error(error.err_tracker_in_use)
    			state_stay
			elseif not target.has_phase (pid) then
				set_error(error.err_phase_id_not_exists)
				state_stay
			else
				state_move
				set_error(error.err_ok)
				phase := target.get_phase (pid)
				target.remove_phase (pid)
    		end
    	end

	undo
		do
			increment_num_actions
			state_go_back
			if (exec_error ~ error.err_ok) then
				if attached phase as p then
					target.add_phase (p)
				end
			end
			target.set_error(prev_error)
		end

end
