 note
	description: "Summary description for {MOVE_CONTAINER_ACTION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	REMOVE_CONTAINER_ACTION

inherit
	T_TRACKER_ACTION
		redefine apply, undo end

create
	make

feature{NONE} -- Initialization

	make(
		a_target: T_TRACKER;
		a_cid: STRING;
	)
		do
			set_target(a_target)
			cid := a_cid
			phase := target.find_container (a_cid)
			set_default_error
		end

feature{NONE} -- params

	cid: STRING

feature -- commands

	clear_history:BOOLEAN = FALSE
	remember: BOOLEAN = TRUE

	apply
    	do
    		precursor
			if not (attached phase as p) then
				set_error(error.err_con_id_not_exists)
    		else
    			set_error(error.err_ok)
    			container := p.get_container (cid)
				p.remove_container (cid)
			end
    	end

	undo
		do
			if action_success then
				if (attached phase as p) and then (attached container as con) then
					p.add_container (con)
				end
			end
			precursor
		end

end
