require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'bookmark_manager_test')

  # Clean the bookmarks table
  connection.exec("TRUNCATE bookmark;")
  #connection.exec("TRUNCATE bookmarks, comments, tags, bookmarks_tags, users;")
end



# require 'pg'

# p "Setting up test database..."

# connection = PG.connect(dbname: 'bookmark_manager_test')

# # Clear the bookmarks table
# connection.exec("TRUNCATE bookmark;")
