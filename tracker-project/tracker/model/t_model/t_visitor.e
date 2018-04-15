note
	description: "Summary description for {T_VISITOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	T_VISITOR

feature
	visit_phase(phase: T_PHASE)
		deferred end

	visit_container(con: T_CONTAINER)
		deferred end

	visit_materials(mat: T_MATERIAL_SET)
		deferred end

	visit_tracker(tracker: T_TRACKER)
		deferred end
end
