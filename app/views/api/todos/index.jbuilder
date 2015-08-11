json.todos @todos do |todo|
  json.prettify_response!
  json.merge! todo.attributes
end
