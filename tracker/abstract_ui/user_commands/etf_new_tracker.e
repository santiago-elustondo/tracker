note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_NEW_TRACKER
inherit
	ETF_NEW_TRACKER_INTERFACE
		redefine new_tracker end
create
	make
feature -- command
	new_tracker(max_phase_radiation: VALUE ; max_container_radiation: VALUE)
    	local
			e: STRING
    	do
    		if model.tracker_in_use then
    			e := error.err_tracker_in_use
    		elseif model.get_max_phase_rad < 0.0 then
    			e := error.err_max_phase_rad_negative
    		elseif model.get_max_container_rad < 0.0 then
				e := error.err_max_con_rad_negative
			elseif model.get_max_container_rad > model.get_max_phase_rad then
				e := error.err_max_con_greater_max_rad
			else
				e := error.ok
				model.default_update
    		end
			etf_cmd_container.on_change.notify ([Current])
    	end

end
