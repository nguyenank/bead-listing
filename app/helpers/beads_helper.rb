module BeadsHelper

  def bead_list(beads)
    string = ""
    beads.each do |bead|
      string += bead.brand
      string += bead.color
      string += bead.size
      string += bead.shape
    end
    return string
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



end
