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

feature {NONE} -- state
	pid: STRING
	name: STRING
	capacity: INTEGER_64
	materials: T_MATERIAL_SET
	containers: STRING_TABLE[T_CONTAINER]

feature {NONE} -- cmds
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

feature -- commands

	add_container(a_container: T_CONTAINER)
			-- adds `a_container' to tracker
		require
--			container_doesnt_exist: not get_containers.has (a_container.get_cid)
			cid_is_valid: not a_container.get_cid.is_empty and then a_container.get_cid[1].is_alpha_numeric
			radioactivity_non_negative: not (a_container.get_props.radioactivity < 0.0)
			max_capacity_not_exceeded: not max_capacity
			material_expected: get_materials.material_expected (a_container.get_props.material.get_mid)
			container_doesnt_exist: not model.domain.has (a_container.get_cid)
		do
			containers.put(a_container, a_container.get_cid)
		ensure
			container_added: model ~ old model.deep_twin + [a_container.get_cid, a_container]
--			container_exists: get_containers.has(a_container.get_cid)
--			container_has_correct_pid: get_container(a_container.get_cid).get_pid ~ get_pid
--			container_count_increased: get_containers.count = old get_containers.count + 1
--			container_added: current ~ old current.deep_twin |-> (a_container)
		end

	remove_container(a_cid: STRING)
			-- removes container associated with `a_cid' from tracker
		require
			cid_is_valid: not a_cid.is_empty and then a_cid[1].is_alpha_numeric
--			has_container: get_containers.has (a_cid)
			has_container: model.domain.has (a_cid)
		do
			containers.remove(a_cid)
		ensure
			container_removed: model ~ old model.deep_twin - old [a_cid, get_container (a_cid)]
--			container_removed: not get_containers.has (a_cid)
--			container_count_decreased: get_containers.count = old get_containers.count - 1
--			container_removed: current ~ old current.deep_twin |-/> (a_cid)
		end

feature -- model

	model: FUN[STRING, T_CONTAINER]
			-- abstraction function
		do
			create Result.make_empty
			across containers as c loop
				Result.extend([c.item.get_cid, c.item])
			end
		ensure
			model.is_function
		end

feature -- queries
	get_pid: STRING
			-- returns the pid of the phase
		do
			Result := pid
		ensure
			result = pid
		end

	get_name: STRING
			-- returns the name of the phase
		do
			Result := name
		ensure
			result = name
		end

	get_capacity: INTEGER_64
			-- returns the capacity of the phase
		do
			Result := capacity
		ensure
			result = capacity
		end

	get_radiation: VALUE
			-- returns the current radiation of the phase
		do
			across containers as c loop
				Result := Result + c.item.get_props.radioactivity
			end
		end

	get_materials: T_MATERIAL_SET
			-- returns the set of materials that can be used in the phase
		do
			Result := materials
		ensure
			result = materials
		end

	get_container(cid: STRING): T_CONTAINER
			-- returns a container associated with `cid'
		do
			check attached containers.item (cid) as c then
				Result := c
			end
		ensure
			attached Result implies Result = model[cid]
		end

	get_containers: STRING_TABLE[T_CONTAINER]
			-- returns a list of containers
		do
			Result := containers
		ensure
			result = containers
		end

	max_capacity: BOOLEAN
			-- returns the max capacity of the phase
		do
			Result := (get_containers.count = get_capacity)
		ensure
			result = (get_containers.count = get_capacity)
		end

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

	do_visit(visitor: T_VISITOR)
			-- allows a visitor to visit Current
		do
			visitor.visit_phase (current)
		end

feature -- print
	print_phase : STRING
		do
			Create Result.make_from_string("    ")
			Result.append (get_pid)
			Result.append ("->")
			Result.append (get_name + ":")
			Result.append (get_capacity.out + ",")
			Result.append (get_containers.count.out + ",")
			Result.append (get_radiation.out + ",{")
			across 1 |..| (materials.count - 1) as i loop
				Result.append(materials[i.item].get_name+ ",")
			end
			Result.append (materials [materials.count].get_name+ "}")
		end

invariant

	-- ∀c( c ∈ containers -> c.radiation >= 0 )
	all_containers_have_non_negative_radiation:
		 across containers as c all c.item.get_props.radioactivity >= 0.0 end;

	-- ∀c( c ∈ containers -> c.material ∈ materials )
	all_containers_are_of_valid_material:
		 across containers as c all
		 	across materials as m some c.item.get_props.material = m.item end
		 end;

	-- capacity >= #(containers)
	capacity_not_smaller_than_sum_of_containers:
		not (capacity < containers.count);

end
