note
	description: "Summary description for {T_VISITOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	T_VISITOR

feature
	visit_phase(phase: T_PHASE)
			-- handles output for `phase'
		deferred end

	visit_container(con: T_CONTAINER)
			-- handles output for `con'
		deferred end

	visit_materials(mat: T_MATERIAL_SET)
			-- handles output for `mat'
		deferred end

	visit_tracker(tracker: T_TRACKER)
			-- handled output for `tracker'
		deferred end
		
end
