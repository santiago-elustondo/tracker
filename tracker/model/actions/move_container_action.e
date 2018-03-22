note
	description: "Summary description for {MOVE_CONTAINER_ACTION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MOVE_CONTAINER_ACTION

inherit
	T_TRACKER_ACTION

create
	make

feature -- params

	cid: STRING;
	pid1: STRING;
	pid2: STRING;


feature

	clear_history:BOOLEAN = false
	remember: BOOLEAN = true

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

	apply
		local
			e: STRING
    	do
    		if not target.has_container (cid) then
    			e := error.err_con_id_not_exists
    		elseif pid1 ~ pid2 then
    			e := error.err_phase_id_same
			elseif not (target.has_phase (pid1) and then target.has_phase (pid2)) then
				e := error.err_phase_id_not_exists
			elseif not(target.get_phase (pid1).has_container (cid)) then
				e := error.err_con_id_not_in_phase
			elseif target.get_phase (pid2).get_count > target.get_phase (pid1).get_capacity then
				e := error.err_con_exceed_phase_cap
			elseif target.get_phase (pid2).get_container (cid).get_container.radioactivity > target.get_max_phase_rad then
    			e := error.err_con_exceed_safe
    		elseif target.get_phase (pid2).material_expected (target.get_phase (pid2).get_container (cid).get_container.material) then
    			e := error.err_phase_mat_not_expected
    		else
    			e := error.err_ok
				target.default_update
			end
    	end

	undo
		do end

end
