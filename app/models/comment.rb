class Comment < ApplicationRecord
  # include Visible
  belongs_to :article
end

# Location: app/models/comment.rb
# This is very similar to the 'Article' model that you saw earlier.
# The difference is the line 'belongs_to :article', which sets up an Active Record association.

# The (:references) keyword used in the bash command is a special data type for models.
# It creates a new column on your database table with the provided model name appended with an '_id' that can hold integer values.
# To get a better understanding, analyze the 'db/schema.rb' file after running the migration.

# After adding 'visible.rb', we can remove the duplicated logic from the model and instead include our new 'Visible' module.