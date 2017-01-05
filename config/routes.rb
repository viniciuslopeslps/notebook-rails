Rails.application.routes.draw do
  
  #rota personalizada
  get '/bemvindo' => 'home#index'
  
  #rota de quando abrir
  root 'home#index' # passa o controller e o metodo dentro do controller SEMPRE

  # o rails cria todas as rotas pra você, passar o NOME DO CONTROLLER
  resources :phones
  resources :addresses
  resources :contacts

  resources :kinds #pode usar , except: [:edit] ou only: [:new, :show]
  
end
