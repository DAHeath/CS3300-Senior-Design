class Student < ActiveRecord::Base
  belongs_to :team
  has_many :join_team_contracts
  validates :first_name, length: {in: 3..20}
  validates :last_name, length: {in: 3..20}

	def full_name
    "#{first_name} #{last_name}"
  end
end
