note
	description: "Summary description for {REDO_ACTION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	REDO_ACTION

inherit
	T_TRACKER_ACTION

create
	make

feature {NONE} -- Initialization

	make(a_target :T_TRACKER)
		do
			set_target(a_target)
			set_default_error
		end

feature -- comands

	clear_history:BOOLEAN = FALSE
	remember: BOOLEAN = FALSE

	apply
		do
			if target.has_future then
				target.redo_action
			else
				set_error(error.err_redo)
			end

		end

	undo
		do
			-- not implemented
		end

end
