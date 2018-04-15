note
	description: "Summary description for {T_PHASE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	T_PHASE

inherit
	COMPARABLE
		redefine is_equal end

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
			containers.compare_objects
		end

feature{T_TRACKER_ACTION, T_PHASE} -- commands

	add_container(a_container: T_CONTAINER)
		require
			container_doesnt_exist: not get_containers.has (a_container.get_cid)
			cid_is_valid: not a_container.get_cid.is_empty and then a_container.get_cid[1].is_alpha_numeric
			radioactivity_non_negative: not (a_container.get_props.radioactivity < 0.0)
			max_capacity_not_exceeded: not max_capacity
			material_expected: get_materials.material_expected (a_container.get_props.material.get_mid)
		do
			containers.put(a_container, a_container.get_cid)
		ensure
			container_exists: get_containers.has(a_container.get_cid)
			container_has_correct_pid: get_container(a_container.get_cid).get_pid ~ get_pid
			container_count_increased: get_containers.count = old get_containers.count + 1
			container_added: current ~ old current.deep_twin |-> (a_container)
		end

	remove_container(a_cid: STRING)
		require
			cid_is_valid: not a_cid.is_empty and then a_cid[1].is_alpha_numeric
			has_container: get_containers.has (a_cid)
		do
			containers.remove(a_cid)
		ensure
			container_removed: not get_containers.has (a_cid)
			container_count_decreased: get_containers.count = old get_containers.count - 1
			container_removed: current ~ old current.deep_twin |-/> (a_cid)
		end

feature {T_PHASE}
	container_added alias "|->"(a_container: T_CONTAINER): like current
		do
			Result := current.deep_twin
			Result.add_container(a_container)
		end

	container_removed alias "|-/>"(a_cid: STRING): like current
		do
			Result := current.deep_twin
			Result.remove_container(a_cid)
		end


feature -- queries

	get_pid: STRING
		do
			Result := pid
		ensure
			result = pid
		end

	get_name: STRING
		do
			Result := name
		ensure
			result = name
		end

	get_capacity: INTEGER_64
		do
			Result := capacity
		ensure
			result = capacity
		end

	get_radiation: VALUE
		do
			across containers as c loop
				Result := Result + c.item.get_props.radioactivity
			end
		end

	get_materials: T_MATERIAL_SET
		do
			Result := materials
		ensure
			result = materials
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
		ensure
			result = containers
		end

	max_capacity: BOOLEAN
		do
			Result := (get_containers.count = get_capacity)
		ensure
			get_containers.count = old get_containers.count
			result = (get_containers.count = get_capacity)
		end

--	is_less alias "<" (other: like current): BOOLEAN
--		do
--			if current = other then
--				Result := False
--			elseif current.get_pid < other.get_pid then
--				Result := True
--			elseif current.get_pid ~ other.get_pid then
--				Result := current.get_name < other.get_name
--			end
--		end

--	is_equal (other: like current): BOOLEAN
--		do
--			if current = other then
--				Result := true
--			elseif capacity /= other.get_capacity then
--				Result := false
--			elseif pid /~ other.get_pid then
--				Result := false
--			elseif name /~ other.get_name then
--				Result := false
--			elseif materials /~ other.get_materials then
--				Result := false
--			elseif containers /~ other.get_containers then
--				Result := false
--			else
--				Result := true
--			end
--		end

	is_less alias "<" (other: like current): BOOLEAN
		do
			Result := get_pid < other.get_pid
		end

	is_equal (other: like current): BOOLEAN
		do
			Result := current = other
			or else get_capacity = other.get_capacity
			and then get_pid ~ other.get_pid
			and then get_name ~ other.get_name
			and then get_materials ~ other.get_materials
			and then get_containers ~ other.get_containers
		end


feature -- print
--	print_phase : STRING
--		do
--			Create Result.make_from_string("    ")
--			Result.append (get_pid)
--			Result.append ("->")
--			Result.append (get_name + ":")
--			Result.append (get_capacity.out + ",")
--			Result.append (get_containers.count.out + ",")
--			Result.append (get_radiation.out + ",{")
--			across 1 |..| (materials.count - 1) as i loop
--				Result.append(materials[i.item].get_name+ ",")
--			end
--			Result.append (materials [materials.count].get_name+ "}")
--		end

	do_print(visitor: T_PRINT)
		do
			visitor.visit_phase (current)
		end
end
