note
	description: "Summary description for {T_MATERIAL_ACCESS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

expanded class
	T_MATERIAL_ACCESS

feature
	glass: T_GLASS
		once
			create {T_GLASS} Result.default_create
		end

	liquid: T_LIQUID
		once
			create {T_LIQUID} Result.default_create
		end

	metal: T_METAL
		once
			create {T_METAL} Result.default_create
		end

	plastic: T_PLASTIC
		once
			create {T_PLASTIC} Result.default_create
		end


invariant
	glass = glass
	liquid = liquid
	metal = metal
	plastic = plastic
end
