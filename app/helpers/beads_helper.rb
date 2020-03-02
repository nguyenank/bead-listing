module BeadsHelper

#generates viewpage tile display
def bead_list()
  content_tag :div, class: "bead-list" do
    Bead.order(updated_at: :desc).collect do |bead|
        concat(bead_tile(bead))
    end
    # https://medium.com/developedbyjohn/equal-width-flex-items-a5ba1bfacb77
    3.times do
      concat(content_tag :div, "", class: "bead-placeholder")
    end
  end
end

# generates automatic dropdown options for new/edit page
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

private

  #generates individual tile for view page
  def bead_tile(bead)
    link_to bead_path(bead.id) do
      concat(one_bead(bead))
    end
  end


end
