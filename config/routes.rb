Rails.application.routes.draw do
	get('about' => 'about#index')
	get('home' => 'home#index')
	get('/api/status' => 'status#index')
	get('/api/consoles' => 'consoles#index')

end
