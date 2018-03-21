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
		local
			e: STRING
    	do
    		if not model.has_container (cid) then
    			e := error.err_con_id_not_exists
    		else
    			e := error.ok
				model.default_update
			end
			etf_cmd_container.on_change.notify ([Current])
    	end

end
