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
	container: detachable T_CONTAINER
	phase: detachable T_PHASE
	state: INTEGER

feature --setters
	set_error(err: STRING)
		do
			exec_error := err
			target.set_error(print_error)
		end

	print_error : STRING
		do
			Create Result.make_from_string ("  state ")
			Result.append_integer (target.get_state)
			if target.get_state /= state then
				Result.append(" (to ")
				Result.append_integer(state)
				Result.append(")")
			end
			Result.append (" " + exec_error)
		end

	get_state: INTEGER
		do
			Result := state
		end

	set_default_error
		do
			prev_error := ""
			exec_error := ""
			state := state + 1
		end

end
