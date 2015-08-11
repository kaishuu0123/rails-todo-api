module TodoApp
  module API
    module V1
      class Base < Grape::API
        mount TodoApp::API::V1::Todos
      end
    end
  end
end
