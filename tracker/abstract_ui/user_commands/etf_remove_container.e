note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_REMOVE_CONTAINER
inherit
	ETF_REMOVE_CONTAINER_INTERFACE
		redefine remove_container end
create
	make
feature -- command
	remove_container(cid: STRING)
		require else
			remove_container_precond(cid)
    	do
			model.do_action(create {REMOVE_CONTAINER_ACTION}.make(
    			model,
				cid
    		))
			etf_cmd_container.on_change.notify ([Current])
    	end

end
