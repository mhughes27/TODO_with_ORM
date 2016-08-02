require "pry"

# This is an example of what your models should look like, in terms
# of what methods and how they should work.
# 
# This is probably pretty different from how you built them last week!
# That's okay--we're introducing a new paradigm for thinking about
# models, so it's to be expected.

class Task
  attr_reader :task_id, :name, :description, :status
  attr_writer :name, :description, :status

  def initialize(task_id=nil, name, description, status)
    @task_id = task_id
    @name = name
    @description = description
    @status = status
  end

# class end
end