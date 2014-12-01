class Team < ActiveRecord::Base
  has_one :point_of_contact, :class_name => "Student"
  has_many :students
  has_many :bids
  has_many :join_team_contracts

end
