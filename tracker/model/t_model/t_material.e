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

feature

	get_name: STRING
		do
			Result := name
		end

	is_equal(other: T_MATERIAL): BOOLEAN
		do
			if other.name ~ current.name then
				result := true
			else
				result := false
			end
		end

end
