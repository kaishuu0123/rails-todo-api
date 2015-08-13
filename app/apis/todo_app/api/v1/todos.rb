module TodoApp
  module API
    module V1
      class Todos < Grape::API
        include Defaults

        resource :todos do
          desc "Return all Todos"
          get "", jbuilder: 'todos/index' do
            @todos = Todo.all()
          end

          desc "Return a Todo"
          params do
            requires :id, type: Integer, desc: "ID of the Todo"
          end
          get ":id", root: :todo do
            Todo.where(id: params[:id]).first!
          end

          desc "Create a Todo"
          params do
            requires :title, type: String, desc: "Title of the Todo"
            requires :done, type: Boolean, desc: "State of the Todo"
          end
          post do
            logger.info(params)
            Todo.create({
              title: params[:title],
              done: params[:done]
            })
          end

          desc "Update a Todo"
          params do
            requires :id, type: Integer, desc: "ID of the Todo"
            requires :title, type: String, desc: "Title of the Todo"
            requires :done, type: Boolean, desc: "State of the Todo"
          end
          put ':id' do
            todo = Todo.find(params[:id])
            error!('404 Not Found', 404) unless todo

            todo.update(title: params[:title], done: params[:done])
          end

          desc "Delete a Todo"
          params do
            requires :id, type: Integer, desc: "ID of the Todo"
          end
          delete ':id' do
            Todo.find(params[:id]).destroy
          end
        end
      end
    end
  end
end
