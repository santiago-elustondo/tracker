note
	description: "Summary description for {T_LIQUID}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

expanded class
	T_LIQUID

inherit
	T_MATERIAL
		redefine get_name end

feature
	get_name : STRING
		do
			Result := "liquid"
		end

end
