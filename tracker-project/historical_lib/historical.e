note
	description: "Summary description for {HISTORICAL}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

-- this is an extendible class that will add historical support to a model class
--   as long as it conforms to the prescribed framework pattern
-- this class is not specifically designed for the tracker system and can be added to any
--   conforming eiffel class to give it undo/redo functionality
-- the pattern to be used by the client model is as follows:
--   - all model operations that update the model's state must be defined via
--       an action class that inherits from ACTION[TARGET_MODEL], where TARGET_MODEL
--       is the class entending HISTORICAL.
--   - all updates to the model state must be performed by calling the model's
--       `do_action` method (inherited from HISTORICAL), and passing the appropriate
--       ACTION, describing the operation. All model commands should be only accessible
--       to its ACTION classes.
deferred class
	HISTORICAL[ACTION_TYPE -> ACTION[ANY]]

feature { NONE }
	history:HISTORY[ACTION_TYPE]

feature { NONE }

	make
		do
			init_history
		end

	init_history
		do
			create history.make
		end

feature { ACTION, ETF_COMMAND }

	do_action(action: ACTION_TYPE)
		do
			action.apply
			if action.clear_history then
				history.clear_all
			elseif action.remember then
				history.add(action)
			end
		end

	undo_action
		do
			if history.has_past then
				history.get_element.undo
				history.prev_element
			end
		end

	redo_action
		do
			if history.has_future then
				history.next_element
				history.get_element.apply
			end
		end

	get_history: HISTORY[ACTION_TYPE]
		do
			Result := history
		end


end
