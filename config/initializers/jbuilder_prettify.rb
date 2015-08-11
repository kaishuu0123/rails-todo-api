require "jbuilder"

class Jbuilder
  alias_method :_original_target, :target!

  def prettify_response!
    @_pretty_response = true
  end

  def target!
    @_pretty_response ? ::JSON.pretty_generate(@attributes) : _original_target
  end
end
