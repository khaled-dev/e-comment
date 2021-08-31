Rails.application.routes.draw do
  get ':resource_type/:resource_id/comment', to: 'comment#index', as: 'kudos_comments_list'
  post ':resource_type/:resource_id/comment', to: 'comment#create', as: 'kudos_comments_create'
end
