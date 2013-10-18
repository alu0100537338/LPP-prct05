# Implementar en este fichero la clase para crear objetos racionales

require "./gcd.rb"

class Fraccion

	# Inicializacion del objeto con argumentos tomados desde la terminal.
	# Para obtener la expresion minima, se le hace el Maximo Comun Divisor
	# y asi poder operar con la expresion reducida de los operandos.
	# 
	# A continuacion guardamos dichos resultados en atributos de la instancia.

	def initialize(arg1, arg2)
			max = gcd(arg1, arg2)
			@num = arg1 / max
			@denom = arg2 / max
	end
	
	
	# Metodo que devuelve una cadena con la representacion racional.
	
	def to_s
		"(#{@num}/#{@denom})"
	end
	
	
	# Metodo que devuelve un racional el cual es el resultado de la suma
	# efectuada con el objeto que invoca y el que le pasan como parametro.
	
	def suma(arg1, arg2)
		num, denom = reduc_num(arg1, arg2)
		
		if (denom == @denom)
			@num += num
			
			a, b = reduc_num(@num, @denom)
		else
			denom_aux = min_comun(@denom, denom)
			num_aux = ((denom_aux / @denom) * @num) + ((denom_aux / denom) * num)
			
			a, b = reduc_num(num_aux, denom_aux)
		end
		
		return a, b
	end
	
	
	# Metodo para realizar la reduccion a la minima expresion
	
	def reduc_num(num1, denom1)
		max = gcd(num1, denom1)
		num1 = num1 / max
		denom1 = denom1 / max
		
		return num1, denom1
	end
	
	
	# Metodo para realizar el Minimo Comun Multiplo
	
	def min_comun(a, b)
		a, b = a.abs, b.abs
		
		(a / gcd(a, b)) * b
	end
	
	
	# Metodo que devuelve un racional el cual es el resultado de la resta
	# efectuada con el objeto que invoca y el que le pasan como parametro.
	
	def resta(arg1, arg2)
		num, denom = reduc_num(arg1, arg2)
		
		if (@denom == denom)
			@num -= num
		else
			denom_aux = min_comun(@denom, denom)
			num_aux = ((denom_aux / @denom) * @num) - ((denom_aux / denom) * num)
			
			a, b = reduc_num(num_aux, denom_aux)
		end
		
		return a, b 
	end
	
	
	# Metodo que devuelve un racional el cual es el resultado de la multiplicacion
	# efectuada con el objeto que invoca y el que le pasan como parametro.
	
	def producto(arg1, arg2)
		num, denom = reduc_num(arg1, arg2)
		
		num *= @num
		denom *= @denom
		
		a, b = reduc_num(num, denom)
		
		return a, b
	end
	
	
	# Metodo que devuelve un racional el cual es el resultado de la division
	# efectuada con el objeto que invoca y el que le pasan como parametro.
	
	def division(arg1, arg2)
		num, denom = reduc_num(arg1, arg2)
		
		num *= @denom
		denom *= @num
		
		a, b = reduc_num(denom, num)
		
		return a, b
	end

end
