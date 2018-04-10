note
	description: "Summary description for {ACTION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

--   An ACTION class describes an model operation that updates the model state.
--   Each ACTION should define its do/undo behaviour in their `apply` and `undo` methods,
--      which will be called by HISTORICAL at the appropriate times.
--   Configurations queries `remember` and `clear_history` provide special historical behaviour
deferred class
	ACTION[TARGET_MODEL]

feature --private
	target: TARGET_MODEL

feature{HISTORICAL}
	set_target(a_target: TARGET_MODEL)
		do target := a_target end

	-- [configuration query]
	-- if `clear_history` returns true, then all history prior to
	--   this action will be cleared after this action has been taken.
	clear_history:BOOLEAN
		deferred end

	-- [configuration query]
	-- if `remember` returns false, then this action will not be
	--   saved to history
	remember: BOOLEAN
		deferred end

	-- this method will be called when action is submitted for execution,
	--   and also in the case of `redo`	
	apply
		deferred end

	-- this method will be called when action undo is requested
	undo
		deferred end

end
