note
	description: "Summary description for {T_TRACKER_ACTION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"


-- this is the deferred parent class for all the tracker ACTIONS
-- it contains TRACKER-specific behaviour and utilitis shared by all TRACKER actions
-- TRACKER commands are accessible only to classes inheriting from T_TRACKER_ACTION,
--   as the HISTORICAL pattern prescribes.
deferred class
	T_TRACKER_ACTION

inherit
	ACTION [T_TRACKER]
		redefine is_equal end

feature { HISTORICAL } -- commands

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

feature { T_TRACKER_ACTION } -- private state

	-- these variables exist to remember things about the action taken.
	-- tracker requirements necessitate certain specific behaviour when doing undo/redo
	error: ERROR_HANDLING
	prev_error: STRING
	exec_error: STRING
	container: detachable T_CONTAINER
	phase: detachable T_PHASE
	prev_state_id: INTEGER
	post_state_id: INTEGER

feature { T_TRACKER_ACTION } -- private queries

	action_success: BOOLEAN
		do
			result := exec_error ~ error.err_ok
		end

	get_exec_error: STRING
		do
			result := exec_error
		end

	is_equal(other: like current): BOOLEAN
		do
			Result := current = other
			or else prev_state_id = other.prev_state_id
			and then post_state_id = other.post_state_id
			and then exec_error ~ other.exec_error
			and then prev_error ~ other.prev_error
			and then container ~ other.container
			and then phase ~ other.phase
		end


feature { NONE } -- private commands

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

	set_prev_error
		do
			if target.get_history.has_past then
				prev_error := target.get_history.get_element.get_exec_error
			else
				prev_error := error.err_ok
			end
		end

invariant
	prev_state_not_beyond_model: prev_state_id <= target.get_current_num_actions
	future_implies_not_last: target.get_history.has_future implies (prev_state_id < target.get_current_num_actions)
	past_implies_not_first: target.get_history.has_past implies (0 < target.get_current_num_actions)
end
