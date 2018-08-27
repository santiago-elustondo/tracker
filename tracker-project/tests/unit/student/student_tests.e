note
	description: "Summary description for {STUDENT_TESTS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	STUDENT_TESTS

inherit

	ES_TEST

create
	make

feature {NONE}

	make
		do
			add_boolean_case (agent t0)
			add_boolean_case (agent t1)
			add_boolean_case (agent t2)
			add_violation_case_with_tag ("max_phase_rad_is_positive", agent e2)
			add_violation_case_with_tag ("max_container_rad_is_positive", agent e3)
			add_violation_case_with_tag ("max_phase_rad_is_not_smaller_than_max_container_rad", agent e4)
			add_violation_case_with_tag ("pid_is_valid", agent e5)
			add_violation_case_with_tag ("phase_not_exists", agent e6)
			add_violation_case_with_tag ("capacity_not_smaller_than_sum_of_containers", agent e7)
			add_violation_case_with_tag ("materials_expected", agent e8)
			add_boolean_case (agent t3)
			add_boolean_case (agent t4)
			add_boolean_case (agent t5)
			add_violation_case_with_tag ("tracker_not_in_use", agent e1)
			add_violation_case_with_tag ("pid_exists", agent e9)
			add_violation_case_with_tag ("max_capacity_not_exceeded", agent e10)
			add_violation_case_with_tag ("max_capacity_not_exceeded", agent e11)
			add_violation_case_with_tag ("phase_rad_not_exceeded", agent e12)
			add_violation_case_with_tag ("material_expected", agent e13)
		end

feature

	tracker: T_TRACKER
		once
			Result := (create {T_TRACKER_ACCESS}).m
		end

	glass: INTEGER_64
		once
			Result := ((create {T_MATERIAL_ACCESS}).glass).get_mid
		end

	liquid: INTEGER_64
		once
			Result := ((create {T_MATERIAL_ACCESS}).liquid).get_mid
		end

	metal: INTEGER_64
		once
			Result := ((create {T_MATERIAL_ACCESS}).metal).get_mid
		end

	plastic: INTEGER_64
		once
			Result := ((create {T_MATERIAL_ACCESS}).plastic).get_mid
		end



