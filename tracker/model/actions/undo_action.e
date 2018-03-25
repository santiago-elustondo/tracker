note
	description: "Summary description for {UNDO_ACTION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	UNDO_ACTION

inherit
	T_TRACKER_ACTION

create
	make

feature{NONE}

	make(a_target :T_TRACKER)
		do
			set_target(a_target)
			set_default_error
		end

feature

	clear_history:BOOLEAN = FALSE
	remember: BOOLEAN = FALSE

	apply
		do
			if target.has_past then
				target.undo_action
			else
				set_error(error.err_undo)
			end

		end

	undo
		do
			-- not implemented
		end

end
