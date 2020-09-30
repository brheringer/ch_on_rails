Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :accounts #, only: [:index, :show]
  resources :cost_centers
  resources :entries
  resources :portal
  resources :tags
  resources :universes
  root to: 'portal#index'
end


# Creating a resourceful route will also expose a number of helpers to the controllers in your application. In the case of resources :photos:
# photos_path returns /photos
# new_photo_path returns /photos/new
# edit_photo_path(:id) returns /photos/:id/edit (for instance, edit_photo_path(10) returns /photos/10/edit)
# photo_path(:id) returns /photos/:id (for instance, photo_path(10) returns /photos/10)
# Each of these helpers has a corresponding _url helper (such as photos_url) which returns the same path prefixed with the current host, port, and path prefix.

# group
# namespace :admin do
#   resources :articles, :comments
# end

#assert_generates '/photos/1', { controller: 'photos', action: 'show', id: '1' }

# From the controller's point of view, there are three ways to create an HTTP response:
# Call render to create a full response to send back to the browser
# Call redirect_to to send an HTTP redirect status code to the browser
# Call head to create a response consisting solely of HTTP headers to send back to the browser
