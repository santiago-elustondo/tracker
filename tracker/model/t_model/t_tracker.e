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


feature

	max_phase_rad: VALUE
	max_container_rad: VALUE
	phases: STRING_TABLE[T_PHASE]
	error: STRING

feature -- commands

	make
		do
			precursor
			create phases.make (10)
			error := ""
		end

	reset
		do
			make
		end

	wipe_out(a_max_phase_rad: VALUE; a_max_container_rad: VALUE)
		do
			make
			max_phase_rad := a_max_phase_rad
			max_container_rad := a_max_container_rad
		end

	add_phase(a_phase: T_PHASE)
		do
			phases.put(a_phase, a_phase.get_pid)
		end

	remove_phase(a_pid: STRING)
		do
			phases.remove(a_pid)
		end

	set_error(a_error: STRING)
		do
			error := a_error
		end



feature -- garbage

	i : INTEGER
	default_update
		do
			i := i + 1
		end


feature -- queries

	tracker_in_use: BOOLEAN
		do
			Result := across phases as p some
				p.item.get_count /= 0
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
			Result := across phases as p some
				p.item.has_container (cid)
			end
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
