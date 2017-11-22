Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :photographers do
    resources :photos do
      collection do
        get '/:code', controller: :photos, action: :show
      end
    end
  end
end
