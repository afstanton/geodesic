Rails.application.routes.draw do
  mount Sentinel::Engine => "/sentinel"
end
