class Author < ApplicationRecord

  has_many :books, dependent: :destroy
  acts_as_list
  
  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end

  def self.ransackable_scopes(auth_object = nil)
    []
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

end
