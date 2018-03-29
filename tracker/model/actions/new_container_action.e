note
	description: "Summary description for {NEW_CONTAINER_ACTION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	NEW_CONTAINER_ACTION

inherit
	T_TRACKER_ACTION
	redefine apply, undo end

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

	apply
		do
			precursor
			set_prev_error
			if (cid.is_empty) or else (not cid[1].is_alpha_numeric) then -- must check length as well
				set_error(error.err_name_start)
			elseif target.has_container(cid) then
				set_error(error.err_con_id_exists)
			elseif (pid.is_empty) or else not pid[1].is_alpha_numeric then -- must check length as well
				set_error(error.err_name_start)
			elseif not target.has_phase (pid) then
				set_error(error.err_phase_id_not_exists)
			elseif c.radioactivity < 0.0 then
				set_error(error.err_con_rad_negative)
			elseif target.get_phase (pid).max_capacity then
				set_error(error.err_con_exceed_phase_cap)
			elseif target.get_container_rad_exceeded(c.radioactivity) then
				set_error(error.err_con_exceed_rad_cap)
			elseif target.get_phase_rad_exceeded(pid, c.radioactivity) then
				set_error(error.err_con_exceed_safe)
			elseif not target.get_phase (pid).get_materials.material_expected (c.material) then
				set_error(error.err_phase_mat_not_expected)
			else
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
			precursor
			if (exec_error ~ error.err_ok) then
				target.get_phase(pid).remove_container(cid)
			end
			target.set_error (prev_error)
		end

end
