module TodoApp
  module API
    class Base < Grape::API
      mount TodoApp::API::V1::Base
    end
  end
end
