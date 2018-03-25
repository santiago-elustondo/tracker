note
	description: "Summary description for {T_MATERIAL_FACTORY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	T_MATERIAL_FACTORY

create
	make

feature
	make(i: INTEGER_64)
		do
			inspect i
				when 1 then
					material := create{T_GLASS}
				when 2 then
					material := create{T_METAL}
				when 3 then
					material := create{T_PLASTIC}
				when 4 then
					material := create{T_LIQUID}
			end
		end

feature
	material: detachable T_MATERIAL

feature

	get_material: T_MATERIAL
		do
			check attached material as m then
				Result := m
			end
		end

--	get_name: STRING
--		do
--			check attached material as m then
--				Result := m.get_name
--			end
--		end

--	get_mid: INTEGER_64
--		do
--			check attached material as m then
--				Result := m.get_mid
--			end
--		end

end
