module V1::Entities
  class UserResult < Grape::Entity
    expose :name, documentation: { required: true, type: 'String', desc: '錯誤信息' }
  end
end
