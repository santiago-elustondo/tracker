note
	description: "Summary description for {NEW_CONTAINER_ACTION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	NEW_CONTAINER_ACTION

inherit
	T_TRACKER_ACTION

create
	make

feature{NONE} -- Initialization

	make(
		a_target: T_TRACKER;
		a_pid: STRING;
		a_cid: STRING;
		a_c: TUPLE[
			material: INTEGER_64;
			radioactivity: VALUE
		]
	)
		do
			set_target(a_target)
			pid := a_pid
			cid := a_cid
			c := a_c
			set_default_error
		end

feature{NONE} -- params

	pid: STRING
	cid: STRING
	c: TUPLE[
		material: INTEGER_64;
		radioactivity: VALUE
	]

feature -- commands

	clear_history:BOOLEAN = FALSE
	remember: BOOLEAN = TRUE
--		do
--			Result := action_success
--			if (action_success) then
--				result := true
--			else
--				result := false
--			end
--		end

	apply
		do
			increment_num_actions
--    		prev_error := target.get_error
			prev_error := get_prev_error
			if not cid[1].is_alpha_numeric then
				set_error(error.err_name_start)
				state_stay
			elseif target.has_container(cid) then
				set_error(error.err_con_id_exists)
				state_stay
			elseif not pid[1].is_alpha_numeric then
				set_error(error.err_name_start)
				state_stay
			elseif not target.has_phase (pid) then
				set_error(error.err_phase_id_not_exists)
				state_stay
			elseif c.radioactivity < 0.0 then
				set_error(error.err_con_rad_negative)
				state_stay
			elseif target.get_phase (pid).max_capacity then
				set_error(error.err_con_exceed_phase_cap)
				state_stay
			elseif target.get_container_rad_exceeded(c.radioactivity) then
				set_error(error.err_con_exceed_rad_cap)
				state_stay
			elseif target.get_phase_rad_exceeded(pid, c.radioactivity) then
				set_error(error.err_con_exceed_safe)
				state_stay
			elseif not target.get_phase (pid).get_materials.material_expected (c.material) then
				set_error(error.err_phase_mat_not_expected)
				state_stay
			else
				state_move
				set_error(error.err_ok)
				target.get_phase(pid).add_container(create {T_CONTAINER}.make(
					cid,
					pid,
					c
				))
			end
    	end

	undo
		do
			increment_num_actions
			state_go_back
			if (exec_error ~ error.err_ok) then
				target.get_phase(pid).remove_container(cid)
			end
			target.set_error (prev_error)
		end

end
