note
	description: "Summary description for {T_GLASS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

expanded class
	T_GLASS

inherit
	T_MATERIAL
		redefine get_name end

feature
	get_name : STRING
		do
			Result := "glass"
		end

end
