note
	description: "Summary description for {ERROR_HANDLING}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

expanded class
	ERROR_HANDLING

feature -- Error Message Constants

	err_tracker_in_use: STRING = "current tracker is in use"
	err_max_phase_rad_negative: STRING = "max phase radiation must be non-negative value"
	err_max_con_rad_negative: STRING = "max container radiation must be non-negative value"
    err_max_con_greater_max_rad: STRING =  "max container must not be more than max phase radiation"
    err_name_start: STRING = "identifiers/names must start with A-Z, a-z or 0..9"
    err_ID_exists: STRING = "phase identifier already exists"
    err_cap_negative: STRING = "phase capacity must be a positive integer"
    err_no_materials: STRING = "there must be at least one expected material for this phase"
    err_ID_not_exists: STRING = "phase identifier not in the system"
    err_ID_in_tracker: STRING = "this container identifier already in tracker"
	err_con_exceed_phase_cap: STRING = "this container will exceed phase capacity"
    err_cod_exceed_safe: STRING = "this container will exceed phase safe radiation"
    err_mat_not_expected: STRING = "phase does not expect this container material"
   	err_con_exceed_rad_cap: STRING = "container radiation capacity exceeded"
   	err_ID_not_in_tracker: STRING = "this container identifier not in tracker"
    err_ID_same: STRING = "source and target phase identifier must be different"
    err_ID_not_in_phase: STRING = "this container identifier is not in the source phase"
    err_con_rad_negative: STRING = "this container radiation must not be negative"
    ok: STRING = "ok"

end
