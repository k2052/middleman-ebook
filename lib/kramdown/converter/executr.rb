module Kramdown
  module Converter
    class Executr < ::Kramdown::Converter::Html
      def convert_codeblock(el, indent)
        attr = el.attr.dup
        lang = extract_code_language!(attr)
        result = Pygments.highlight(code, :lexer => lang)

        "#{' '*indent}<pre><code #{html_attributes(attr)} executable='true's>#{result}#{' '*indent}</code></pre>\n"
      end
    end
  end
end
