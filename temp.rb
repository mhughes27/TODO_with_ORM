require "pry"
require "sqlite3"


# Open a database
db = SQLite3::Database.new "TODO.db"
db.results_as_hash = true


tasks = db.execute("SELECT * FROM tasks;")



puts "Done"