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
	def test_update_attributes
	    last_id = DB.last_insert_row_id

	    update = Task.update_attributes(last_id, "Mary", "Wash the cat", "complete")
	    

	    refute_nil(update)
	    assert_equal("Mary", update.name)
	    assert_equal("Wash the cat", update.description)
	    assert_equal("complete", update.status)
	end

	def test_save

		saved = Task.save("Mary", "Unload the diswasher", "incomplete")

		refute_nil(saved)
	    assert_equal("Mary", saved.name)
	    assert_equal("Unload the diswasher", saved.description)
	    assert_equal("incomplete", saved.status)
	end


	def test_delete
		DB.execute("INSERT INTO tasks (name, description, status) VALUES (\"Mary\", \"Paint.\", \"complete\")")
		
		last_id = DB.last_insert_row_id
	  
		Task.delete(last_id)

	    result = DB.execute("SELECT * FROM tasks WHERE task_id = #{last_id}")

	    assert_equal(0, result.length)
	    
	end

	def test_filter1
		DB.execute("INSERT INTO tasks (name, description, status) VALUES (\"Mary\", \"Paint.\", \"complete\")")
		DB.execute("INSERT INTO tasks (name, description, status) VALUES (\"Bob\", \"Clean.\", \"complete\")")
		DB.execute("INSERT INTO tasks (name, description, status) VALUES (\"Mary\", \"Sweep.\", \"complete\")")
		DB.execute("INSERT INTO tasks (name, description, status) VALUES (\"Mary\", \"Vacuum.\", \"incomplete\")")
		DB.execute("INSERT INTO tasks (name, description, status) VALUES (\"Lisa\", \"Dust.\", \"incomplete\")")
		DB.execute("INSERT INTO tasks (name, description, status) VALUES (\"Joe\", \"Walk.\", \"incomplete\")")

		filtered = Task.filter1("complete")

		refute_nil(filtered)
		assert_kind_of(Array, filtered)
		assert_equal(filtered.length, 3)
		assert_equal(filtered[0].status, "complete")	
		assert_equal(filtered[1].status, "complete")
		assert_equal(filtered[2].status, "complete")

	end


	def test_filter2
		DB.execute("INSERT INTO tasks (name, description, status) VALUES (\"Mary\", \"Paint.\", \"complete\")")
		DB.execute("INSERT INTO tasks (name, description, status) VALUES (\"Bob\", \"Clean.\", \"complete\")")
		DB.execute("INSERT INTO tasks (name, description, status) VALUES (\"Mary\", \"Sweep.\", \"complete\")")
		DB.execute("INSERT INTO tasks (name, description, status) VALUES (\"Mary\", \"Vacuum.\", \"incomplete\")")
		DB.execute("INSERT INTO tasks (name, description, status) VALUES (\"Lisa\", \"Dust.\", \"incomplete\")")
		DB.execute("INSERT INTO tasks (name, description, status) VALUES (\"Joe\", \"Walk.\", \"incomplete\")")

		filtered = Task.filter2("Mary", "complete")

		refute_nil(filtered)
		assert_kind_of(Array, filtered)
		assert_equal(filtered.length, 2)
		assert_equal(filtered[0].name, "Mary")
		assert_equal(filtered[0].status, "complete")	
		assert_equal(filtered[1].name, "Mary")
		assert_equal(filtered[1].status, "complete")	   
	end


# this is the end for the class
end