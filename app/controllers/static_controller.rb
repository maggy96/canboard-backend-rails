class StaticController < ApplicationController

  def show
    file = params[:file]
    if file.nil? || file.blank?
      redirect_to '/index.html'
      return
    end
    base_paths = [
      Rails.root.join('canboard-frontend', 'target', 'cljsbuild', 'public'),
      Rails.root.join('canboard-frontend', 'resources', 'public')
    ]

    base_paths.each do |path|
      f = File.join(path, file)
      if File.exists?(f)
        send_file f, disposition: 'inline'
        return
      end
    end
    redirect_to '/404.html'
  end

end
