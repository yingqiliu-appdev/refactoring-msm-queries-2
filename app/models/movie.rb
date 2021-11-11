# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  description :text
#  duration    :integer
#  image       :string
#  title       :string
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  director_id :integer
#

class Movie < ApplicationRecord

  # only used to define one to one relationship
  belongs_to(:director, { :foreign_key => "director_id", :class_name => "Director"})

  #same as
#   def director
#     key = self.director_id

#     matching_set = Director.where({ :id => key })

#     the_one = matching_set.at(0)

#     return the_one
#   end

# Used to define many to many relation, i.e., array
  has_many(:characters, { :class_name => "Character", :foreign_key => "movie_id"})

end