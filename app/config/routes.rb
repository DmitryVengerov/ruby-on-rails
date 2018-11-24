Rails.application.routes.draw do
	get('/api/status' => 'status#index')
	get('/api/consoles' => 'consoles#index')
end
