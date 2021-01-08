class CommentsController < ApplicationController
  http_basic_authenticate_with name: "yigit", password: "railsblog", only: :destroy
  
  def create
    @article = Article.find(params[:article_id])
	@comment = @article.comments.create(comment_params)
	redirect_to article_path(@article)
  end
  
  def destroy
    @article = Article.find(params[:article_id])
	@comment = @article.comments.find(params[:id])
	@comment.destroy
	redirect_to article_path(@article)
  end
  
  private
    def comment_params
	  params.require(:comment).permit(:commenter, :body)
	end
end

# Location: app/controllers/comments_controller.rb
# You'll see a bir more complexity here than you did in the controller for articles.
# That's a side-effect of the nesting that you've set up.
# Each request for a comment has to keep track of the article to which the comment is attached, thus the initial call to the 'find'
# method of the 'Article' model to get the article in question.

# In addition, the code takes advantage of some of the methods available for an association.
# We use the 'create' method on '@article.comments' to create and save the comment.
# This will automatically link the comment so that it belongs to that particular article.

# Once we have made the new comment, we send the user back to the original article using the 'article_path(@article)' helper.
# As we have already seen, this calls the 'show' action of the 'ArticlesController' which in turn renders the 'show.html.erb' template.
# This is where we want the comment to show.

# The 'destroy' action will find the article we are looking at, locate the comment within the '@article.comments' collection,
# and then remove it from the database and send us back to the show action for the article.

# We also want to allow only authenticated users to delete comments. This is done at the top.