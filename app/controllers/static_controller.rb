class StaticController < ApplicationController
  def show
    file = params[:file]
    if file.nil? || file.blank?
      render_static fallback_path.join(Rails.env.production? ? 'index-prod.html' : 'index.html') and return
    end
    base_paths.each do |path|
      f = File.join(path, file)
      if File.exist?(f)
        render_static f and return
      end
    end
    render_static fallback_path.join('404.html')
  end

  private

  def render_static(file)
    send_file file, disposition: 'inline'
  end

  def base_paths
    [
      Rails.root.join('canboard-frontend', 'target', 'cljsbuild', 'public'),
      Rails.root.join('canboard-frontend', 'resources', 'public')
    ]
  end

  def fallback_path
    base_paths.last
  end
end
