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

create
	make

feature { NONE } --state
	implementation: ARRAY[G];
	cursor: INTEGER


feature { ANY } -- constructors

	make
		do
			create implementation.make_empty
			cursor := 0
		end

feature { ANY } -- queries

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


feature { ANY } -- commands

	add(item: G)
		do
			clear_future
			next_element
			implementation.force(item, cursor)
		ensure
			cursor_incremented: cursor = old cursor + 1
			current_item_is_new_one: get_element = item
			no_future: not has_future
		end

	prev_element
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
			no_future: not has_future
			cursor_end_position: cursor = implementation.count
		end

	clear_past
		do
			implementation := array_slice(implementation, cursor, implementation.upper)
			cursor := 1
		ensure
			no_past: not has_past
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


feature { NONE } -- utils

	-- utility for retrieving a subsection of an array.
	-- indexes are inclusive, which means the item at `a_end_index` will be included
	--   in the resulting sub-array
	array_slice(a_array:ARRAY[G]; a_start_index:INTEGER; a_end_index:INTEGER): ARRAY[G]
		local
			i:INTEGER
		do
			create Result.make_empty
			from
				i := -1
			until
				(a_end_index - a_start_index) - i <= 0
			loop
				Result.force(a_array[a_start_index + i + 1], i + 2)
				i := i + 1
			end
		end

invariant
	cursor_is_non_negative: cursor >= 0
	cursor_is_not_larger_than_history_count: cursor <= implementation.count
	no_future_if_max_cursor: has_future implies (cursor < implementation.count)
end
