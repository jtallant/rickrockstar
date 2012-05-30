Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :businesses do
    resources :businesses, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :businesses, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :businesses, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
