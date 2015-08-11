module TodoApp
  module API
    module V1
      module Defaults
        extend ActiveSupport::Concern

        included do
          version "v1", using: :path
          default_format :json
          format :json
          formatter :json, Grape::Formatter::Jbuilder

          helpers do
            def logger
              Rails.logger
            end
          end
        end
      end
    end
  end
end

        

