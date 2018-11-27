Rails.application.routes.draw do
  	
      get 'post/create'
      post 'post/store'

      root 'home#index'
 	# get 'welcome/index'
 
 	# resources :articles
 
 	# root 'welcome#index'
	get('about' => 'about#index')
	# get('home' => 'home#index')
	
	get('/api/status' => 'status#index')
	get('/api/consoles' => 'consoles#index')
end
