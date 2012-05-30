module ApplicationHelper
	def insert_page_with_children(parent,children)
		# Refinery::Page.find_or_create_by_title(parent)
		if Refinery::Page.find_by_title(parent).nil?
			p = Refinery::Page.new
			p.title = parent
			p.save
			puts "Created page #{p.title}"
		end
		children.each do |child|
			if Refinery::Page.find_by_title(child).nil?
				c = Refinery::Page.new
				c.title = child
				c.parent_id = p.id
				c.save
				puts "Created page #{c.title}"
			end
		end
	end
end
