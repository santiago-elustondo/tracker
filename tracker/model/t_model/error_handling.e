 note
	description: "Summary description for {ERROR_HANDLING}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

expanded class
	ERROR_HANDLING

feature -- Error Message Constants

	err_tracker_in_use: STRING = "e1: current tracker is in use"
	err_max_phase_rad_negative: STRING = "e2: max phase radiation must be non-negative value"
	err_max_con_rad_negative: STRING = "e3: max container radiation must be non-negative value"
    err_max_con_greater_max_rad: STRING =  "e4: max container must not be more than max phase radiation"
    err_name_start: STRING = "e5: identifiers/names must start with A-Z, a-z or 0..9"
    err_phase_ID_exists: STRING = "e6: phase identifier already exists"
    err_phase_cap_negative: STRING = "e7: phase capacity must be a positive integer"
    err_phase_no_materials: STRING = "e8: there must be at least one expected material for this phase"
    err_phase_ID_not_exists: STRING = "e9: phase identifier not in the system"
    err_con_ID_exists: STRING = "e10: this container identifier already in tracker"
	err_con_exceed_phase_cap: STRING = "e11: this container will exceed phase capacity"
    err_con_exceed_safe: STRING = "e12: this container will exceed phase safe radiation"
    err_phase_mat_not_expected: STRING = "e13: phase does not expect this container material"
   	err_con_exceed_rad_cap: STRING = "e14: container radiation capacity exceeded"
   	err_con_ID_not_exists: STRING = "e15: this container identifier not in tracker"
    err_phase_ID_same: STRING = "e16: source and target phase identifier must be different"
    err_con_ID_not_in_phase: STRING = "e17: this container identifier is not in the source phase"
    err_con_rad_negative: STRING = "e18: this container radiation must not be negative"
    err_ok: STRING = "ok"

end
