$:.unshift File.join "#{root}", "lib"

require "kramdown"
require "kramdown/converter/executr"
require "middleman/renderers/kramdown_executr"
require "sprockets-sass"
require "sassy-buttons"

# Set the Markdown engine
set :markdown_engine, :kramdown

# Set our custom renderer to be used by tilt
::Tilt.mappings.delete('md') # probably not the best idea to delete mappings but it works
::MiddlemanKramdownExecutr.middleman_app = self
::Tilt.register(::Middleman::Renderers::KramdownExecutrTemplate, ".md")

# Require slim
require 'slim'
set :slim, :pretty => true

# Enable pretty URLS
activate :directory_indexes

# Set Build Dir
set :build_dir, "tmp"

# Append sprockets paths
sprockets.append_path File.join "#{root}", "source/assets/js"
sprockets.append_path File.join "#{root}", "source/assets/css"
sprockets.append_path File.join "#{root}", "bower_components"
sprockets.append_path File.join "#{root}", "vendor/assets/js"
sprockets.append_path File.join "#{root}", "vendor/assets/css"

# Set Asset paths
set :css_dir,    'assets/css'
set :js_dir,     'assets/js'

# Views direcgtores
set :layout_dir, "layouts"
set :layout, :main

# Set a table of contents hash
@table_of_contents = data['toc']

require "lib/toc_helpers"
helpers TocHelpers
