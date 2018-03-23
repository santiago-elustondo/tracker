note
	description: "Summary description for {T_PLASTIC}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

expanded class
	T_PLASTIC

inherit
	T_MATERIAL
		redefine get_name end

feature
	get_name : STRING
		do
			Result := "plastic"
		end

end
