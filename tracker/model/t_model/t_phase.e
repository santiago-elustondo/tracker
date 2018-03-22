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
	capacity: INTEGER
	materials: LINKED_SET[INTEGER]
	containers: STRING_TABLE[T_CONTAINER]

feature -- cmds
	make(
		a_pid: STRING
		a_name: STRING
		a_capacity: INTEGER
		-- a_materials: LINKED_SET[INTEGER_64]
	)
		do
			pid := a_pid
			name := a_name
			capacity := a_capacity
			create materials.make
			create containers.make(0)
		end

feature -- queries
	get_pid: STRING
		do
			result := pid
		end

	get_capacity: INTEGER
		do
			Result := capacity
		end

	get_count: INTEGER
		do
			Result := containers.count
		end

	material_expected(i: INTEGER): BOOLEAN
		do
--			across materials as m loop Result := Result or else m.item = i end
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

end
