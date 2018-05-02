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
		do
			Result := props
		ensure
			props = old props
		end

	get_cid : STRING
		do
			Result := cid
		ensure
			cid = old cid
		end

	get_pid : STRING
		do
			Result := pid
		ensure
			pid = old pid
		end

--	is_less alias "<" (other: like current): BOOLEAN
--		do
--			if current = other then
--				Result := False
--			elseif current.get_cid < other.get_cid then
--				Result := True
--			elseif current.get_cid ~ other.get_cid then
--				Result := current.get_pid < other.get_pid
--			end
--		end

--	is_equal (other: like current): BOOLEAN
--		do
--			if current = other then
--				Result := true
--			elseif cid /~ other.get_cid then
--				Result := false
--			elseif pid /~ other.get_pid then
--				Result := false
--			elseif props.material /~ other.get_props.material then
--				Result := false
--			elseif props.radioactivity /~ other.get_props.radioactivity then
--				Result := false
--			else
--				Result := true
--			end
--		end

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

--	print_container : STRING
--		do
--			Create Result.make_from_string("    ")
--			Result.append (get_cid)
--			Result.append ("->")
--			Result.append (get_pid)
--			Result.append ("->")
--			Result.append (get_props.material.get_name + ",")
--			Result.append (get_props.radioactivity.out)
--		end

	do_visit(visitor: T_VISITOR)
		do
			visitor.visit_container (current)
		end

invariant

	-- radioactivity >= 0
	radioactivity_is_not_negative:
		not (props.radioactivity < .0)


end
