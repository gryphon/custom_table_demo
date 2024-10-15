class Genre < ApplicationRecord

  belongs_to :parent, optional: true, class_name: "Genre"
  has_many :children, inverse_of: :parent, foreign_key: :parent_id, dependent: :destroy, class_name: "Genre"
  has_many :books, dependent: :destroy

  def to_s
    name
  end

  def self.ransackable_attributes(auth_object = nil)
    ["name", "parent"]
  end

  def self.ransackable_scopes(auth_object = nil)
    []
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

end
