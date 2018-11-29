Rails.application.routes.draw do
    
    root 'home#index'

  	resources :posts#, only: %i[new create show edit update destroy] 

	get('about' => 'about#index')

	get('/api/status' => 'status#index')
	get('/api/consoles' => 'consoles#index')
	
end
