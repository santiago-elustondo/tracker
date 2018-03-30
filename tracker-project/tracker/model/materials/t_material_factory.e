note
	description: "Summary description for {T_MATERIAL_FACTORY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

expanded class
	T_MATERIAL_FACTORY

create
	default_create


feature

	parse_material (a_material: INTEGER_64): T_MATERIAL
		local
			ma: T_MATERIAL_ACCESS
		do
			inspect a_material
			when 1 then
				Result := ma.glass
			when 2 then
				Result := ma.metal
			when 3 then
				Result := ma.plastic
			when 4 then
				Result := ma.liquid
			end
		end

end
