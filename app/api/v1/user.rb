module V1
  class User < Base
    get :user do
      { data: "leon" }
    end
  end
end