# class Tasks
# 	def all_tasks
# 		DB.execute("SELECT * FROM tasks;")
# 	end

# 	def completed_tasks
# 		DB.execute("SELECT * FROM tasks WHERE status=\"complete\";")
# 	end

# 	def incomplete_tasks
# 		DB.execute("SELECT * FROM tasks WHERE status=\"incomplete\";")
# 	end

# 	def create_task(name, task, status)
# 		DB.execute("INSERT INTO tasks (name, description, status) VALUES (\"#{name}\", \"#{task}\", \"#{status}\");")
# 	end

# 	def filtered_todo(name)
# 		DB.execute("SELECT * FROM tasks WHERE name=\"#{name}\" and status=\"incomplete\";")
# 	end

# 	def filtered_done(name) 
# 		DB.execute("SELECT * FROM tasks WHERE name=\"#{name}\" and status=\"complete\";")
# 	end

# 	def delete_task(task_id)
# 		DB.execute("DELETE FROM tasks WHERE task_id=#{task_id};")
# 	end

# 	def task_to_edit(task_id)
# 		DB.execute("SELECT * FROM tasks WHERE task_id=#{task_id};")
# 	end

# 	def edit_task(task_id, name, description, status)
# 		DB.execute("UPDATE tasks SET name=\"#{name}\", description=\"#{description}\", status=\"#{status}\" WHERE task_id=#{task_id};")
# 	end


	

# # the class end
# end
