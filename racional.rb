# Implementar en este fichero la clase para crear objetos racionales

require "./gcd.rb"

class Fraccion

	# Inicializacion del objeto con argumentos tomados desde la terminal.
	# Para obtener la expresion minima, se le hace el Maximo Comun Divisor
	# y asi poder operar con la expresion reducida de los operandos.
	# 
	# A continuacion guardamos dichos resultados en atributos de la instancia.

	def initialize(args[0], args[1])
			max = gcd(args[0], args[1])
			@num = args[0] / max
			@denom = args[1] / max
	end
	
	
	# Metodo que devuelve una cadena con la representacion racional.
	
	def to_s
		"#{@num}/#{@denom}"
	end
	
	
	# Metodo que devuelve un racional el cual es el resultado de la suma
	# efectuada con el objeto que invoca y el que le pasan como parametro.
	
	def suma(args[0], args[1])
		num, denom = reduc_num(args[0], args[1])
		
		if (@denom == denom)
			@num += num
		else
			denom_aux = min_comun(@b, denom)
			num_aux = ((denom_aux / @b) * @a) + ((denom_aux / denom) * num)
			
			@a, @b = reduc_num(num_aux, denom_aux)
		end
		
		return @a, @b
	end
	
	
	# Metodo para realizar la reduccion a la minima expresion
	
	def reduc_num(num1, denom1)
		max = gcd(num1, denom1)
		num1 = num1 / max
		denom1 = denom1 / max
	end
	
	
	# Metodo para realizar el Minimo Comun Multiplo
	
	def min_comun(a, b)
		a, b = a.abs, b.abs
		
		(a / gcd(a, b)) * b
	end
	
	
	# Metodo que devuelve un racional el cual es el resultado de la resta
	# efectuada con el objeto que invoca y el que le pasan como parametro.
	
	def resta(args[0], args[1])
		num, denom = reduc_num(args[0], args[1])
		
		if (@denom == denom)
			@num -= num
		else
			denom_aux = min_comun(@b, denom)
			num_aux = ((denom_aux / @b) * @a) - ((denom_aux / denom) * num)
			
			@a, @b = reduc_num(num_aux, denom_aux)
		end
		
		return @a, @b 
	end
	
	
	# Metodo que devuelve un racional el cual es el resultado de la multiplicacion
	# efectuada con el objeto que invoca y el que le pasan como parametro.
	
	def producto(args[0], args[1])
		num, denom = reduc_num(args[0], args[1])
		
		num *= @a
		denom *= @b
		
		@a, @b = reduc_num(num, denom)
		
		return @a, @b
	end
	
	
	# Metodo que devuelve un racional el cual es el resultado de la division
	# efectuada con el objeto que invoca y el que le pasan como parametro.
	
	def division(args[0], args[1])
		num, denom = reduc_num(args[0], args[1])
		
		num *= @b
		denom *= @a
		
		@a, @b = reduc_num(num, denom)
		
		return @a, @b
	end

end
