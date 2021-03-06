require "pry"

# This is an example of what your models should look like, in terms
# of what methods and how they should work.
# 
# This is probably pretty different from how you built them last week!
# That's okay--we're introducing a new paradigm for thinking about
# models, so it's to be expected.

class User
  attr_reader :family_id, :name, :email
  attr_writer :family_id, :name, :email

  def initialize(family_id=nil, name, email)
    @name = name
    @email = email
    @family_id = family_id
  end

  # Find a record by its ID.
  # 
  # id = Integer of the ID to look for.
  # 
  # Returns a User object with all of the corresponding record's details.
  def User.find(family_id)
    records = DB.execute("SELECT * FROM family_members WHERE family_id = #{family_id}")
    record = records[0]

    User.new(record["family_id"], record["name"], record["email"] )
  
  end

  #####Deletes from database error on page load ########
  # Delete a user.
  # 
  # id - Integer of user's ID.
  # 
  # Returns the User object for the record that was just deleted.
  def User.delete(family_id)
    records = DB.execute("DELETE FROM family_members WHERE family_id=#{family_id};")
  end

# Save the current object to the database, and update the object with the ID
  # that the database assigns the record.
  # 
  # Returns the User object.
  def User.save(family_id, name, email)
    saved = DB.execute("INSERT INTO family_members (name, email) VALUES ('#{name}', '#{email}')")
    records = DB.execute("SELECT * FROM family_members WHERE family_id = #{family_id}")
    record = records[0]

    User.new(record["family_id"], record["name"], record["email"])
  end
  
# class
end