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

	cid: STRING
	old_container: T_CONTAINER

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
			check attached target.find_container (cid) as phase then
				old_container := phase.get_container (cid)
			end
		end

	apply
    	do
    		if not target.has_container (cid) then
    			set_error(error.err_con_id_not_exists)
    		else
    			set_error(error.err_ok)
    			check attached target.find_container (cid) as phase then
					phase.remove_container (cid)
				end
			end
    	end

	undo
		do end

end
