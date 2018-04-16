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
		local
			ph: T_PHASE
		do
			set_target(a_target)
			cid := a_cid
			ph := target.find_container (a_cid)
			if attached ph as p then
				pid := p.get_pid
				radioactivity := p.get_container (cid).get_props.radioactivity
				material := p.get_container (a_cid).get_props.material.get_mid
			end
			set_default_error
		end

feature{NONE} -- params

	cid: STRING
	pid: detachable STRING
	material: INTEGER_64;
	radioactivity: VALUE

feature -- commands

	clear_history:BOOLEAN = FALSE
	remember: BOOLEAN = TRUE

	apply
    	do
    		precursor
			if not (attached pid as p) then
				set_error(error.err_con_id_not_exists)
    		else
    			set_error(error.err_ok)
--    			container := p.get_container (cid)
				target.get_phase (p).remove_container (cid)
			end
    	end

	undo
		do
			if action_success then
--				if (attached phase as p) and then (attached container as con) then
--					p.add_container (con)
--				end
				if (attached pid as p) then
					target.get_phase (p).add_container (create {T_CONTAINER}.make(
						cid,
						p,
						[
							material,
							radioactivity
						]
					))
				end
			end
			precursor
		end

end
