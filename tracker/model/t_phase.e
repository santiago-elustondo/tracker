note
	description: "Summary description for {PHASE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	T_PHASE

create

feature
	id: STRING
	name: STRING
	max_containers: INTEGER
	materials: ARRAY[INTEGER]
	containers: ARRAY[CONTAINER]

end
