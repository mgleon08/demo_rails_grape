Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount APIBase => "/api"

  if Rails.env.development?
    mount GrapeSwaggerRails::Engine => '/apidoc'
  end

  match "*path" => "errors#error_404", via: :all
end
