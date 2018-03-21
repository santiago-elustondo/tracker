note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_NEW_CONTAINER
inherit
	ETF_NEW_CONTAINER_INTERFACE
		redefine new_container end
create
	make
feature -- command
	new_container(cid: STRING ; c: TUPLE[material: INTEGER_64; radioactivity: VALUE] ; pid: STRING)
		require else
			new_container_precond(cid, c, pid)
		local
			e: STRING
		do
			if not cid[1].is_alpha_numeric then
				e := error.err_name_start
			elseif model.has_container(cid) then
				e := error.err_con_id_exists
			elseif not pid[1].is_alpha_numeric then
				e := error.err_name_start
			elseif not model.has_phase (pid) then
				e := error.err_phase_id_not_exists
			elseif c.radioactivity < 0.0 then
				e := error.err_con_rad_negative
			elseif model.get_phase (pid).get_count > model.get_phase (pid).get_capacity then
				e := error.err_con_exceed_phase_cap
			elseif c.radioactivity > model.get_max_container_rad then
				e := error.err_con_exceed_rad_cap
			elseif c.radioactivity > model.get_max_phase_rad then
				e := error.err_con_exceed_safe
			elseif not model.get_phase (pid).material_expected (c.material.as_integer_32) then
				e := error.err_phase_mat_not_expected
			else
				e := error.ok
				model.default_update
			end
			etf_cmd_container.on_change.notify ([Current])
    	end

end
