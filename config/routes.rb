Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :careers
      resources :requirements
      resources :contents

      controller :users do
        get 'users/:username/get-career' => :get_user_career, as: :get_user_career
        get 'users/:username/get-requirements' => :get_user_requirements, as: :get_user_requirements
      end
    end
  end
end
