note
	description: "Summary description for {T_GLASS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

expanded class
	T_GLASS

inherit
	T_MATERIAL

create
	default_create

feature
	get_name : STRING = "glass"

	get_mid : INTEGER_64 = 1

end
