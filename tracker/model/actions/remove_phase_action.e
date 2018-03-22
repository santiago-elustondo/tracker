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

	pid: STRING


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
			set_default_error
			if attached target.get_phase (a_pid) as p then
				phase := p
			end
		end

	apply
    	do
    		prev_error := target.error
    		if target.tracker_in_use then
    			set_error(error.err_tracker_in_use)
			elseif not target.has_phase (pid) then
				set_error(error.err_phase_id_not_exists)
			else
				set_error(error.err_ok)
				target.remove_phase (pid)
    		end
    	end

	undo
		do
			if (exec_error ~ error.err_ok) then
				if attached phase as p then
					target.add_phase (p)
				end
			end
			target.set_error (prev_error)
		end

end
