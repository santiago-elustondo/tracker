note
	description: "Summary description for {T_CONTAINER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	T_CONTAINER

create

feature
	cid: STRING
	container: TUPLE [material: T_MATERIAL; radioactivity: VALUE]

end
