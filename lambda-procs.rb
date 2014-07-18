puts "====== Ejemplo de Lambda ======"

# en ruby los lambda representan, basicamente objetos ya que tienen mensaje.
# a continuacion veremos como declarar un lambda y como se comporta

lambda_example = lambda { |name, age| puts "Hello #{name.inspect} your age is #{age.inspect}"}

gang = [{:name => 'Pepe', :age => 20}, {:name => 'Luis', :age => 11}]

gang.each { |guy|
  lambda_example.call(guy[:name], guy[:age])
}

puts "\n"
print "Presiona enter para seguir con el ejemplo de Proc"
gets.chomp # esto es para pausarlo, y esperar que quieras seguir viendo algun ejemplo.. no tiene que ver con lamda o Proc

puts "\n"
puts "====== Ejemplo de Proc ======"

proc_example = Proc.new{ |name, age| puts "Hello #{name.inspect} your age is #{age.inspect}" }

gang.each { |guy|
  proc_example.call(guy[:name], guy[:age])
}

# hasta aca vas a ver que ambos parecen que funcionan igual, de hecho casi que lo hacen, pero no
# tienen unas leves, pero significativas diferencias...
# la primera es que "lambda" hace control de argumentos, y Proc no, es decir, lambda es estricto con los argumentos que espera recibir
# mientras que Proc no es tan estricto en ese sentido...
# haciendo un debug con pry, pude chequear que...
# => #<Proc:0x000000026f03b8@lambda-procs.rb:21>
# [3] pry(main)> proc_example.call
# Hello nil your age is nil
# => nil
# [4] pry(main)> lambda_example
# => #<Proc:0x000000026f0778@lambda-procs.rb:6 (lambda)>
# [5] pry(main)> lambda_example.call
# ArgumentError: wrong number of arguments (0 for 2)
# from lambda-procs.rb:6:in `block in <main>'

puts "\n"
print "Presiona enter para ver como reaccionan ambos ante la cantidad de parametros enviados"
gets.chomp

puts "Ejemplo de parametros en Proc"
proc_example.call('Jacob', 34, :male)

puts "Ejemplo de parametros en lambda"
lambda_example.call('Isaac', 54, :male)