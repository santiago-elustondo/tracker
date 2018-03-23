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
--		local
--			glass : T_GLASS
		do
			mid := i
			inspect i
				when 1 then
					name := "glass"
				when 2 then
					name := "metal"
				when 3 then
					name := "plastic"
				when 4 then
					name := "liquid"
			end
		end


feature
	name: STRING
	mid: INTEGER_64
--	material: T_MATERIAL


feature

	get_name: STRING
			do
				Result := name
			end

	is_equal (other: like current): BOOLEAN
		do
			Result := (mid ~ other.mid)
--			if other.mid ~ current.name then
--				result := true
--			else
--				result := false
--			end
		end
end
