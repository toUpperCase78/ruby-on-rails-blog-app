Rails.application.routes.draw do
  root "articles#index"

  resources :articles do
    resources :comments
  end
  # get "/articles", to: "articles#index"
  # get "/articles/:id", to: "articles#show"
end
  
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
# Location: config/routes.rb
# The route above declares that GET /articles requests are mapped to the 'index' action of 'ArticlesController'.
  
# By adding 'root "articles#index"', we can see our "Hello, Rails!" text when we visit http://localhost:3000 confirming that
# the 'root' route is also mapped to the 'index' action of 'ArticlesController'.
  
# The second route is another 'get' route, but it has something extra in its path ':id'.
# This designates a route parameter.
# A route parameter captures a segment of the request's path, and puts that value into the 'params' Hash, which is accessible by
# the controller action.
# For example, when handling a request like GET 'http://localhost:3000/articles/1', 1 would be captured as the value for ':id', which
# would then be accessible as 'params[:id]' in the 'show' action of 'ArticlesController'.
  
# Rails provides a routes method named 'resources' that maps all of the conventional routes for a collection of resources,
# such as articles. The two 'get' routes have been replaced with 'resources' for proceeding to the "C", "U", "D" sections.

# As with the 'welcome' controller, we will need to add a route so that Rails knows where we would like to navigate to see 'comments'.
# This creates 'comments' as a nested resource within 'articles'.
# This is another part of capturing the hierarchical relationship that exists between articles and comments.