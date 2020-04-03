module BeadsDisplayHelper

# generate display information about one bead
def one_bead(bead,descriptionInclude: false)
  content_tag :div, class: "bead", id:bead.id do
    if(bead.photo.attached?)
      concat(image_tag(bead.photo, class: "bead-photo"))
    elsif (!descriptionInclude)
      concat(image_tag("default.png", class: "bead-photo-placeholder"))
    end
    concat(content_tag(:p,
          (content_tag(:span, "Brand", class: "underline"))\
          +(content_tag(:span, ": "))+ bead.brand))
    concat(content_tag(:p,
          (content_tag(:span, "Color", class: "underline"))\
          +(content_tag(:span, ": "))+ bead.color))
    concat(content_tag(:p,
          (content_tag(:span, "Size", class: "underline"))\
          +(content_tag(:span, ": "))+ bead.size))
    concat(content_tag(:p,
          (content_tag(:span, "Shape", class: "underline"))\
          +(content_tag(:span, ": "))+ bead.shape))
    if(descriptionInclude)
      concat(content_tag(:p,
            (content_tag(:span, "Description", class: "underline"))\
            +(content_tag(:span, ": "))+ bead.description, class: "description"))
    end
    concat(bead_link(bead))
  end
end

def add_bead_card()
    content_tag :div, class: "bead" do
        concat(link_to("Add\n New\n Bead", new_bead_path, \
                 id: "add-bead" ))
    end
end

#generate edit/delete link for beads
def bead_link(bead)
  content_tag :div, class: "bead-links" do
    concat(link_to("Edit Bead", edit_bead_path(bead.id), \
           class: "bead-link" ))
    concat(content_tag(:span, " | ", class: "link-divider"))
    concat(link_to("Delete Bead", bead_path(bead), method: :delete, \
           class: "bead-link", data: {confirm: "Are you sure you want to delete this bead?"} ))
  end
end

end
