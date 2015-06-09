MountainView::Engine.routes.draw do
  root to: "styleguide#index"

  resources :styleguide, only: [:index, :show]
  resources :style, only: [:index, :show]
end
