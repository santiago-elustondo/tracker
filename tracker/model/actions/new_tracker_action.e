note
	description: "Summary description for {NEW_TRACKER_ACTION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	NEW_TRACKER_ACTION

inherit
	T_TRACKER_ACTION

create
	make

feature -- params

	max_phase_radiation: VALUE
	max_container_radiation: VALUE

feature

	clear_history:BOOLEAN = TRUE
	remember: BOOLEAN = FALSE

	make(
		a_target: T_TRACKER;
		a_max_phase_radiation: VALUE;
		a_max_container_radiation: VALUE;
	)
		do
			set_target(a_target)
			max_phase_radiation := a_max_phase_radiation
			max_container_radiation := a_max_container_radiation
			set_default_error
		end

	apply
		do
			prev_error := target.error
			if target.tracker_in_use then
    			set_error(error.err_tracker_in_use)
    		elseif max_phase_radiation < 0.0 then
    			set_error(error.err_max_phase_rad_negative)
    		elseif max_container_radiation < 0.0 then
				set_error(error.err_max_con_rad_negative)
			elseif max_container_radiation > max_phase_radiation then
				set_error(error.err_max_con_greater_max_rad)
			else
				set_error(error.err_ok)
				target.wipe_out(
					max_phase_radiation,
					max_container_radiation
				)
    		end
		end

	undo
		do
--			not implemented
		end

end
