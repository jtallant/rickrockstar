module ApplicationHelper

	def add_parts_to_page(page,parts=['Body','Side Body'])
		parts.each do |part|
			new_part = Refinery::PagePart.new
			new_part.title = part
			new_part.refinery_page_id = page.id
			new_part.save
		end
	end

	def insert_page_with_children(parent,children)
		if p = Refinery::Page.find_by_title(parent.titleize)
			if p.destroy
				puts "Destroyed page"
			end
		end

		p = Refinery::Page.new
		p.title = parent.titleize
		p.save
		puts "Created page #{p.title}"

		add_parts_to_page(p)

		children.each do |child|
			c = Refinery::Page.new
			c.title = child.titleize
			c.parent_id = p.id
			c.save
			puts "Created child page #{c.title}"

			add_parts_to_page(c)
		end
	end

	def insert_pages(pages)
		pages.each do |page|
			if p = Refinery::Page.find_by_title(page.titleize)
				if p.destroy
					puts "Destroyed page"
				end
			end

			p = Refinery::Page.new
			p.title = page.titleize
			p.save
			puts "Created page #{p.title}"

			add_parts_to_page(p)
		end
	end

end