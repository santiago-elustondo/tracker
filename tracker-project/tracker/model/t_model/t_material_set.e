note
	description: "Summary description for {T_MATERIAL_SET}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	T_MATERIAL_SET

create
	make

feature{NONE}

	materials: LINKED_SET[T_MATERIAL]

feature{NONE} -- Initialization

	make(a_materials: ARRAY[INTEGER_64])
		do
			create materials.make
			materials.compare_objects
			across a_materials as m loop
				materials.put ((create {T_MATERIAL_FACTORY}.default_create).parse_material(m.item))
			end
		end

feature --queries

	count : INTEGER
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

	element_count(mat: T_MATERIAL): INTEGER
		do
			across 1 |..| count as i loop
				if materials[i.item] = mat then Result := Result + 1 end
			end
		end

invariant
	all_elements_unique:
		across 1 |..| count as i all
			across 1 |..| count as j all
				(i.item /= j.item) implies (materials[i.item] /= materials[j.item])
			end
	 	end

end
