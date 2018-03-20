note
	description: "Summary description for {NEW_TRACKER_ACTION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	NEW_TRACKER_ACTION

inherit
	T_TRACKER_ACTION

create
	make

feature

	clear_history:BOOLEAN = TRUE
	remember: BOOLEAN = FALSE

	make(a_target: T_TRACKER)
		do
			set_target(a_target)
		end

	apply
		do

		end

	undo
		do end

end
