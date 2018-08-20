note
	description: "Summary description for {T_METAL}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

expanded class
	T_METAL

inherit
	T_MATERIAL

create
	default_create

feature
	get_name : STRING = "metal"

	get_mid : INTEGER_64 = 2


end
