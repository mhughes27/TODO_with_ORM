require "pry"

# This is an example of what your models should look like, in terms
# of what methods and how they should work.
# 
# This is probably pretty different from how you built them last week!
# That's okay--we're introducing a new paradigm for thinking about
# models, so it's to be expected.

class Task
  attr_reader :task_id, :name, :description, :status
  attr_writer :task_id, :name, :description, :status

  def initialize(task_id=nil, name, description, status)
    @task_id = task_id
    @name = name
    @description = description
    @status = status
  end

  # Find a record by its ID.
  # 
  # id = Integer of the ID to look for.
  # 
  # Returns a Task object with all of the corresponding record's details.
  def Task.find(task_id)
    records = DB.execute("SELECT * FROM tasks WHERE task_id = #{task_id}")
    record = records[0]

    Task.new(record["task_id"], record["name"], record["description"], record["status"])
  end

  # Delete a task.
  # 
  # id - Integer of task's ID.
  # 
  # Returns the Task object for the record that was just deleted.
  def Task.delete(task_id)
    records = DB.execute("DELETE FROM tasks WHERE task_id = #{task_id}")
    record = records[0]

    Task.new(record["task_id"], record["name"], record["description"], record["status"])
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
  def update_attributes(task_id, name, description, status)
    DB.execute("UDATE tasks SET name=\"#{{name}\", description=\"#{description}\", status=\"#{status}\" WHERE id=#{task_id}")

    @name = name
    @description = description
    @status = status
    return self
  end



# class end
end