feature
	t0: BOOLEAN
		local
			x,y: VALUE
		do
			comment("t0: Creation of Tracker")
			x := create{VALUE}.make_from_int (12)
			y := create{VALUE}.make_from_int (10)
			tracker.new_tracker (x, y)
			Result := tracker.get_max_phase_rad = 12.0
			Check Result end
			Result := tracker.get_max_container_rad = 10.0
			Check Result end
		end

	t1: BOOLEAN
		local
			phase: T_PHASE
		do
			comment("t1: Create New Phase")
			create phase.make ("pid1", "p1", 2, <<glass, metal, plastic>>)
			tracker.add_phase (phase)
			Result := tracker.has_phase ("pid1")
			Check Result end
			Result := tracker.get_phase ("pid1").get_pid ~ "pid1"
			Check Result end
			Result := tracker.get_phase ("pid1").get_name ~ "p1"
			Check Result end
			Result := tracker.get_phase ("pid1").get_materials.as_integer_array ~ <<glass, metal, plastic>>
			Check Result end
		end

	t2: BOOLEAN
		local
			phase: T_PHASE
		do
			comment ("t2: Remove Phase")
			phase := tracker.get_phase ("pid1")
			tracker.remove_phase ("pid1")
			Result := not tracker.has_phase ("pid1")
			Check result end
			tracker.add_phase (phase)
			create phase.make ("pid2", "p2", 1, <<plastic, liquid, metal>>)
			tracker.add_phase (phase)
		end

	t3: BOOLEAN
		local
			container: T_CONTAINER
			phase: T_PHASE
			x: VALUE
		do
			x := create{VALUE}.make_from_int (5)
			comment("t3: Create New Contaner")
			phase := tracker.get_phase ("pid1")
			create container.make ("cid1", "pid1", [metal, x])
			phase.add_container(container)
			Result := attached tracker.find_container ("cid1")
			Check Result end
			Result := phase.get_container ("cid1").get_cid ~ "cid1"
			Check Result end
			Result := phase.get_container ("cid1").get_pid ~ "pid1"
			Check Result end
			Result := phase.get_container ("cid1").get_props.material ~ (create {T_MATERIAL_FACTORY}.default_create).parse_material(metal)
			Check Result end
			Result := phase.get_container ("cid1").get_props.radioactivity ~ 5.0
			Check Result end
		end

	t4: BOOLEAN
		local
			container: T_CONTAINER
		do
			comment("t4: Move Container")
			container := tracker.get_phase ("pid1").get_container ("cid1")
			tracker.move_container (container, "pid1", "pid2")
			Result := tracker.find_container ("cid1") ~ tracker.get_phase ("pid2")
			check Result end
			Result := tracker.get_phase("pid2").get_container ("cid1").get_pid ~ "pid2"
			check Result end
		end

	t5: BOOLEAN
		local
			container: T_CONTAINER
			phase: T_PHASE
		do
			comment("t5: Remove Container")
			phase := tracker.get_phase ("pid2")
			container := phase.get_container ("cid1")
			phase.remove_container ("cid1")
			Result := not attached tracker.find_container ("cid1")
			Check Result end
			phase.add_container (container)
		end

	e1
		local
			x,y: VALUE
		do
			comment("e1: current tracker is in use")
			x := create{VALUE}.make_from_int (10)
			y := create{VALUE}.make_from_int (10)
			tracker.new_tracker (x, y)
		end

	e2
		local
			x,y: VALUE
		do
			comment("e2: max phase radiation must be non-negative value")
			x := create{VALUE}.make_from_int (-50)
			y := create{VALUE}.make_from_int (10)
			tracker.new_tracker (x, y)
		end

	e3
		local
			x,y: VALUE
		do
			comment("e3: max container radiation must be non-negative value")
			x := create{VALUE}.make_from_int (50)
			y := create{VALUE}.make_from_int (-10)
			tracker.new_tracker (x, y)
		end
	e4
		local
			x,y: VALUE
		do
			comment("e4: max container must not be more than max phase radiation")
			x := create{VALUE}.make_from_int (5)
			y := create{VALUE}.make_from_int (10)
			tracker.new_tracker (x, y)
		end

	e5
		local
			phase: T_PHASE
		do
			comment("e5: identifiers/names must start with A-Z, a-z or 0..9")
			create phase.make ("$pid1", "p1", 1, <<glass, metal, plastic>>)
			tracker.add_phase (phase)
		end

	e6
		local
			phase: T_PHASE
		do
			comment("e6: phase identifier already exists")
			create phase.make ("pid1", "p1", 1, <<glass, metal, plastic>>)
			tracker.add_phase (phase)
			tracker.add_phase (phase)
		end

	e7
		local
			phase: T_PHASE
		do
			comment("e7: phase capacity must be a positive integer")
			create phase.make ("pid0", "p1", -1, <<glass, metal, plastic>>)
			tracker.add_phase (phase)
		end

	e8
		local
			phase: T_PHASE
		do
			comment("e8: phase capacity must be a positive integer")
			create phase.make ("pid0", "p1", 1, <<>>)
			tracker.add_phase (phase)
		end

	e9
		local
			container: T_CONTAINER
			x: VALUE
		do
			x := create{VALUE}.make_from_int (5)
			comment("e9: phase identifier not in the system")
			create container.make ("cid1", "pid0", [metal, x])
			tracker.get_phase("pid0").add_container(container)
		end

	e10
		local
			container: T_CONTAINER
			x: VALUE
		do
			x := create{VALUE}.make_from_int (5)
			comment("e10: this container identifier already in tracker")
			create container.make ("cid1", "pid2", [metal, x])
			tracker.get_phase("pid2").add_container(container)
		end

	e11
		local
			container: T_CONTAINER
			x: VALUE
		do
			x := create{VALUE}.make_from_int (5)
			comment("e11: this container will exceed phase capacity")
			create container.make ("cid0", "pid2", [metal, x])
			tracker.get_phase("pid2").add_container(container)
		end

	e12
		local
			container: T_CONTAINER
			x: VALUE
		do
			x := create{VALUE}.make_from_int (9)
			comment("e12: this container will exceed phase safe radiation")
			create container.make ("cid0", "pid1", [metal, x])
			tracker.get_phase("pid1").add_container(container)
			container := tracker.get_phase ("pid2").get_container ("cid1")
			tracker.move_container (container, "pid2", "pid1")
		end

	e13
		local
			container: T_CONTAINER
			x: VALUE
		do
			x := create{VALUE}.make_from_int (1)
			comment("e13: phase does not expect this container material")
			tracker.get_phase ("pid1").remove_container ("cid0")
			create container.make ("cid0", "pid1", [liquid, x])
			tracker.get_phase("pid1").add_container(container)
		end

end
