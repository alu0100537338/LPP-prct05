# Implementar en este fichero la clase para crear objetos racionales

require "./gcd.rb"

class Fraccion

	def racional(a, b)
	
		num = a
		denom = b
		
		puts "Racional introducido: #{num}/#{denom}"
		
		#if num > 1
			#puts "Reduciendo racional a su minima expresion: maximo comun divisor"
			#max = gcd(num, denom)
			#puts ""
			#num/max
		#end
	
	end

end

puts racional(1, 3)