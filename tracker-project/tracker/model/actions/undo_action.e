note
	description: "Summary description for {UNDO_ACTION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	UNDO_ACTION

inherit
	T_TRACKER_ACTION
		redefine apply end
create
	make

feature{NONE} -- Initialization

	make(a_target :T_TRACKER)
		do
			set_target(a_target)
			set_default_error
		end

feature -- commands

	clear_history:BOOLEAN = FALSE
	remember: BOOLEAN = FALSE

	apply
		do
			if not target.get_history.has_past then
				target.increment_num_actions
				set_error(error.err_undo)
			else
				target.undo_action
			end
		end

end
