class StaticController < ApplicationController

  def show
    if Rails.env.development?
      show_development
    else
      show_production
    end
  end

  private

  # A lot of different files (especially js) are loaded and need to be served.
  # Use a file-search based solution here
  def show_development
    file = params[:file]
    if not (file.nil? || file.blank?)
      [dynamic_path, resource_path].each do |path|
        f = File.join(path, file)
        if File.exist?(f)
          render_static f
          return
        end
      end
    end
    render_static default_file
  end

  # Only certain allowed files should be served
  # Make a hash of allowed files and look up the path
  def show_production
    file = params[:file]
    render_static file_map.fetch(file, default_file)
  end

  def file_map
    js_path = dynamic_path.join('js')
    css_path = resource_path.join('css')
    img_path = resource_path.join('img')
    { 'js/app.min.js'               => js_path.join('app.min.js'),
      'js/app.js'                   => js_path.join('app.min.js'),
      'js/main.js'                  => js_path.join('app.min.js'),
      'img/logo/logo-large.png'     => img_path.join('logo', 'logo-large.png'),
      'img/logo/logo-navbar.png'    => img_path.join('logo', 'logo-navbar.png'),
      'css/site.css'                => css_path.join('site.min.css'),
      'css/site.min.css'            => css_path.join('site.min.css'),
      'css/vendor/semantic.min.css' => css_path.join('vendor', 'semantic.min.css')
    }
  end

  def render_static(file)
    send_file file, disposition: 'inline'
  end

  def dynamic_path
    Rails.root.join('canboard-frontend', 'target', 'cljsbuild', 'public')
  end

  def resource_path
    Rails.root.join('canboard-frontend', 'resources', 'public')
  end

  def default_file
    resource_path.join(Rails.env.production? ? 'index-prod.html' : 'index.html')
  end

end
