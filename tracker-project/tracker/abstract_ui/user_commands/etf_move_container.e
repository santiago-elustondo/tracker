note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_MOVE_CONTAINER
inherit
	ETF_MOVE_CONTAINER_INTERFACE
		redefine move_container end
create
	make
feature -- command
	move_container(cid: STRING ; pid1: STRING ; pid2: STRING)
		require else
			move_container_precond(cid, pid1, pid2)
    	do
			model.do_action(create {MOVE_CONTAINER_ACTION}.make(
    			model,
				cid,
				pid1,
				pid2
    		))
			etf_cmd_container.on_change.notify ([Current])
    	end

end
