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

feature

	clear_history:BOOLEAN = FALSE
	remember: BOOLEAN = TRUE

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
    	do
    		prev_error := target.get_error
    		if not target.has_container (cid) then
    			set_error(error.err_con_id_not_exists)
    		else
    			set_error(error.err_ok)
    			phase := target.find_container (cid)
    			if attached phase as p then
    				container := p.get_container (cid)
					p.remove_container (cid)
				end
			end
    	end

	undo
		do
--			if (exec_error ~ error.err_ok) then
				if (attached phase as p) and then (attached container as con) then
					p.add_container (con)
				end
--			end
			target.set_error(print_error(prev_error))
		end

end
