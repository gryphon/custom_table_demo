class User < ApplicationRecord
  include CustomTableSettings

  devise :database_authenticatable, :rememberable, :validatable, :trackable

  def self.ransackable_attributes(auth_object = nil)
    []
  end

  def self.ransackable_scopes(auth_object = nil)
    []
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

end
