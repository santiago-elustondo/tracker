note
	description: "Summary description for {T_MATERIAL}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	T_MATERIAL

feature -- queries

	get_name: STRING
			-- name of material
		deferred end

	get_mid: INTEGER_64
			-- id of material
		deferred end


end
