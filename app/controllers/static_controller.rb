class StaticController < ApplicationController

  def show
    file = params[:file]
    render_static find_file(file, default_file)
  end

  private

  def file_map
    {
      /js\/(.*)/    => dynamic_path,
      /css\/(.*)/   => resource_path,
      /img\/(.*)/   => resource_path,
      /(.*)\.html/  => rails_resource_path
    }
  end

  def find_file(path, default)
    # Find all regexes from file_map that match the given path
    matches = file_map.keys.inject([]) {|arr, p|
      m = p.match(path)
      m.nil? ? arr : arr.push(p)
    }
    # If there are no matches, return the default
    return default if matches.nil? || matches.empty?
    # Else, concat the path to the base-path given by file_map
    file = file_map[matches.first].join(path)
    # Return the file at the resulting path, if it exists
    file.exist? ? file : default
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

  def rails_resource_path
    Rails.root.join('public')
  end

  def default_file
    rails_resource_path.join(Rails.env.production? ? 'index-prod.html' : 'index.html')
  end

end
