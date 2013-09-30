# Custom Kramdown renderer that uses our helpers for images and links
class MiddlemanKramdownExecutr < ::Kramdown::Converter::Executr
  cattr_accessor :middleman_app

  def convert_img(el, indent)
    attrs = el.attr.dup
    link = attrs.delete('src')
    middleman_app.image_tag(link, attrs)
  end

  def convert_a(el, indent)
    content = inner(el, indent)
    attr = el.attr.dup
    if attr['href'] =~ /\Amailto:/
      mail_addr = attr['href'].sub(/\Amailto:/, '')
      attr['href'] = obfuscate('mailto') << ":" << obfuscate(mail_addr)
      content = obfuscate(content) if content == mail_addr
    end

    link = attr.delete('href')
    middleman_app.link_to(content, link, attr)
  end
end

module Middleman
  module Renderers
    # Our own Kramdown Tilt template that simply uses our custom renderer.
    class KramdownExecutrTemplate < ::Tilt::KramdownTemplate
      def evaluate(scope, locals, &block)
        @output ||= begin
          output, warnings = MiddlemanKramdownExecutr.convert(@engine.root, @engine.options)
          @engine.warnings.concat(warnings)
          output
        end
      end
    end
  end
end
