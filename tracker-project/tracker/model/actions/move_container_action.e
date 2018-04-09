note
	description: "Summary description for {MOVE_CONTAINER_ACTION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MOVE_CONTAINER_ACTION

inherit
	T_TRACKER_ACTION
		redefine apply, undo end

create
	make

feature{NONE} -- Initialization

	make(
		a_target: T_TRACKER;
		a_cid: STRING;
		a_pid1: STRING;
		a_pid2: STRING;
	)
		do
			set_target(a_target)
			cid := a_cid
			pid1 := a_pid1
			pid2 := a_pid2
			set_default_error
		end

feature{NONE} -- params

	cid: STRING
	pid1: STRING
	pid2: STRING

feature -- commands

	clear_history:BOOLEAN = FALSE
	remember: BOOLEAN = TRUE

	apply
    	do
    		precursor
       		if not (attached target.find_container (cid) as p) then
    			set_error(error.err_con_id_not_exists)
    		elseif pid1 ~ pid2 then
    			set_error(error.err_phase_id_same)
			elseif not (target.has_phase (pid1) and target.has_phase (pid2)) then
				set_error(error.err_phase_id_not_exists)
			elseif not(target.get_phase (pid1).has_container (cid)) then
				set_error(error.err_con_id_not_in_phase)
			elseif target.get_phase (pid2).max_capacity then
				set_error(error.err_con_exceed_phase_cap)
			elseif target.get_phase_rad_exceeded(pid2, target.get_phase (pid1).get_container (cid).get_props.radioactivity) then
    			set_error(error.err_con_exceed_safe)
    		elseif not target.get_phase (pid2).get_materials.material_expected (target.get_phase (pid1).get_container (cid).get_props.material.get_mid) then
    			set_error(error.err_phase_mat_not_expected)
    		else
    			set_error(error.err_ok)
				target.move_container (p.get_container (cid), pid1, pid2)
			end
    	end

	undo
		do
			if action_success then
				target.move_container (target.get_phase(pid2).get_container(cid), pid2, pid1)
			end
			precursor
		end

end
