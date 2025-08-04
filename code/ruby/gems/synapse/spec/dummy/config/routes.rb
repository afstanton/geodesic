Rails.application.routes.draw do
  mount Synapse::Engine => "/synapse"
end
