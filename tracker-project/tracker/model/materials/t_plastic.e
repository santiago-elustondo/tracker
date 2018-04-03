note
	description: "Summary description for {T_PLASTIC}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

expanded class
	T_PLASTIC

inherit
	T_MATERIAL

create
	default_create

feature
	get_name : STRING = "plastic"

	get_mid : INTEGER_64 = 3

end

