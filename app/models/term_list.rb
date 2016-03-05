class TermList < ActiveRecord::Base
  
  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  
#  scope :sorted, order('beer_lists.name ASC')
#  scope :favorite, order('beer_lists.rating DESC, beer_lists.name ASC')
#  scope :one, where(:level => 1)

  
  def self.search(search)
    search_condition = search 

    where("name ILIKE ?", search_condition)

  end
  
end