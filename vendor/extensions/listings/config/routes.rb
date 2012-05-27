Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :listings do
    resources :listings, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :listings, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :listings, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
