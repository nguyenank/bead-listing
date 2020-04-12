module BeadsHelper

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

def dropdown_color_generate()
  col =  Bead.color_counts.pluck(:name).uniq.sort_by!{|e| e.downcase}
  content_tag :datalist, id: "color" do
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
