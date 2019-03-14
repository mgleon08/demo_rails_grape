module V1
  class Base < APIBase
    version 'v1', using: :path

    mount User

    if Rails.env.development?
      add_swagger_documentation(
        api_version: 'v1',
        mount_path: 'swagger_doc',
        hide_format: true,
        hide_documentation_path: true,
        info: {
          title: 'API Doc',
          description: '基本使用規則'
        }
      )
    end
  end
end
