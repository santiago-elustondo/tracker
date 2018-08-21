note
	description: "Summary description for {T_MATERIAL_ACCESS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

expanded class
	T_MATERIAL_ACCESS

feature
	glass: T_GLASS
			-- singleton for glass
		once
			create {T_GLASS} Result.default_create
		end

	liquid: T_LIQUID
			-- singleton for liquid
		once
			create {T_LIQUID} Result.default_create
		end

	metal: T_METAL
			-- singleton for metal
		once
			create {T_METAL} Result.default_create
		end

	plastic: T_PLASTIC
			-- singleton for plastic
		once
			create {T_PLASTIC} Result.default_create
		end


invariant
	glass = glass
	liquid = liquid
	metal = metal
	plastic = plastic
end
