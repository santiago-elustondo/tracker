note
	description: "Summary description for {T_TRACKER_ACTION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	T_TRACKER_ACTION

inherit
	ACTION [T_TRACKER]

feature
	error: ERROR_HANDLING

feature -- mem

	prev_error: STRING
	exec_error: STRING
	container: detachable T_CONTAINER
	phase: detachable T_PHASE

	prev_state_id: INTEGER
	old_state: BOOLEAN

feature --setters
	set_error(err: STRING)
		do
			exec_error := err
			target.set_error(exec_error)
		end

	set_default_error
		do
			prev_error := ""
			exec_error := ""
		end

	-- this is a query
	action_success: BOOLEAN
		do
			result := exec_error ~ error.err_ok
		end

	apply
    	do
    		target.increment_num_actions
			if not fresh_state then
				prev_state_id := target.current_state_id
			end
			target.set_current_state_id(target.current_num_actions)
		end

	undo
		do
			target.increment_num_actions
			target.set_current_state_id(prev_state_id)
		end

	set_prev_error
		do
			if target.get_history.has_past then
				prev_error := target.get_history.peek.exec_error
			else
				prev_error := error.err_ok
			end
		end

end
