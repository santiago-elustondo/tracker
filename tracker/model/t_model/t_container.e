note
	description: "Summary description for {T_CONTAINER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	T_CONTAINER

create
	make

feature
	cid: STRING
	props: TUPLE [material: INTEGER_64; radioactivity: VALUE]

	make(a_cid: STRING; a_props: TUPLE [material: INTEGER_64; radioactivity: VALUE])
		do
			cid := a_cid
			props := a_props
		end


feature -- queries

	get_props : TUPLE [material: INTEGER_64; radioactivity: VALUE]
		do
			Result := props
		end

	get_cid : STRING
		do
			Result := cid
		end


end
