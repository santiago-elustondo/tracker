note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_NEW_CONTAINER
inherit
	ETF_NEW_CONTAINER_INTERFACE
		redefine new_container end
create
	make
feature -- command
	new_container(cid: STRING ; c: TUPLE[material: INTEGER_64; radioactivity: VALUE] ; pid: STRING)
		require else
			new_container_precond(cid, c, pid)
		do
			model.do_action(create {NEW_CONTAINER_ACTION}.make(
    			model,
				pid,
				cid,
				c
    		))
			etf_cmd_container.on_change.notify ([Current])
    	end

end
