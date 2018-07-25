class Maclease::ValidationError < RuntimeError; end


class Maclease::ServerError < StandardError

  def initialize(response=nil)
    @response = response
  end

  attr_reader :response
end

