module BeadsHelper

def bead_list()
  content_tag :div, class: "bead-list" do
    Bead.order(updated_at: :desc).collect do |bead|
        concat(bead_link(bead))
    end
    3.times do
      concat(content_tag :div, "", class: "bead-placeholder")
    end
  end
end

# https://stackoverflow.com/a/50450751
# https://stackoverflow.com/a/4674091
def dropdown_generate(column_name)
  col =  Bead.order(updated_at: :desc).pluck(column_name).uniq
  content_tag :datalist, id: column_name do
    col.collect do |opt|
      concat(content_tag(:option, opt))
    end
  end
end

def each_bead(bead)
  content_tag :div, class: "bead", id:bead.id do
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
    concat(link_to("Edit Bead", edit_bead_path(bead.id), class: "bead-link" ))
  end
end

private

  def bead_link(bead)
    link_to bead_path(bead.id) do
      concat(each_bead(bead))
    end
  end


end
