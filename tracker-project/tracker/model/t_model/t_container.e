note
	description: "Summary description for {T_CONTAINER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	T_CONTAINER

inherit
	COMPARABLE
		redefine is_equal end


create
	make

feature{NONE} -- parameters
	cid: STRING
	pid: STRING
	props: TUPLE [
		material: T_MATERIAL;
		radioactivity: VALUE
	]

feature{NONE} -- Initialization

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
			props := [
				(create {T_MATERIAL_FACTORY}.default_create).parse_material(a_props.a_material),
				a_props.a_radioactivity
			]
		end

feature{T_TRACKER} -- commands
	set_pid(a_pid: STRING)
		do
			pid := a_pid
		ensure
			pid = a_pid
		end

feature -- queries

	get_props : TUPLE [material: T_MATERIAL; radioactivity: VALUE]
			-- returns the props of container
		do
			Result := props
		ensure
			result = props
		end

	get_cid : STRING
			-- returns the cid of container
		do
			Result := cid
		ensure
			result = cid
		end

	get_pid : STRING
			-- returns the pid that container is in
		do
			Result := pid
		ensure
			result = pid
		end

	is_less alias "<" (other: like current): BOOLEAN
		do
			Result := get_cid < other.get_cid
		end

	is_equal (other: like current): BOOLEAN
		do
			Result := current = other
			or else get_cid ~ other.get_cid
			and then get_pid ~ other.get_pid
			and then get_props.material ~ other.get_props.material
			and then get_props.radioactivity ~ other.get_props.radioactivity
		end


feature -- print

	do_visit(visitor: T_VISITOR)
		do
			visitor.visit_container (current)
		end

invariant

	-- radioactivity >= 0
	radioactivity_is_not_negative:
		not (props.radioactivity < .0)


end
