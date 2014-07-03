VPA Ruby Basics
===============

La idea de este repo, es mostrar de manera rapida, que se puede hacer con Ruby + un framework liviano (Sinatra) y con poco nivel de complejidad. Lo sencillo que es el manejo de dependencias a travez del uso de gemas, lo sencillo que es requerirlas, configurarlas y sobre todo usarlas.

Este mini proyectito, comprende 3 aspectos basicos:

* Entender como funciona el ciclo de vida de una peticion (Request/Response)
* Mostrar lo sencillo que el manejo de rutas.
* Mostrar la sencillez del lenguaje en si mismo. Tipos de datos, manejo de arrays, operadores, condicionales, etc etc.
* Conceptos basicos de ruby mediante la ejecucion de simples scripts desde la consola
* Introduccion a herramientas que deberian, a mi criterio, formar parte del dia a dia en todo proyecto ruby

# Pre requisitos

* *Fundamental* NO TENER WINDOWS. Cualquier otro SO, puedo dar alguna especie de ayuda. No en windows porque para mi es un barrio inexplorado.
* Tener RVM instalado en tu compu

# Instalacion

## Clonar el repo
```
git clone git@github.com:aboyon/vpa-ruby-basics.git
```

## Seteo de ambiente

### Instalacion de ruby y RVM
RVM es Ruby Version Manager. Basicamente te permite tener multiples versiones de ruby en tu ambiente local, y poder ajustarlas de acuerdo al proyecto que estes laburando, incluso permitiria testear tu app, contra distintas versiones de Ruby (1.9.2, 1.9.3 o 2.0.x).
Ahora bien... como instald RVM?. Facil. La respuesta la encontras en [este link](https://rvm.io/rvm/install).
Si ya instalaste exitosamente RVM, ya podes seguir adelante e instalarte la version que vos mas prefieras. Personalmente, mi consejo es que instales la mas reciente. Eso lo logras muy sencillamente, corriendo este comando en tu consola:

```
rvm install [tu_version]
```
Ahora bien, si te preguntas que version me instalo? La respuesta es facil. Primero le preguntas a RVM cuales son las versiones que tiene en su soporte, y luego procedes a instalar la que mas te convenga. Cabe aclarar que tienen su stack de versiones bastante bien actualizado. Eso lo podes hacer con:
```
rvm list known
```
Eso te arrojaria algo como esto:
```
dsilveira@cachucha:/var/www/vpa/vpa-ruby-sandbox:(master) $ rvm list known
# MRI Rubies
[ruby-]1.8.6[-p420]
[ruby-]1.8.7[-p374]
[ruby-]1.9.1[-p431]
[ruby-]1.9.2[-p320]
[ruby-]1.9.3[-p484]
[ruby-]2.0.0-p195
[ruby-]2.0.0[-p353]
[ruby-]2.1.0
[ruby-]2.1-head
ruby-head
```
En este caso para instalarte una version estable y confiable (como la 2.1.0) deberias correr:
```
rvm install 2.1.0
```
Se tomara su tiempo y te dira que ya tenes disponible la version 2.1.0 en tu manejador de versiones ruby (RVM).

### Instalacion de las gemas
Si queres ver lo que es una gema, [apreta aca](http://guides.rubygems.org/what-is-a-gem/). Doy por sentado que ya lo leiste :).
Por lo general un proyecto en ruby, requiere de un set de gemas reflejado en un Gemfile (como esta reflejado en este proyecto). Pero reflejarlo no es suficiente. Hay que instalarlas. La instalacion (que no es mas que bajar codigo fuente Ruby empaquetado en un archivo .gem en una carpeta dada) se puede hacer de varias maneras.

Una manera puede ser instalar gema por gema (no recomendado)
```
gem install 'some-gem'
```

Y la otra es pedirle a un "bundler" que instale todas las gemas que tenemos en el Gemfile. Ahora.. ¿donde existe este bundler que instala las gemas listadas en un archivo? este Bundler es tambien *UNA GEMA!* y se instala facilmente.
```
gem install bundler
```
Y listo, ya tenemos un bundler para que nos maneje la instalacion de las gemas descriptas en Gemfile. Llegados a este punto, procedemos a la instalacion de las gemas del proyecto de la siguiente manera
```
bundle install
```
Esto te arrojara una salida por pantalla similar a esta:
```
dsilveira@cachucha:/var/www/vpa/vpa-ruby-sandbox:(master) $ bundle install
Using diff-lcs (1.2.5)
Using tilt (1.4.1)
Using haml (4.0.5)
Using i18n (0.6.9)
Using rack (1.5.2)
Using rack-contrib (1.1.0)
Using rack-protection (1.5.3)
Using rspec-support (3.0.2)
Using rspec-core (3.0.2)
Using rspec-expectations (3.0.2)
Using rspec-mocks (3.0.2)
Using rspec (3.0.0)
Using sinatra (1.4.5)
Using bundler (1.5.3)
Your bundle is complete!
Use `bundle show [gemname]` to see where a bundled gem is installed.
```

### Arrancar el sitio
Sinatra es tan copado que alcanza con que solo "corramos" el archivo site.rb desde consola. Eso abrira (por default) el puerto 4567 y sera accesible desde localhost:4567. Para arrancar la aplicacion web, necesitamos correr:
```
bundle exec ruby site.rb
```
Eso nos data un output como el siguiente:
```
dsilveira@cachucha:/var/www/vpa/vpa-ruby-sandbox$ bundle exec ruby site.rb 
[2014-07-03 13:18:20] INFO  WEBrick 1.3.1
[2014-07-03 13:18:20] INFO  ruby 2.0.0 (2013-11-22) [x86_64-linux]
== Sinatra/1.4.5 has taken the stage on 4567 for development with backup from WEBrick
[2014-07-03 13:18:20] INFO  WEBrick::HTTPServer#start: pid=16489 port=4567
127.0.0.1 - - [03/Jul/2014 13:18:24] "GET / HTTP/1.1" 302 - 0.0153
localhost - - [03/Jul/2014:13:18:24 ART] "GET / HTTP/1.1" 302 0
```

Acto seguido es ir al browser y poner [http://localhost:4567](http://localhost:4567) y listo, ya tenes un sitio hecho con ruby + sinatra y que se banca internacionalizacion y todo.



# Para este mini proyecto, se uso

* [Twitter bootstrap 3.1.1](http://getbootstrap.com/)
* [Sinatra 1.4.2](http://www.sinatrarb.com/)
* [Haml](http://haml.info/)
* [i18n](https://github.com/svenfuchs/i18n)
* [rspec](http://rspec.info/)
