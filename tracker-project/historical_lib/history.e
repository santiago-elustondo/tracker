note
	description: "Summary description for {HISTORY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

-- this is a general purpose utility class for keeping track of
--   an ordered history of like-items, with the ability to backtrack.
-- it will accept and hold items of a generic type in chronological order.
class
	HISTORY[G]

inherit
	ANY
		redefine is_equal end

create
	make

feature { HISTORY } --state
	implementation: ARRAY[G];
	cursor: INTEGER


feature { NONE } -- constructors

	make
		do
			create implementation.make_empty
			implementation.compare_objects
			cursor := 0
		end

feature -- queries

	has_past: BOOLEAN
		do
			Result := cursor > 0
		end

	has_future: BOOLEAN
		do
			Result := cursor < implementation.count
		end

	get_element: G
		do
			Result := implementation[cursor]
		end

	added alias "|->"(item: G): like current
		do
			Result := current.deep_twin
			Result.add (item)
--		ensure
--			cursor_incremented: result.cursor = old result.cursor + 1
--			current_item_is_new_one: result.get_element = item
--			no_future: not not has_future
		end

	no_future: like current
		do
			Result := current.deep_twin
			Result.clear_future
--		ensure
--			cursor_end_position: result.cursor = result.implementation.count
		end

	no_past: like current
		do
			Result := current.deep_twin
			Result.clear_past
--		ensure
--			cursor_start_position: cursor = 1
		end



feature { HISTORICAL, HISTORY } -- commands

	add(item: G)
		do
			clear_future
			next_element
			implementation.force(item, cursor)
		ensure
			cursor_incremented: cursor = old cursor + 1
			current_item_is_new_one: get_element = item
			no_future: not has_future
			item_added: current ~ (old current.deep_twin |-> (item))
		end

	prev_element
		require
			not_first: has_past
		do
			cursor := cursor - 1
	 	ensure
	 		cursor = old cursor - 1
		end

	next_element
	 	do
	 		cursor := cursor + 1
	 	ensure
	 		cursor = old cursor + 1
	 	end

	clear_future
		do
			implementation := array_slice(implementation, implementation.lower, cursor)
		ensure
			cursor_end_position: cursor = implementation.count
			no_future: current ~ old current.deep_twin.no_future
		end

	clear_past
		do
			implementation := array_slice(implementation, cursor, implementation.upper)
			cursor := 1
		ensure
			no_past: current ~ old current.deep_twin.no_past
			cursor_start_position: cursor = 1
		end

	clear_all
		do
			make
		ensure
			no_past: not has_past
			no_future: not has_future
			cursor_end_position: cursor = implementation.count
			cursor_start_position: cursor = 0
		end

feature{ HISTORY }

--	is_equal(other: like current): BOOLEAN
--		do
--			if current = other then
--				Result := true
--			elseif cursor /= other.cursor then
--				Result := false
--			elseif implementation /~ other.implementation then
--				Result := false
--			else
--				Result := true
--			end
--		end

	is_equal(other: like current): BOOLEAN
		do
			Result := current = other
			or else cursor = other.cursor
			and then implementation ~ other.implementation
		end


feature { NONE } -- utils

	-- utility for retrieving a subsection of an array.
	-- indexes are inclusive, which means the item at `a_end_index` will be included
	--   in the resulting sub-array
	array_slice(a_array:ARRAY[G]; a_start_index:INTEGER; a_end_index:INTEGER): ARRAY[G]
		local
			i:INTEGER
		do
			create Result.make_empty
			Result.compare_objects
			from
				i := -1
			until
				(a_end_index - a_start_index) - i <= 0
			loop
				Result.force(a_array[a_start_index + i + 1], i + 2)
				i := i + 1
			end
		end

	-- utility class for comparing arrays

--	arrays_have_same_items(a_array: ARRAY[G]; a_array_2: ARRAY[G]): BOOLEAN
--		local
--			i: INTEGER
--		do
--			result := true
--			if not ( a_array.count = a_array_2.count ) then
--				result := false
--			else
--				from
--					i := 1
--				until
--					i > a_array.count
--				loop
--					if not ( a_array[i] = a_array_2[i] ) then
--						result := false
--					end
--					i := i + 1
--				end
--			end
--		end

	arrays_have_same_items(a_array: ARRAY[G]; a_array_2: ARRAY[G]): BOOLEAN
		do
			Result := (a_array.count = a_array_2.count)
			if result then
				result := across 1 |..| a_array.count as a all a_array[a.item] = a_array_2[a.item] end
			end
		end

invariant
	cursor_is_non_negative: cursor >= 0
	cursor_is_not_larger_than_history_count: cursor <= implementation.count
	no_future_if_max_cursor: has_future implies (cursor < implementation.count)
end
