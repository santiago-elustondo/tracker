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
	post_state_id: INTEGER

feature --setters
	set_error(err: STRING)
		do
			exec_error := err
			target.set_error(exec_error)
		end

	set_default_error
		do
			prev_error := error.err_ok
			exec_error := error.err_ok
		end

	-- this is a query
	action_success: BOOLEAN
		do
			result := exec_error ~ error.err_ok
		end

	apply
    	do
    		target.increment_num_actions
    		set_prev_error
			if post_state_id = 0 then
				prev_state_id := target.get_current_state_id
				post_state_id := target.get_current_num_actions
			end
			target.set_current_state_id(post_state_id)
		end

	undo
		do
			target.increment_num_actions
			target.set_current_state_id(prev_state_id)
			set_error (prev_error)
		end

	set_prev_error
		do
			if target.get_history.has_past then
				prev_error := target.get_history.get_element.exec_error
			else
				prev_error := error.err_ok
			end
		end

end
