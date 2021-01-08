class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "yigit", password: "railsblog", except: [:index, :show]
  
  def index
    @articles = Article.all
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
	if @article.save
	  redirect_to @article
	else
	  render :new
	end
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
	if @article.update(article_params)
	  redirect_to @article
	else
	  render :edit
	end
  end
  
  def destroy
    @article = Article.find(params[:id])
	@article.destroy
	
	redirect_to root_path
  end
  
  private
    def article_params
	  params.require(:article).permit(:title, :body)
	end
end

# Location: app/controllers/articles_controller.rb
# Initially, the 'index' action is empty. When an action does not explicitly render a view (or otherwise trigger an HTTP response),
# Rails will automatically render a view that matches the names of the controller and action.
# Convention Over Configuration!
# Views are located in the 'app/views' directory. So the 'index' action will render 'app/views/articles/index.html.erb' by default.

# Controller instance variables can be accessed by the view.
# That means we can reference @articles in 'app/views/articles/index.html.erb'.

# The 'show' action calls 'Article.find' with the ID captured by the route parameter. The returned article is stored in the '@article'
# instance variable, so it is accessible by the view.
# By default, the 'show' action will render 'app/views/articles/show.html.erb'.

# The 'new' action instantiates a new article, but does not save it.
# This article will be used in the view when building the form.
# By default, the 'new' action will render 'app/views/articles/new.html.erb'.

# The 'create' action instantiates a new articles with values for the title and body, and attempts to save it.
# If the article is saved successfully, the action redirects the browser to the article's page at
# http://localhost:3000/articles/#{@article.id}
# Else, the action redisplays the form by rendering 'app/views/articles/new.html.erb'.
# The title and body here are dummy values.

# 'redirect_to' will cause the browser to make a new request, whereas 'render' renders the specified view for the current request.
# It is important to use 'redirect_to' after mutating the database or application state.
# Otherwise, if the user refreshes the page, the browser will make the same request, and the mutation will be repeated.

# Submitted form data is put into the 'params' Hash, alongside captured route parameters.
# Thus, the 'create' action can access the submitted title via 'params[:article][:title]' and the submitted body via
# 'params[:article][:body]'.
# We could pass these values individually to 'Article.new', but that would be verbose and possibly error-prone.
# And it would become worse as we add more fields.
# Instead, we will pass a single Hash that contains the values.
# However, we must still specify what values are allowed in that Hash.
# Otherwise, a malicious user could potentially submit extra form fields and overwrite private data.
# In fact, if we pass the unfiltered 'params[:article]' Hash directly to 'Article.new', Rails will raise a 'ForbiddenAttributesError'
# to alert us about the problem.
# So, we will use a feautre of Rails called Strong Parameters to filter 'params'.
# Think of it as strong typing for 'params'.

# Notice how the 'edit' and 'update' actions resemble the 'new' and 'create' actions.
# The 'edit' action fetches the article from the database, and stores it in '@article' so that it can be used when building the form.
# By default, the 'edit' action will render 'app/views/articles/edit.html.erb'.

# The 'update' action (re-)fetches the article from the database, and attempts to update it with the submitted form data filtered by
# 'article_params'. If no validations fail and the update is successful, the action redirects the browser to the article's page.
# Else, the action redisplays the form, with error messages, by rendering 'app/views/articles/edit.html.erb'.

# The 'destroy' action fetches the article from the database, and calls 'destroy' on it.
# Then, it redirects the browser to the root path.
# We have chosen to redirect to the root path because that is our main access point for articles.
# But, in other circumstances, you might choose to redirect to e.g. 'articles_path'.

# In the 'ArticlesController', we need to have a way to block access to the various actions if the person is not authenticated.
# Here, we can use the Rails 'http_basic_authenticate_with' method, which allows access to the requested action if that method allows it.

# To use the authentication system, we specify it at the top of our 'ArticlesController'.
# In our case, we want the user to be authenticated on every action except 'index' and 'show'.