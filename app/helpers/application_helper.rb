module ApplicationHelper

	# Returns the full title on a per-page basis
	def full_title(page_title)
		base_title = "Daniel Chang's First Project App"
		if (page_title.empty?)
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end

end

def javascript(*files)
	content_for(:head) { javascript_include_tag(*files) }
end


