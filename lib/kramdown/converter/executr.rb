module Kramdown
  module Converter
    class Executr < ::Kramdown::Converter::Html
      def convert_codeblock(el, indent)
        attr = el.attr.dup
        lang = extract_code_language!(attr)

        attr["class"] = "" unless attr["class"]
         
        if lang == "javascript" or lang == "coffeescript" and attr['executable'] != false
          attr["class"] << " executable"
          attr['executable'] = true
        end
        
        attr['data-type'] = lang
        attr['class'] <<  " language-#{lang}"

        "#{' '*indent}<pre><code #{html_attributes(attr)}>#{el.value}#{' '*indent}</code></pre>\n"
      end

      def convert_textblock(el, indent)
        result = "<table class='#{el.attr["textblock_type"]} sidebarish textblock'>"
        result << "<tbody> <tr>"

        result << "<td class='textblock-sidebar-icon-wrap'><i class='textblock-sidebar-icon icon-#{el.attr["textblock_type"]}'></i></td>"
        result << "<td>"

        result << inner(el, indent)

        el.attr.delete("textblock_type")

        result << <<-eos      
                </td>
              </tr>
            </tbody>
          </table>
        eos
      end
    end
  end
end
