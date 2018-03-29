note
	description: "Summary description for {REDO_ACTION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	REDO_ACTION

inherit
	T_TRACKER_ACTION
		redefine apply, undo end
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
			precursor
			if not target.get_history.has_future then
				set_error(error.err_redo)
			else
				target.redo_action
			end

		end

	undo
		do precursor end

end
