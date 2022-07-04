Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'englishscore', to: 'games#englishscore', as: :englishscore
  get 'frenchscore', to: 'games#frenchscore', as: :frenchscore
  get 'english', to: 'games#english', as: :english
  get 'french', to: 'games#french', as: :french
end
