require './racional.rb'
require 'test/unit'

class TestFraccion < Test::Unit::TestCase

	def test_simple
		assert_equal("(1/3)", Fraccion.new(1, 3).to_s)
	end

end
