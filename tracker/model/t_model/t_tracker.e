note
	description: "A default business model."
	author: "Jackie Wang"
	date: "$Date$"
	revision: "$Revision$"

class
	T_TRACKER


inherit
	HISTORICAL[T_TRACKER_ACTION]
		redefine
			make,
			out
		end

create {T_TRACKER_ACCESS}
	make


feature{NONE}

	max_phase_rad: VALUE
	max_container_rad: VALUE
	phases: STRING_TABLE[T_PHASE]

feature -- constructors

	make
		do
			precursor
			create phases.make (10)
			garbage_make
		end

	wipe_out(a_max_phase_rad: VALUE; a_max_container_rad: VALUE)
		do
			make
			max_phase_rad := a_max_phase_rad
			max_container_rad := a_max_container_rad
		end


feature -- garbage
	garbage_make
			-- Initialization for `Current'.
		do
			create s.make_empty
			i := 0
		end

	s : STRING
	i : INTEGER
	default_update
		do
			i := i + 1
		end

	reset
		do
			make
		end

feature -- queries

	tracker_in_use: BOOLEAN
		do
			across phases as p loop
				Result := Result or else p.item.get_count = 0
			end
		end

	get_max_phase_rad: VALUE
		do
			Result := max_phase_rad
		end

	get_max_container_rad: VALUE
		do
			Result := max_container_rad
		end

	has_phase(pid: STRING): BOOLEAN
		do
			Result := phases.has (pid)
		end

	get_phase(pid: STRING): T_PHASE
		do
			check attached phases.item (pid) as p then
				Result := p
			end
		end

	has_container(cid: STRING): BOOLEAN
		do
			across phases as p loop Result := (Result or else p.item.has_container (cid)) end
		end

	out : STRING
		do
			create Result.make_from_string ("  ")
			Result.append ("System State: default model state ")
			Result.append ("(")
			Result.append (i.out)
			Result.append (")")
		end

end
