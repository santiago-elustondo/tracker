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

	get_history: HISTORY[ACTION_TYPE] -- can be removed once counter is fixed
		do
			Result := history
		end


end
