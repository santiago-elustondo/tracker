note
	description: "Summary description for {T_CONTAINER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	T_CONTAINER

create

feature{none}
	cid: STRING
	container: TUPLE [material: INTEGER; radioactivity: VALUE]


feature -- queries
	get_container : TUPLE [material: INTEGER; radioactivity: VALUE]
		do
			Result := container
		end

	get_cid : STRING
		do
			Result := cid
		end


end
