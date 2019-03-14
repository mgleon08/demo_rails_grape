# README


# Create Project 

```ruby
rails new demo_rails_grape -T -d mysql
```

```ruby
rails g model User name:string email:string tel:string
```

### rails c

```ruby
 User.create(name: "leon", email: "text@gmail.com", tel: 888)
```

# Grape

grape 設定

```ruby
# Gemfile
gem "grape", "~> 1.1.0"
```

```ruby
# routes
Rails.application.routes.draw do
	mount APIBase => "/api"
end
```

```ruby
# api/api_base.rb
class APIBase < Grape::API
  # general settings
  format :json
  content_type :json, "application/json"
  default_error_status 400

  mount V1::Base
end
```

```ruby
# api/v1/base.rb
module V1
  class Base < APIBase
    version "v1", using: :path
    mount User
  end
end
```

```ruby
# api/v1/base/user
module V1
  class User < APIBase
    get :user do
      { data: "leon" }
    end
  end
end
```

```ruby
# rs -p 4321
http://localhost:4321/api/v1/user
```

# Grape Swagger

```ruby
# Gemfile
gem 'grape-swagger'
gem 'grape-swagger-rails'
```

```ruby
# routes
if Rails.env.development?
  mount GrapeSwaggerRails::Engine => '/apidoc'
end
```

```ruby
# config/initializers/grape_swagger.rb
if Rails.env.development?
  GrapeSwaggerRails.options.app_url = '/api/v1/'
  GrapeSwaggerRails.options.url = 'swagger_doc.json'
  GrapeSwaggerRails.options.app_name = 'RailsGrape Swagger'
  # Set docExpansion with "none" or "list" or "full", default is "none".
  GrapeSwaggerRails.options.doc_expansion = "list"
  GrapeSwaggerRails.options.supported_submit_methods = ['get']
end
```

```ruby
# api/v1/base/user
module V1
  class User < APIBase
    version 'v1', using: :path

    get :user do
      { data: ::User.all }
    end

    if Rails.env.development?
      add_swagger_documentation(
        mount_path: 'swagger_doc',
        hide_format: true,
        hide_documentation_path: true
      )
    end
  end
end
```

```ruby
# rails s -p 4321
http://localhost:4321/apidoc
# json
http://localhost:4321/api/v1/swagger_doc.json
```


Reference

* [grape](https://github.com/ruby-grape/grape)
* [grape-swagger](https://github.com/ruby-grape/grape-swagger)
* [grape-swagger-rails](https://github.com/ruby-grape/grape-swagger-rails)
