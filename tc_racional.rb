require './racional.rb'
require 'test/unit'

class TestFraccion < Test::Unit::TestCase

	#Tests metodo to_s

	def test_to_s
		assert_equal("(1/3)", Fraccion.new(1, 3).to_s)
		assert_equal("(8/5)", Fraccion.new(8, 5).to_s)
		assert_equal("(-3/-2)", Fraccion.new(-3, -2).to_s)
	end
	
	#Tests metodo suma
	
	def test_suma
		assert_equal([4, 1], Fraccion.new(5, 2).suma(3, 2))
		assert_equal([65, 18], Fraccion.new(10, 9).suma(5, 2))
		assert_equal([3, 1], Fraccion.new(2, 1).suma(1, 1))
	end
	
	#Tests metodo resta
	
	def test_resta
		assert_equal([1, 15], Fraccion.new(2, 5).resta(1, 3))
		assert_equal([50, 133], Fraccion.new(18, 19).resta(4, 7))
		assert_equal([-1, 20], Fraccion.new(1, 5).resta(1, 4))
	end
	
	#Tests metodo producto
	
	def test_prod
		assert_equal([-8, 9], Fraccion.new(8, 3).producto(-2, 6))
		assert_equal([39, 10], Fraccion.new(13, 5).producto(3, 2))
		assert_equal([3, 1], Fraccion.new(3, 1).producto(1, 1))
	end
	
	#Tests metodo division
	
	def test_div
		assert_equal([2, 1], Fraccion.new(2, 1).division(1, 1))
		assert_equal([140, 11], Fraccion.new(20, 11).division(3, 21))
		assert_equal([6, 7], Fraccion.new(-8, 7).division(4, -3))
	end

end
