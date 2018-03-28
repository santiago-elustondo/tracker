note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_REDO
inherit
	ETF_REDO_INTERFACE
		redefine redo end
create
	make
feature -- command
	redo
    	do
			-- perform some update on the model state
--			model.do_action (create{REDO_ACTION}.make (model))
			if not model.get_history.has_future then
				model.set_error ({ERROR_HANDLING}.err_redo)
			else
				model.redo_action
			end
			etf_cmd_container.on_change.notify ([Current])
    	end

end
