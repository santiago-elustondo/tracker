note
	description: "Summary description for {T_MATERIAL_SET}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	T_MATERIAL_SET

create
	make

feature

	materials: LINKED_SET[T_MATERIAL]

	make(a_materials: ARRAY[INTEGER_64])
		do
			create materials.make
			across a_materials as m loop
				materials.put ((create {T_MATERIAL_FACTORY}.default_create).parse_material(m.item))
			end
		end

	get_count : INTEGER
		do
			Result := materials.count
		end

	material_expected(mat: INTEGER_64) : BOOLEAN
		do
			Result := materials.has ((create {T_MATERIAL_FACTORY}.default_create).parse_material(mat))
		end

	at alias "[]" (i: INTEGER_64): T_MATERIAL
		do
			Result := materials [i.to_integer_32]
		end

	to_array: ARRAY[INTEGER_64]
		do
			create Result.make_empty
			across materials as mat loop
				Result.fill_with (mat.item.get_mid)
			end
		end


end
