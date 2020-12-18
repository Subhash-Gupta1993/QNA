Rails.application.routes.draw do
  root "home#index"
  devise_for :users
  resources :home
  resources :question_and_answer do 
  	collection do
        get "new_question"
        post "create_question"
        post "create_answer"  
    end
    member do
    	get "new_like"
        get "new_answer"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
