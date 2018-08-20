note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_REMOVE_PHASE
inherit
	ETF_REMOVE_PHASE_INTERFACE
		redefine remove_phase end
create
	make
feature -- command
	remove_phase(pid: STRING)
		require else
			remove_phase_precond(pid)
		do
			model.do_action(create {REMOVE_PHASE_ACTION}.make(
    			model,
    			pid
    		))
			etf_cmd_container.on_change.notify ([Current])
		end

end
