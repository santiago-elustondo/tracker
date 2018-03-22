note
	description: "Summary description for {MOVE_CONTAINER_ACTION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	REMOVE_CONTAINER_ACTION

inherit
	T_TRACKER_ACTION

create
	make

feature -- params

	cid: STRING;

feature

	clear_history:BOOLEAN = false
	remember: BOOLEAN = true

	make(
		a_target: T_TRACKER;
		a_cid: STRING;
	)
		do
			set_target(a_target)
			cid := a_cid
			set_default_error
		end

	apply
		local
			e: STRING
    	do
    		if not target.has_container (cid) then
    			e := error.err_con_id_not_exists
    		else
    			e := error.err_ok
				target.default_update
			end
    	end

	undo
		do end

end
