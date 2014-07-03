# 
# well.. here is where the magic happens...
#
require 'sinatra'
require 'i18n'
require 'i18n/backend/fallbacks'
require 'haml'
require 'rack'
require 'rack/contrib'

set :haml, :format => :html5

# para que este "mini-sitio" sea mas o menos internacionalizable (i18n)
# configuramos donde vamos a ir a buscar las traducciones y ademas, el fallback para que tire error
configure do
  I18n::Backend::Simple.send(:include, I18n::Backend::Fallbacks)
  I18n.load_path = Dir[File.join(settings.root, 'i18n', '*.yml')]
  I18n.backend.load_translations
end

before do
  # antes de que se ejecute cualquier request...
  # seteamos las traducciones disponibles en un Hash (despues veremos que es esa cosa)
  @available_translations = {:en => 'English', :es => 'Espa&ntilde;ol'}
end

before '/:locale/*' do
  # este "before" se ejecuta solamente antes de cualquier ruta que empiece con /[idioma]/[lo-que-sea] 
  # en terminos practicos... cada vez que se hace una peticion con el formato
  # http://localhost:4567/en/lo-que-sea

  # miren que piola es verificar la existencia de un valor en un array!
  # lo hacemos con Array.include?('valor')
  # un ternario y listo.. forzamos a que no pongan Farsi o Mongol como traduccion ya que no las tenemos, JA! :)
  @current_locale = (@available_translations.keys.include?(params[:locale].to_sym)) ? params[:locale].to_s : 'es'
  I18n.locale = @current_locale
  request.path_info = "/#{@current_locale}/#{params[:splat][0]}"
  @entries = {}
  20.times do |number|
    @entries["link-post-number-#{number}"] = {
      :title => "#{I18n.t('blog.entry_template_title')} #{number}",
      :body  => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt",
      :slug  => "link-post-number-#{number}" 
    }
  end
  puts "#{@entries}"
  puts "#{@entries.keys}"
end

get '/' do
  redirect "/#{@available_translations.keys.first.to_s}/"
end

get '/:locale/' do
  haml :index
end

get '/:locale/blog' do
  haml :blog_index, :locals  => {
    :entries => @entries
  }
end

get '/:locale/blog/:slug' do
  begin
    haml :blog_post, :locals => { 
      :post => @entries[params[:slug]]
    }  
  rescue
    not_found
  end
end

not_found do
  haml :not_found
end