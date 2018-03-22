note
	description: "Summary description for {T_TRACKER_ACTION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	T_TRACKER_ACTION

inherit
	ACTION [T_TRACKER]

feature
	error: ERROR_HANDLING

feature -- mem

	prev_error: STRING
	exec_error: STRING

feature --setters
	set_error(err: STRING)
		do
			exec_error := err
			target.set_error(err)
		end


	set_default_error
		do
			prev_error := ""
			exec_error := ""
		end

end