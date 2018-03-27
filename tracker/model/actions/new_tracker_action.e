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

feature{NONE} -- Initialization

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

feature{NONE} -- params

	max_phase_radiation: VALUE
	max_container_radiation: VALUE

feature -- commands

	clear_history:BOOLEAN = TRUE
	remember: BOOLEAN = TRUE

	apply
		do
			increment_num_actions
			prev_error := target.get_error
			if target.tracker_in_use then
    			set_error(error.err_tracker_in_use)
    			state_stay
    		elseif max_phase_radiation < 0.0 then
    			set_error(error.err_max_phase_rad_negative)
    			state_stay
    		elseif max_container_radiation < 0.0 then
				set_error(error.err_max_con_rad_negative)
				state_stay
			elseif max_container_radiation > max_phase_radiation then
				set_error(error.err_max_con_greater_max_rad)
				state_stay
			else
				state_move
				target.wipe_out(
					max_phase_radiation,
					max_container_radiation
				)
				set_error(error.err_ok)
    		end
		end

	undo
		do
			increment_num_actions
			state_go_back
			set_error(error.err_undo)
		end

end
