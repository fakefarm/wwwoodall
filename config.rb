Middleman::Templates.register :slim

helpers do
  def new_post
    if blog.articles.first.title.downcase == page_classes.split(' ')[0].downcase
      "<h1 class='fa fa-star'></h1>"
    end
  end

  def post_image
    unless current_article.nil?
      current_article.metadata[:page]['image']
    else
      current_page.metadata[:page]['image']
    end
  end

  def image_caption
    unless current_article.nil?
      caption = current_article.metadata[:page]['caption']
    else
      caption = current_page.metadata[:page]['caption']
    end
    "<div class='img-caption'>#{caption}</div>"
  end

  def post_title
    current_article.title
  end

  def post_snip
    current_article.metadata[:page]['snip']
  end
end

activate :blog do |blog|
  blog.name = 'blog'
  blog.prefix = 'blog'
  blog.permalink = "{title}.html"
end

activate :blog do |blog|
  blog.new_article_template = 'templates/note.erb'
  blog.name = 'notes'
  blog.prefix = 'notes'
  blog.permalink = "{title}.html"
end

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.method = :git
end

activate :directory_indexes
activate :livereload
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
