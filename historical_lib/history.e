note
	description: "Summary description for {HISTORY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"
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

	is_first : BOOLEAN
		do
			Result := cursor = 1
		end

	get_element: G
		do
			Result := implementation[cursor]
		end


feature { ANY } -- commands

	add(i: G)
		do
			clear_future
			next_element
			implementation.force(i, cursor)
		end

	prev_element
		do
			cursor := cursor - 1
		end

	next_element
	 	do
	 		cursor := cursor + 1
	 	end

	clear_future
		do
			implementation := array_slice(implementation, implementation.lower, cursor)
		end

	clear_past
		do
			implementation := array_slice(implementation, cursor, implementation.upper)
			cursor := 1
		end

	clear_all
		do
			make
		end


feature { NONE } -- utils

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

end
