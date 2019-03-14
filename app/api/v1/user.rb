module V1
  class User < Base
    # users
    desc "`回傳所有 User 資訊`" do
      failure [
        [400, "`找不到任何 user`"],
        [500, "`unknown`"],
      ]
    end

    get :users do
      users = ::User.all
      present :users, users, with: V1::Entities::UserResult
    end

    # user
    desc "`帶 name 回傳該 User 資訊`" do
      success model: V1::Entities::UserResult, examples: {
        'application/json': {
          name: 'user1'
        },
      }
      failure [
        [400, "`找不到任何 user`"],
        [500, "`unknown`"],
      ]
    end

    params do
      optional :name, type: String, allow_blank: false, documentation: {
        description: "name",
        example: "user1"
      }
      at_least_one_of :name
    end

    get :user do
      user = ::User.find_by(name: params["name"]) || "Can't find #{params["name"]}"
      present :user, user
    end
  end
end