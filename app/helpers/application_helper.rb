module ApplicationHelper
    def title(page_title)
        content_for(:title) { page_title }
        #http://railscasts.com/episodes/30-pretty-page-title?autoplay=true
    end
end
