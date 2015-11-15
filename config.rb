sprockets.append_path File.join root, 'bower_components'

activate :livereload
activate :directory_indexes

sprockets.append_path File.join root, 'bower_components'

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'


activate :deploy do |deploy|
  deploy.build_before = true
  deploy.method = :git
end

configure :build do
  activate :minify_css
  activate :minify_html
  activate :minify_javascript
  activate :relative_assets
end

