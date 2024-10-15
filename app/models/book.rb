class Book < ApplicationRecord
  belongs_to :genre, required: true
  belongs_to :author, required: true

  enum :status, {hot: 1, ordinary: 2, classics: 3}, default: "ordinary"

  def self.ransackable_attributes(auth_object = nil)
    ["name", "genre", "released_at", "status", "featured", "pages"]
  end

  def self.ransackable_scopes(auth_object = nil)
    []
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

end
