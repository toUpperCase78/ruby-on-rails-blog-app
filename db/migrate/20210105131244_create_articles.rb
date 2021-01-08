class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end

# Location: db/migrate/20210201131244_create_articles.rb
# The call to 'create_table' specifies how the 'articles' table should be constructed. By default, the 'create_table' method adds an
# 'id' column as an auto-incrementing primary key. So, the first record in the table will have an 'id' of 1, the next record will have
# an 'id' of 2, and so on.

# Inside the block for 'create_table', two columns are defined: 'title' and 'body'.
# These were added by the generator because we included them in our generate command:
# ruby bin/rails generate model Article title:string body:text

# On the last line of the block is a call to 't.timestamps'. This methos defines two additional columns named 'created_at' and 'updated_at'.
# Rails will manage these for us, setting the values when we create or update a model object.
