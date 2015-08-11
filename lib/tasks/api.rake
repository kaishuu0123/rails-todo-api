namespace :api do
  desc 'Print compiled grape routes'
  task :routes => :environment do
    TodoApp::API::Base.routes.each do |route|
      puts route
    end
  end
end
