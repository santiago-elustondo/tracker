note
	description: "Summary description for {T_MATERIAL_SET}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	T_MATERIAL_SET
	inherit
		ITERABLE[T_MATERIAL]
			redefine is_equal end

create
	make

feature{ T_MATERIAL_SET }

	materials: LINKED_SET[T_MATERIAL]

feature -- model

	model: SET[T_MATERIAL]
		do
			create Result.make_empty
			across materials as m loop
				Result.extend(m.item)
			end
		end

feature{NONE} -- Initialization

	make(a_materials: ARRAY[INTEGER_64])
		do
			materials := add_materials(a_materials)
		ensure
			model ~ create {SET[T_MATERIAL]}.make_from_array (as_array)
		end

feature { ANY } --queries

	count : INTEGER
			--returns number of materials in set
		do
			Result := materials.count
		end

	material_expected(mat: INTEGER_64) : BOOLEAN
			-- returns whether material is acceptable to the set
		do
			Result := materials.has ((create {T_MATERIAL_FACTORY}.default_create).parse_material(mat))
		end

	at alias "[]" (i: INTEGER_64): T_MATERIAL
			-- returns the material at `i'
		do
			Result := materials [i.to_integer_32]
		end

	is_equal(other: like current): BOOLEAN
		do
			Result := materials ~ other.materials
		end

	as_array: ARRAY[T_MATERIAL]
			-- returns set as an array
		do
			create Result.make_empty
			across materials as m loop
				result.force(m.item, m.cursor_index)
			end
		end

	as_integer_array: ARRAY[INTEGER_64]
			-- returns set as an array of ints
		do
			create result.make_empty
			across materials as m loop
				result.force (m.item.get_mid, m.cursor_index)
			end
		end

feature{NONE} -- iteration

	new_cursor: ITERATION_CURSOR[T_MATERIAL]
		do
			result := materials.new_cursor
		end


feature --commands

	add_materials(a_materials: ARRAY[INTEGER_64]): LINKED_SET[T_MATERIAL]
			-- takes an array of `a_material' and produces a set
		do
			create Result.make
			across a_materials as m loop
				Result.put ((create {T_MATERIAL_FACTORY}.default_create).parse_material(m.item))
			end
		end

feature -- print

	do_visit(visitor: T_VISITOR)
		do
			visitor.visit_materials (current)
		end

invariant

	-- ∀i,j( i.index != j.index -> i != j )
	all_elements_unique:
		across materials as i all
			across materials as j all
				(i.item ~ j.item) implies (i.cursor_index = j.cursor_index)
			end
		end

end
