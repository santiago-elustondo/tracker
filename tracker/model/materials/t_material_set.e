note
	description: "Summary description for {T_MATERIAL_SET}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	T_MATERIAL_SET

inherit
	T_MATERIAL_FACTORY

create
	make

feature

	materials: LINKED_SET[T_MATERIAL]

	make(a_materials: ARRAY[INTEGER_64])
		do
			Create materials.make
			across a_materials as m loop
				materials.put (check_material(m.item))
			end
		end

	get_count : INTEGER
		do
			Result := materials.count
		end

	material_expected(mat: INTEGER_64) : BOOLEAN
		do
			Result := materials.has (check_material(mat))
		end

	at(i: INTEGER_64): T_MATERIAL
		do
			Result := materials.at (i.to_integer_32)
		end

end
