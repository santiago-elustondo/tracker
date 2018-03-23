note
	description: "Summary description for {T_PHASE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	T_PHASE

create
	make

feature{none}
	pid: STRING
	name: STRING
	capacity: INTEGER_64
	materials: LINKED_SET[T_MATERIAL]
	containers: STRING_TABLE[T_CONTAINER]

feature -- cmds
	make(
		a_pid: STRING
		a_name: STRING
		a_capacity: INTEGER_64
		a_materials: LINKED_SET[T_MATERIAL]
	)
		do
			pid := a_pid
			name := a_name
			capacity := a_capacity
			materials := a_materials
			create containers.make(10)
		end

feature -- queries

	add_container(a_container: T_CONTAINER)

		do
			containers.put(a_container, a_container.get_cid)
		end

	remove_container(a_cid: STRING)
		do
			containers.remove(a_cid)
		end

feature -- queries
	get_pid: STRING
		do
			Result := pid
		end

	get_name: STRING
		do
			Result := name
		end

	get_capacity: INTEGER_64
		do
			Result := capacity
		end

	get_radiation: VALUE
		do
			across containers as c loop
				Result := Result + c.item.get_props.radioactivity
			end
		end

	get_count: INTEGER_64
		do
			Result := containers.count
		end

	material_expected(i: T_MATERIAL): BOOLEAN
		do
			Result := materials.has (i)
		end

	has_container(cid: STRING): BOOLEAN
		do
			Result := containers.has (cid)
		end

	get_container(cid: STRING): T_CONTAINER
		do
			check attached containers.item (cid) as c then
				Result := c
			end
		end

	get_containers: STRING_TABLE[T_CONTAINER]
		do
			Result := containers
		end

--	materials_set: LINKED_SET[INTEGER_64]
--		do
--			Create Result.make
--			across materials as m loop
--				Result.put (m.item)
--			end
--		end


feature --print
	print_phase : STRING
		do
			Create Result.make_from_string("    ")
			Result.append (get_pid)
			Result.append ("->")
			Result.append (get_name + ":")
			Result.append (get_capacity.out + ",")
			Result.append (get_count.out + ",")
			Result.append (get_radiation.out + ",{")
			across 1 |..| (materials.count - 1) as i loop
				Result.append(materials[i.item].get_name+ ",")
			end
			Result.append (materials[materials.count].get_name+ "}")
		end

end
