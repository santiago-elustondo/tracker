note
	description: "Summary description for {T_METAL}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

expanded class
	T_METAL

inherit
	T_MATERIAL
		redefine get_name end

feature
	get_name : STRING
		once
			Result := "metal"
		end

end
