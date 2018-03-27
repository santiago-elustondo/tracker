note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_UNDO
inherit
	ETF_UNDO_INTERFACE
		redefine undo end
create
	make
feature -- command
	undo
    	do
			-- perform some update on the model state
--			model.do_action(create {UNDO_ACTION}.make(model))
			if not model.has_past then
				model.set_error({ERROR_HANDLING}.err_undo)
			else
				model.undo_action
			end
			etf_cmd_container.on_change.notify ([Current])
    	end

end
