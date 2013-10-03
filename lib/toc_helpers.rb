module TocHelpers
	## Methods for helping with TOC
	def get_current_position_in_toc
		@table_of_contents.each_with_index do |chapter, index|
			 link = "/#{chapter.title.parameterize}"
	     link = chapter.link if chapter.link
	     if current_page.url == link or current_page.url == "#{link}/"
		     return index
	     end
		end
	end

	def prev_chapter_link
		prev = @table_of_contents[get_current_position_in_toc() - 1]
		link = "/#{prev.title.parameterize}"
		link = prev.link if prev.link
		return link
	end

	def next_chapter_link
		next_page = @table_of_contents[get_current_position_in_toc() + 1]
		link = "/#{next_page.title.parameterize}"
		link = next_page.link if next_page.link
		return link
	end

	def current_toc_pos_first?
		return true if get_current_position_in_toc() == 0
	end

	def current_toc_pos_last?
		return true if @table_of_contents[get_current_position_in_toc()] == @table_of_contents[-1]
	end
end
