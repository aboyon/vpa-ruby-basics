# Este archivo es para que puedas "servir" una app escrita en sinatra
# por medio de un servidor web un toque mas robusto, onda Nginx o Apache

#config.ru
require 'rubygems'
require 'sinatra'
require 'rack'
require "#{File.dirname(__FILE__)}/site.rb"
run Sinatra::Application