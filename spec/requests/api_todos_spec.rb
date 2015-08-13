require 'rails_helper'
require 'json_expressions/rspec'

RSpec.describe "Todos", type: :request do
  before do
    load Rails.root.join('db', 'seeds.rb')
  end

  describe "GET /api/v1/todos" do
    it "get Todos List" do
      pattern = {
        todos: [
          {
            id: Integer,
            title: /[A-Za-z]+ [0-9]/,
          }.ignore_extra_keys!
        ] * 5
      }
      get '/api/v1/todos'

      expect(response).to have_http_status(200)
      expect(response.body).to match_json_expression(pattern)
    end
  end

  describe "POST /api/v1/todos" do
    it "post Todo" do
      post '/api/v1/todos', {title: "fugafuga", done: false}.to_json,
        {'CONTENT_TYPE' => "application/json"}

      expect(response).to have_http_status(201)
    end
  end

  describe "PUT /api/v1/todos/:id" do
    it "PUT Todo" do
      put '/api/v1/todos/1', {title: "fugafuga", done: true}.to_json,
        {'CONTENT_TYPE' => "application/json"}

      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE /api/v1/todos/:id" do
    it "DELETE Todo" do
      delete '/api/v1/todos/1'

      expect(response).to have_http_status(200)

      expect { 
        delete '/api/v1/todos/5'
      }.to change(Todo, :count).by(-1)
    end
  end
end
