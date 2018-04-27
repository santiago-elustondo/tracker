note
	description: "Summary description for {T_MATERIAL_SET}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	T_MATERIAL_SET
	inherit
		ITERABLE[T_MATERIAL]

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

	new_cursor: ITERATION_CURSOR[T_MATERIAL]
		do
			result := materials.new_cursor
		end

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

end
