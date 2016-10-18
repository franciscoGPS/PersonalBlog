Rails.application.routes.draw do


  devise_for :authors
  root to: 'blog/posts#index'

#The difference between namespace and module is that
# namespace expects to have the name un the URL
# /author/posts
  namespace :authors do
    resources :posts do
      # on member is used to get :id  by default instead of :post_id for
      # :before_action params[:id]
      put 'publish' => 'posts#publish', on: :member, as: :pubish
      put 'unpublish' => 'posts#unpublish', on: :member, as: :unpubish
    end
  end

# /
# posts
  scope module: 'blog' do
    get 'about' => 'pages#about', as: :about
    get 'contact' => 'pages#contact', as: :contact
    get 'posts' => 'posts#index', as: :posts
    get 'posts/:id' => 'posts#show', as: :post
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
