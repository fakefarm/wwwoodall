Middleman::Templates.register :slim


activate :blog do |blog|
  blog.permalink = "{title}.html"
end

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.method = :git
end

activate :directory_indexes
activate :livereload
activate :syntax, line_numbers: true
set :markdown_engine, :kramdown



set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  activate :relative_assets
end
