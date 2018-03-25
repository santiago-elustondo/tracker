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

	pre_state_id: INTEGER
	post_state_id: INTEGER

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

	increment_num_actions
		do
			target.increment_num_actions
		end

	state_stay
		do
			if post_state_id = 0 then
				pre_state_id := target.current_state_id
				post_state_id := target.next_state_id
			end
			target.set_next_state_id(post_state_id + 1)
		end

	state_move
		do
			if post_state_id = 0 then
				pre_state_id := target.current_state_id
				post_state_id := target.next_state_id
			end
			target.set_current_state_id(post_state_id)
			target.set_next_state_id(post_state_id + 1)
		end

	state_go_back
		do
			target.set_current_state_id(pre_state_id)
			target.set_next_state_id(pre_state_id + 1)
		end

end
