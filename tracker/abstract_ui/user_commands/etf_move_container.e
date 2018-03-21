note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_MOVE_CONTAINER
inherit
	ETF_MOVE_CONTAINER_INTERFACE
		redefine move_container end
create
	make
feature -- command
	move_container(cid: STRING ; pid1: STRING ; pid2: STRING)
		require else
			move_container_precond(cid, pid1, pid2)
		local
			e: STRING
    	do
    		if not model.has_container (cid) then
    			e := error.err_con_id_not_exists
    		elseif pid1 ~ pid2 then
    			e := error.err_phase_id_same
			elseif not (model.has_phase (pid1) and then model.has_phase (pid2)) then
				e := error.err_phase_id_not_exists
			elseif not(model.get_phase (pid1).has_container (cid)) then
				e := error.err_con_id_not_in_phase
			elseif model.get_phase (pid2).get_count > model.get_phase (pid1).get_capacity then
				e := error.err_con_exceed_phase_cap
			elseif model.get_phase (pid2).get_container (cid).get_container.radioactivity > model.get_max_phase_rad then
    			e := error.err_con_exceed_safe
    		elseif model.get_phase (pid2).material_expected (model.get_phase (pid2).get_container (cid).get_container.material) then
    			e := error.err_phase_mat_not_expected
    		else
    			e := error.ok
				model.default_update
			end
			etf_cmd_container.on_change.notify ([Current])
    	end

end
