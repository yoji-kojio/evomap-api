Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :careers
      resources :requirements
      resources :contents
      resources :user_requirements

      controller :users do
        get 'users/:username/get-career' => :get_user_career, as: :get_user_career
        get 'users/:username/get-requirements' => :get_user_requirements, as: :get_user_requirements
        get 'users/:username/get-recommended-contents' => :get_user_recommended_contents, as: :get_user_recommended_contents
      end

      controller :user_requirements do
        get 'user_requirements/:id/finish-requirement' => :finish_requirement, as: :finish_requirement
      end
    end
  end
end
