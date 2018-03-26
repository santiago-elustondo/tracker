note
	description: "Summary description for {T_MATERIAL_FACTORY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	T_MATERIAL_FACTORY

create
	default_create


--feature{NONE}
--	make_m(a_material: INTEGER_64)
--		do
--			set_material(a_material)
--		end

feature{NONE}
--	material:  T_MATERIAL

feature -- commands

--	set_material(a_material : INTEGER_64)
--		do
--			inspect a_material
--				when 1 then
--					material := create{T_GLASS}
--				when 2 then
--					material := create{T_METAL}
--				when 3 then
--					material := create{T_PLASTIC}
--				when 4 then
--					material := create{T_LIQUID}
--			end
--		end
feature -- queries

--	get_material: T_MATERIAL
--		do
--			Result := material
--		end

	check_material(a_material: INTEGER_64) : T_MATERIAL
		do
			inspect a_material
				when 1 then
					Result := create{T_GLASS}
				when 2 then
					Result := create{T_METAL}
				when 3 then
					Result := create{T_PLASTIC}
				when 4 then
					Result := create{T_LIQUID}
			end
		end
end
