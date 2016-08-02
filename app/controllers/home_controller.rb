MyApp.get "/" do


# basic functions
@tasks = Tasks.new.all_tasks
@incomplete = Tasks.new.incomplete_tasks
@complete = Tasks.new.completed_tasks

erb :"home"

end


MyApp.get "/new" do
	erb :"new"
end

MyApp.post "/new/process" do

	# @rightEmail = Task.sortByName(params[:person], "Bob", "Mary", "Joe", "Lisa", "michaeljducey@gmail.com", "michaeljducey@gmail.com", "mhughes27@gmail.com", "mhughes27@gmail.com")
	# sendEmail = Task.sendTaskReminder(@rightEmail, params[:person], params[:task])
	@newtask = Tasks.new.create_task(params[:person], params[:task], params[:status])
	
	redirect '/'
end


MyApp.get "/filtered" do
	@member = params[:user]
	@filtered_todo = Tasks.new.filtered_todo(params[:user])
	@filtered_done = Tasks.new. filtered_done(params[:user])

	erb :"filtered"
end

MyApp.post '/delete' do
   @delete = Tasks.new.delete_task(params[:task_id])
   redirect '/'
 end

MyApp.post "/edit" do
	@description = params[:description]
	@name = params[:name]
	@status = params[:status]


	@task_to_edit = Tasks.new.task_to_edit(params[:task_id])

	erb :"edit"
end

MyApp.post "/edit/process" do
	@edited_task = Tasks.new.edit_task(params[:task_id], params[:name], params[:description], params[:status])
	redirect '/'
end

