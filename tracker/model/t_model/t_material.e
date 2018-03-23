note
	description: "Summary description for {T_MATERIAL}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	T_MATERIAL

create
	make

feature
	make(i: INTEGER_64)
		do
			mid := i
			inspect mid
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

feature

	get_name: STRING
		do
			Result := name
		end

	get_mid : INTEGER_64
		do
			Result := mid
		end
end
