note
	description: "Summary description for {T_PHASE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	T_PHASE

inherit
	COMPARABLE

create
	make

feature {NONE} -- params
	pid: STRING
	name: STRING
	capacity: INTEGER_64
	materials: T_MATERIAL_SET
	containers: STRING_TABLE[T_CONTAINER]

feature{NONE} -- cmds
	make(
		a_pid: STRING
		a_name: STRING
		a_capacity: INTEGER_64
		a_materials: ARRAY[INTEGER_64]
	)
		do
			pid := a_pid
			name := a_name
			capacity := a_capacity
			create materials.make(a_materials)
			create containers.make(10)
		end

feature -- commands

	add_container(a_container: T_CONTAINER)
		do
			a_container.set_pid(current.get_pid)
			containers.put(a_container, a_container.get_cid)
		ensure
			container_exists: has_container(a_container.get_cid)
			container_has_correct_pid: get_container(a_container.get_cid).get_pid ~ get_pid
		end

	remove_container(a_cid: STRING)
		require
			cid_is_not_empty: not cid.is_empty
			cid_starts_with_letter_or_number: not cid[1].is_alpha_numeric
		do
			containers.remove(a_cid)
		ensure
			container_doesnt_exist(a_cid)
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

	get_materials: T_MATERIAL_SET
		do
			Result := materials
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

	max_capacity: BOOLEAN
		do
			Result := (get_count = get_capacity)
		end

	is_less alias "<" (other: like current): BOOLEAN
		do
			if current = other then
				Result := False
			elseif current.get_pid < other.get_pid then
				Result := True
			elseif current.get_pid ~ other.get_pid then
				Result := current.get_name < other.get_name
			end
		end


feature -- print
	print_phase : STRING
		do
			Create Result.make_from_string("    ")
			Result.append (get_pid)
			Result.append ("->")
			Result.append (get_name + ":")
			Result.append (get_capacity.out + ",")
			Result.append (get_count.out + ",")
			Result.append (get_radiation.out + ",{")
			across 1 |..| (materials.get_count - 1) as i loop
				Result.append(materials[i.item].get_name+ ",")
			end
			Result.append (materials [materials.get_count].get_name+ "}")
		end

end
