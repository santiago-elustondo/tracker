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
	make
		do
			create mat.make_from_array (<<glass, metal, plastic, liquid>>)
		end


feature
	glass: INTEGER = 1
	metal: INTEGER = 2
	plastic: INTEGER = 3
	liquid: INTEGER = 4
	mat: ARRAY[INTEGER]

feature
	get_material(i: INTEGER) : INTEGER
		do
			Result := mat[i]
		end
end
