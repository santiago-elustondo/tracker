note
	description: "Summary description for {T_CONTAINER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	T_CONTAINER

create
	make

feature
	cid: STRING
	pid: STRING
	props: TUPLE [material: INTEGER_64; radioactivity: VALUE]

	make(a_cid: STRING; a_pid: STRING; a_props: TUPLE [material: INTEGER_64; radioactivity: VALUE])
		do
			cid := a_cid
			pid := a_pid
			props := a_props
		end


feature -- queries

	get_props : TUPLE [material: INTEGER_64; radioactivity: VALUE]
		do
			Result := props
		end

	get_cid : STRING
		do
			Result := cid
		end

	get_pid : STRING
		do
			Result := pid
		end


	get_material(i: INTEGER_64): STRING
		do
			inspect i
				when 1 then
					Result := "glass"
				when 2 then
					Result := "metal"
				when 3 then
					Result := "plastic"
				when 4 then
					Result := "liquid"
			end
		end


feature -- print

	print_container : STRING
		do
			Create Result.make_from_string("    ")
			Result.append (get_cid)
			Result.append ("->")
			Result.append (get_pid)
			Result.append ("->")
			Result.append (get_material(get_props.material) + ",")
			Result.append (get_props.radioactivity.out)
		end


end
