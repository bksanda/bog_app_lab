class Creature < ActiveRecord::Base

  validates :name, :desc, presence: true
  validates :name, format: { with: /\A[a-z\sA-Z]+\z/, message: "only allows letters"}
  validates :name, :desc, length: { in: 3..255, message: "minimum is 3 characters"}
  validates :name, uniqueness: {message: "Already in the Bog!"}

end

creature = Creature.new
creature.valid? # => false
creature.errors.messages
 # => {:name=>["can't be blank", "is too short (minimum is 3 characters)"]}



