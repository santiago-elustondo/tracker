note
	description: "Summary description for {T_CONTAINER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	T_CONTAINER

inherit
	COMPARABLE

create
	make

feature
	cid: STRING
	pid: STRING
	props: TUPLE [
		material: T_MATERIAL;
		radioactivity: VALUE
	]

	make(
		a_cid: STRING;
		a_pid: STRING;
		a_props: TUPLE [
			a_material: INTEGER_64;
			a_radioactivity: VALUE
		]
	)
		do
			cid := a_cid
			pid := a_pid
			props := [(create {T_MATERIAL_FACTORY}.make (a_props.a_material)).get_material, a_props.a_radioactivity]
		end


feature -- queries

	get_props : TUPLE [material: T_MATERIAL; radioactivity: VALUE]
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

	is_less alias "<" (other: like current): BOOLEAN --used to sort users, first by name, then by id
		do
			if current = other then
				Result := False
			elseif current.get_cid < other.get_cid then
				Result := True
			elseif current.get_cid ~ other.get_cid then
				Result := current.get_pid < other.get_pid
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
			Result.append (get_props.material.get_name + ",")
			Result.append (get_props.radioactivity.out)
		end


end
