Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :photographers do
    resources :photos do
      collection do
        get '/:code', controller: :photos, action: :show
        put '/:code/revoke', controller: :photos, action: :revoke, as: :revoke_photo
      end
    end
  end
end
