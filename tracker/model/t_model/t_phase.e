note
	description: "Summary description for {T_PHASE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	T_PHASE

create

feature{none}
	pid: STRING
	name: STRING
	capacity: INTEGER
	materials: LINKED_SET[INTEGER]
	containers: STRING_TABLE[T_CONTAINER]

feature -- queries
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
