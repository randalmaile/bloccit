Rake Routes

vagrant@rails-dev-box:~/code/bloccit$ rake routes
        new_user_session GET    /users/sign_in(.:format)          devise/sessions#new
            user_session POST   /users/sign_in(.:format)          devise/sessions#create
    destroy_user_session DELETE /users/sign_out(.:format)         devise/sessions#destroy
           user_password POST   /users/password(.:format)         devise/passwords#create
       new_user_password GET    /users/password/new(.:format)     devise/passwords#new
      edit_user_password GET    /users/password/edit(.:format)    devise/passwords#edit
                         PUT    /users/password(.:format)         devise/passwords#update
cancel_user_registration GET    /users/cancel(.:format)           devise/registrations#cancel
       user_registration POST   /users(.:format)                  devise/registrations#create
   new_user_registration GET    /users/sign_up(.:format)          devise/registrations#new
  edit_user_registration GET    /users/edit(.:format)             devise/registrations#edit
                         PUT    /users(.:format)                  devise/registrations#update
                         DELETE /users(.:format)                  devise/registrations#destroy
       user_confirmation POST   /users/confirmation(.:format)     devise/confirmations#create
   new_user_confirmation GET    /users/confirmation/new(.:format) devise/confirmations#new
                         GET    /users/confirmation(.:format)     devise/confirmations#show
                   posts GET    /posts(.:format)                  posts#index
                         POST   /posts(.:format)                  posts#create
                new_post GET    /posts/new(.:format)              posts#new
               edit_post GET    /posts/:id/edit(.:format)         posts#edit
                    post GET    /posts/:id(.:format)              posts#show
                         PUT    /posts/:id(.:format)              posts#update
                         DELETE /posts/:id(.:format)              posts#destroy
                   about GET    /about(.:format)                  welcome#about
                    root        /                                 welcome#index