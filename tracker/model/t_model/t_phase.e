note
	description: "Summary description for {T_PHASE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	T_PHASE

create

feature
	pid: STRING
	name: STRING
	max_containers: INTEGER
	materials: ARRAY[T_MATERIAL]
	containers: STRING_TABLE[T_CONTAINER]

end
