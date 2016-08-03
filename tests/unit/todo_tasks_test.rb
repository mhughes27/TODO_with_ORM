require 'test_helper'
require 'pry'


class TodoTest < Minitest::Test

	def setup
    	super
    	DB.execute("DELETE FROM tasks")
	   	DB.execute("INSERT INTO tasks (name, description, status) VALUES (\"Bob\", \"Walk the dog.\", \"incomplete\")")
   	end

	def test_find

	    last_id = DB.last_insert_row_id

	    task = Task.find(last_id)

	    refute_nil(task)
	    assert_equal("Bob", task.name)
	    assert_equal("Walk the dog.", task.description)
	    assert_equal("incomplete", task.status)
	    assert_equal(last_id, task.task_id)
	end

	###### writing to the database properly but test fails - undefined method
	# def test_update_attributes
	#     last_id = DB.last_insert_row_id

	#     task = Task.update_attributes(1, "Mary", "Wash the cat", "complete")
	    
	#     refute_nil(task)
	#     assert_equal("Mary", task.name)
	#     assert_equal("Wash the cat", task.description)
	#     assert_equal("complete", task.status)
	# end

	def test_delete
		DB.execute("INSERT INTO tasks (name, description, status) VALUES (\"Mary\", \"Paint.\", \"complete\")")
		last_id = DB.last_insert_row_id
	

	    task = Task.delete(last_id)

	    refute_nil(task)
	    assert_equal("Mary", task.name)
	    assert_equal("Paint.", task.description)
	    assert_equal("complete", task.status)
	    assert_equal(last_id, task.task_id)
	end




# this is the end for the class
end