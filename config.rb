Middleman::Templates.register :slim

helpers do
  def new_post
    if blog.articles.first.title.downcase == page_classes.split(' ')[0].downcase
      "<h1 class='fa fa-star'></h1>"
    end
  end

  def blog_tags
    tags = blog.articles.map do |tag|
      tag.tags.first
    end
    tags.uniq
  end

  def filter_tags_by_album(file_name)
    tags = data.send(file_name).albums.map do |tag|
      tag.title
    end
    tags
  end

  def filter_tags_by_image(file_name)
    tags = data.send(file_name).albums.map do |tag|
      t = tag.images.map do |img|
        img.tag
      end
      t.uniq
    end
    tags.flatten
  end

  def list_tags(file_name)
    all = data.send(file_name)
    tags = all.list.map do |list|
      list.tag
    end
    tags.uniq
  end

  def filter_tags_by(option, file_name)
    # probably practice duck typing
    if option == 'album'
      tags = data.send(file_name).albums.map do |tag|
        tag.title
      end
      tags
    elsif option == 'tag'
      tags = data.send(file_name).list.map do |tag|
        tag.tag
      end
      tags.uniq.compact.sort
    end
  end


  def nav_link(link_text, url, options = {})
    options[:class] ||= ""
    options[:class] << " active" if url == current_page.url
    link_to(link_text, url, options)
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

# Grid pages.
[
  "gifs",
  'pictures',
  'videos'
].each do |name|
  proxy "/#{name}.html", "/templates/grid/grid.html", :locals => { :file_name => name }, :ignore => true
end

# Post pages.
[
  "jots"
].each do |name|
  proxy "/#{name}.html", "/templates/jot/jot.html", :locals => { :file_name => name }, :ignore => true
end

# List pages.
[
  'links',
  'questions',
  'reading'
].each do |name|
  proxy "/#{name}.html", "/templates/list/list.html", :locals => { :file_name => name }, :ignore => true
end

# Note pages.
[
  "notes"
].each do |name|
  proxy "/#{name}.html", "/templates/note/note.html", :locals => { :file_name => name }, :ignore => true
end


activate :blog do |blog|
  blog.prefix = 'blog'
  blog.permalink = "{title}.html"
  blog.new_article_template = 'templates/blog_post.erb'
end

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.method = :git
end

activate :directory_indexes
activate :livereload
activate :syntax

set :markdown_engine, :kramdown

set :css_dir, 'stylesheets'
set :js_dir, 'scripts'
set :images_dir, 'images'

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :relative_assets
end

ignore   '/blog/drafts/*'
