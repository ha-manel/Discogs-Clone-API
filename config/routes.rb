Rails.application.routes.draw do
  get "/api/v1/records", to: "records#index"
  post "/api/v1/record", to: "records#create"
  delete "/api/v1/record/:id", to: "records#destroy"
end
