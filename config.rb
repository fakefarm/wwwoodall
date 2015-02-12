Middleman::Templates.register :slim

helpers do
  def new_post
    if blog.articles.first.title.downcase == page_classes.split(' ')[0].downcase
      "<h1 class='fa fa-star'></h1>"
    end
  end

  def post_count(tag)
    blog.articles.map { |b| b.tags.include?(tag) }.inject(0) { |c,d| if d == true; c+=1; end; c}
  end

  def blog_tags
    tags = blog.articles.map do |tag|
      tag.tags.first
    end
    tags.uniq
  end

  def newest_jot_image
    data.jots.collections[0].entries[3][1][0]['img']
  end

  def filter_tags_by(option, file_name)
    if option == 'album'
      tags = data.send(file_name).collections.map do |tag|
        tag.title
      end
      tags
    elsif option == 'tag'
      tags = data.send(file_name).collections[0]['entries'].map do |tag|
        tag['tag']
      end
      tags.uniq.compact.sort
    end
  end


  def nav_link(link_text, url, options = {})
    options[:class] ||= ""
    options[:class] << " active" if url == current_page.url || url == "/#{current_page.url.split('/')[1]}/"
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

# Notes as pages _dw TODO make this into show page for notes, jots, questions.
data.notes.collections[0]['entries'].each do |note|
  proxy "/notes/#{note.title.parameterize}.html", "/templates/note/show.html", :locals => { :note => note }, :ignore => true
end

# Links as pages _dw TODO make this into show page for notes, jots, questions.
data.links.collections[0]['entries'].each do |note|
  proxy "/links/#{note.title.parameterize}.html", "/templates/note/show.html", :locals => { :note => note }, :ignore => true
end

# Card pages
[
  "pictures"
].each do |name|
  proxy "/#{name}.html", "/templates/cards/card.html", :locals => { :file_name => name }, :ignore => true
end


# Grid pages.
[
  "gifs",
  'watching'
].each do |name|
  proxy "/#{name}.html", "/templates/grid/grid.html", :locals => { :file_name => name }, :ignore => true
end

[
  'bro-conf',
  'december-2014',
  'wells-school',
  'fathers-day'
].each do |album|
  proxy "/#{album}.html", "/templates/album/album.html", :locals => { :album => album }, :ignore => true
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
  "notes",
  "grammar"
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
activate :emoji

set :markdown_engine, :kramdown

set :css_dir, 'stylesheets'
set :js_dir, 'scripts'
set :images_dir, 'images'

configure :build do
  activate :minify_css
  activate :minify_html
  activate :minify_javascript
  activate :relative_assets
end

ignore   '/blog/drafts/*'

ready do
  t = sitemap.resources.group_by { |p| p.data['tags'] }
  tags = t.reject{ |k,v| k.nil? || v.nil? }
  tags.each do |category, pages|
      proxy "/#{category.parameterize}.html", "/templates/categories/list.html",
        :locals => { :category => category, :pages => pages }, :ignore => true
  end
end
