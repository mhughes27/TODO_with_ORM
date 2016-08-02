# This is an example of what your models should look like, in terms
# of what methods and how they should work.
# 
# This is probably pretty different from how you built them last week!
# That's okay--we're introducing a new paradigm for thinking about
# models, so it's to be expected.

class User
  attr_reader :name, :id
  attr_writer :name

  def initialize(name, id=nil)
    @name = name

    @id = id
  end

  # Find a record by its ID.
  # 
  # id = Integer of the ID to look for.
  # 
  # Returns a User object with all of the corresponding record's details.
  def User.find(id)
    records = DB.execute("SELECT * FROM users WHERE id = #{id}")
    record = records[0]

    User.new(record["name"], record["id"])
  end

  # Search the table for all records matching some key/value pairs.
  # 
  # search_parameters - Hash containing parameters to search for.
  # 
  # Examples
  # 
  #   User.where({"name" => "Chelsea"})
  #   # => [<#User:4s2738z4c @id=3 @name="Chelsea">]
  # 
  # Returns an Array containing User objects for the matching records.
  def User.where(search_parameters)
    # TODO
  end

  # Delete a user.
  # 
  # id - Integer of user's ID.
  # 
  # Returns the User object for the record that was just deleted.
  def User.delete(id)
    # TODO
  end

  # Get all of a user's tasks.
  # 
  # Returns an Array of Task objects which represent all of
  # this user's task records.
  def tasks
    # TODO
  end

  # Save the current object to the database, and update the object with the ID
  # that the database assigns the record.
  # 
  # Returns the User object.
  def save
    DB.execute("INSERT INTO users (name) VALUES ('#{name}')")
    @id = DB.last_insert_row_id

    return self
  end

  # Update some, any, all attributes of a particular record.
  # 
  # The function will loop through the attributes_hash and, for each
  # key and value, it will update that row in the database to reflect
  # the attributes.
  # 
  # attributes_hash - Hash containing some keys/values for this record.
  # 
  # Returns the User object, after it's been modified.
  def update_attributes(attributes_hash)
    # TODO

    @name = attributes_hash["name"]

    return self
  end
end