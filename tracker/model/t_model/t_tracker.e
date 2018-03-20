note
	description: "A default business model."
	author: "Jackie Wang"
	date: "$Date$"
	revision: "$Revision$"

class
	T_TRACKER


inherit
	ANY
		redefine
			out
		end

create {T_TRACKER_ACCESS}
	make


feature

	max_phase_rad: VALUE
	max_container_rad: VALUE
	phases: STRING_TABLE[T_PHASE]

	make
		do
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
	out : STRING
		do
			create Result.make_from_string ("  ")
			Result.append ("System State: default model state ")
			Result.append ("(")
			Result.append (i.out)
			Result.append (")")
		end

end
