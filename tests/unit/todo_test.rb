require 'test_helper'

class TodoTest < Minitest::test

	def test_update_attributes()
	    DB.execute("INSERT INTO tasks (name, description, status) VALUES ('Bob', 'Wash the car', 'incomplete')")

	    last_id = DB.last_insert_row_id

	    user = Task.find(last_id)

	    user.update_attributes({"description" => "Wash the cat"})

	    assert_equal("Wash the cat", task.description)
	end

	# def test_find
	#     DB.execute("INSERT INTO users (name) VALUES ('Josh')")

	#     last_id = DB.last_insert_row_id

	#     user = User.find(last_id)

	#     refute_nil(user)
	#     assert_equal("Josh", user.name)
	#     assert_equal(last_id, user.id)
	# end


# this is the end for the class
end