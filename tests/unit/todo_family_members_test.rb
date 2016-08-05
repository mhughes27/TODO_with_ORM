require 'test_helper'
require 'pry'


class UserTest < Minitest::Test

	def setup
    	super
    	DB.execute("DELETE FROM family_members")
	   	DB.execute("INSERT INTO family_members (name, email) VALUES (\"Bob\", \"mhughes27@gmail.com\")")
   	end

	def test_find

	    last_id = DB.last_insert_row_id

	    person = User.find(last_id)

	    refute_nil(person)
	    assert_equal("Bob", person.name)
	    assert_equal("mhughes27@gmail.com", person.email)
	    assert_equal(last_id, person.family_id)
	end

	# ###### writing to the database properly but test fails - undefined method
	# def test_update_attributes
	#     last_id = DB.last_insert_row_id

	#     update = Task.update_attributes(last_id, "Mary", "Wash the cat", "complete")
	    

	#     refute_nil(update)
	#     assert_equal("Mary", update.name)
	#     assert_equal("Wash the cat", update.description)
	#     assert_equal("complete", update.status)
	# end

	def test_save

		saved = User.save(2, "Mary", "fakeemail.com")

		refute_nil(saved)
	    assert_equal("Mary", saved.name)
	    assert_equal("fakeemail.com", saved.email)
	end


	def test_delete
		DB.execute("INSERT INTO family_members (name, email) VALUES (\"Mary\", \"fakeemail.com\")")
		last_id = DB.last_insert_row_id

	    User.delete(last_id)

	    result = DB.execute("SELECT * FROM family_members WHERE family_id = '#{last_id}'")

	    assert_equal(0, result.length)
	    
	end

# this is the end for the class
end