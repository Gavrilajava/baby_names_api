class Name < ApplicationRecord

  belongs_to :list

  before_validation(on: :create) do
    self.name = self.name.strip
  end

  validate :validate_name, on: :create

  

  def validate_name
    if self.list.names.find_by("LOWER(name) = ?", self.name.downcase)
      self.errors.add(:base, "Name is not unique")
    end
    # if !(/^[a-zA-Z]+(\s{0,1}[a-zA-Z])*$/ === self.name) don't know why it isn't working
    if !(/^[a-zA-Z\s]*$/ === self.name) || self.name.split(" ").length > 2
      self.errors.add(:base, "Name is not valid")
    end
  end

  def all_names
    Name.where(list: self.list).order(:manual)
  end

  def next_manual
    self.all_names.maximum(:manual) + 20
  end

  def arrange_manuals
    self.all_names.each.with_index(1){|name, index|
      name.update(manual: index*20)
    }
  end

end
