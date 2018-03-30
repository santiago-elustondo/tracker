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
			check attached target.find_container (a_cid) as p then
				pid := p.get_pid
				c := [
					p.get_container (a_cid).get_props.material.get_mid,
					p.get_container (a_cid).get_props.radioactivity
				]
			end
			set_default_error
		end

feature{NONE} -- params

	cid: STRING
	pid: STRING
	c: TUPLE[
		material: INTEGER_64;
		radioactivity: VALUE
	]


feature -- commands

	clear_history:BOOLEAN = FALSE
	remember: BOOLEAN = TRUE

	apply
    	do
    		precursor
    		if not target.has_container (cid) then
    			set_error(error.err_con_id_not_exists)
    		else
    			set_error(error.err_ok)
--    			phase := target.find_container (cid)
--    			if attached phase as p then
--    				container := p.get_container (cid)
--					p.remove_container (cid)
--				end
				if attached target.find_container (cid) as p then
					p.remove_container (cid)
				end
			end
    	end

	undo
		do
--			if (exec_error ~ error.err_ok) then
--				if (attached phase as p) and then (attached container as con) then
--					p.add_container (con)
--				end
--			end
			if action_success then
				target.get_phase (pid).add_container (create {T_CONTAINER}.make (
					cid,
					pid,
					c
				))
			end
			precursor
		end

end
