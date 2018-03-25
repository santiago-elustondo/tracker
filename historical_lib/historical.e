note
	description: "Summary description for {HISTORICAL}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

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

feature { ANY }

	do_action(action: ACTION_TYPE)
		do
			action.apply
			if action.clear_history then
				history.clear_all
			else
				if action.remember then
					history.add(action)
				end
			end
		end

	undo_action
		do
			if history.has_past then
				history.pop_past.undo
			end
		end

	redo_action
		do
			if history.has_future then
				history.pop_future.apply
			end
		end

	get_history: HISTORY[ACTION_TYPE] -- can be removed once counter is fixed
		do
			Result := history
		end

	has_past: BOOLEAN -- used by undo_action
		do
			Result := history.has_past
		end

	has_future: BOOLEAN -- used by redo_action
		do
			Result := history.has_future
		end

end
