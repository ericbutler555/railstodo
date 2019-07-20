Rails.application.routes.draw do
  root to: "todos#index"
  resources :todos
  patch "todos/:id/done", to: "todos#toggle_done", as: "done"
end
