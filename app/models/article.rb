class Article < ApplicationRecord
  # include Visible
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end

# Location: app/models/article.rb
# The first validation declares that a 'title' value must be present.
# Because 'title' is a string, this means that the 'title' value must contain at least one non-whitespace character.

# The second validation declares that a 'body' value must also be present.
# Additionally, it declares that the 'body' value must be at least 10 characters long.

# You may be wondering where the 'title' and 'body' attributes are defined.
# Active Record automatically defines model attributes for every table column, so you don't have to declare those attributes 
# in your model file.

# With comments available, you'll need to add 'has_many :comments' to add the other side of the association.
# This declaration enables a good bit of automatic behavior.
# For example, if you have an instance variable '@article' containing an article, you can retrieve all the comments belonging to that
# article as an array using '@article.comments'.

# A given blog article might have various statuses - for instance, it might be visible to everyone (i.e. 'public'),
# or only visible to the author (i.e. 'private').
# It may also be hidden to all but still retrievable (i.e. 'archived').
# comments may similarly be hidden or visible.
# This could be represented using a 'status' column in each model.

# After adding 'visible.rb', we can remove the duplicated logic from the model and instead include our new 'Visible' module.

# If you delete an article, its associated comments will also need to be deleted, otherwise they would simply occupy space in the
# database. Rails allows you to use the 'dependent' option of an association to achieve this.