note
	description: "Summary description for {T_MATERIAL_SET}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	T_MATERIAL_SET

inherit
	ANY
		redefine is_equal end

create
	make

feature{T_MATERIAL_SET}

	materials: LIST[T_MATERIAL]

feature{NONE} -- Initialization

	make(a_materials: ARRAY[INTEGER_64])
		do
			materials := add_materials(a_materials)
		ensure
			current ~ (old current.deep_twin) |-> (a_materials)
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

	elements_added alias "|->"(a_materials: ARRAY[INTEGER_64]) : like current
		do
			create Result.make (a_materials)
		end

	is_equal(other: like current): BOOLEAN
		do
			Result := materials ~ other.materials
		end

	as_integers: ARRAY[INTEGER_64]
		do
			create result.make_empty
			across materials as m loop
				result.force (m.item.get_mid, m.cursor_index)
			end
--			across 1 |..| materials.count as m loop
--				result.put (materials[m.item].get_mid, m.item)
--			end
		end


feature {NONE} --commands

	add_materials(a_materials: ARRAY[INTEGER_64]): LINKED_SET[T_MATERIAL]
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
	all_elements_unique:
		across 1 |..| count as i all
			across 1 |..| count as j all
				(i.item /= j.item) implies (materials[i.item] /= materials[j.item])
			end
	 	end

end
