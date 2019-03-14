module V1
  class User < Base
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