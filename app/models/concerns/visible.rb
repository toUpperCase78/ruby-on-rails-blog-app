module Visible
  extend ActiveSupport::Concern
  
  included do	
    VALID_STATUSES = ['public', 'private', 'archived']
	validates :status, in: VALID_STATUSES
  end
  
  #class_methods do
  #  def public_count
  #	   where(status: 'public').count
  #  end
  #end
  
  def acrhived?
    status == 'archived'
  end
end

# Location: app/models/concerns/visible.rb
# A concern is only responsible for a focused subset of the model's responsibility; the methods in our concern will all be related to
# the visibility of a model.

# We can add our status validation to the concern, but this is slightly more complex as validations are methods called at the class level.
# The ActiveSupport::Concern gives us a simpler way to include them.

# Class methods can also be added to concerns.
# If we want a count of public articles or comments to display on our main page, we might add a class method to Visible as above.