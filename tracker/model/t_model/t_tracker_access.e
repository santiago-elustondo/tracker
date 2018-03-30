note
	description: "Singleton access to the default business model."
	author: "Jackie Wang"
	date: "$Date$"
	revision: "$Revision$"

expanded class
	T_TRACKER_ACCESS

feature
	m: T_TRACKER
		once
			create Result.make
		end

invariant
	m = m
end




