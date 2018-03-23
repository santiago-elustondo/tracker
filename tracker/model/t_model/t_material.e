note
	description: "Summary description for {T_MATERIAL}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	T_MATERIAL

inherit
	ANY
		redefine is_equal end

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
	name: detachable STRING
	material: detachable T_MATERIAL


feature

	get_material: T_MATERIAL
		do
			check attached material as m then
				Result := m
			end
		end

	get_name: STRING
			do
				Result := ""
				check attached material as m then
					Result := m.get_name
				end
			end

	is_equal (other: like current): BOOLEAN
		do
			Result := (name ~ other.name)
--			if other.mid ~ current.name then
--				result := true
--			else
--				result := false
--			end
		end
end
