class Name < ApplicationRecord

  belongs_to :list

  before_validation(on: :create) do
    self.name = self.name.strip
  end

  validate :validate_name, on: :create

  

  def validate_name
    if self.name.length == 0 
      self.errors.add(:base, "You should enter the name")
    end
    if self.list.names.find_by("LOWER(name) = ?", self.name.downcase)
      self.errors.add(:base, "Name is not unique")
    end
    if !(/^[a-zA-Z\s]*$/ === self.name)
      self.errors.add(:base, "Name should contain only letters")
    end
    if self.name.count(" ") > 1
      self.errors.add(:base, "Name should contain only one space")
    end



  end

  def all_names
    Name.where(list: self.list).order(:manual)
  end

  def next_manual
    if self.all_names.length > 0
      return self.all_names.maximum(:manual) + 20
    else
      return 20
    end
  end

  def arrange_manuals
    self.all_names.each.with_index(1){|name, index|
      name.update(manual: index*20)
    }
  end

end
