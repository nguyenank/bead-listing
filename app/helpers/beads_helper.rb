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

end
