class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end

# Location: db/migrate/20210103123442_create_comments.rb
# The 't.references' line creates an integer column called 'article_id', an index for it, and a foreign key constraint that points to
# the 'id' columns of the 'articles' table.