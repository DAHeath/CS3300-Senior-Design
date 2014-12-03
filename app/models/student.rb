class Student < ActiveRecord::Base
  belongs_to :team
  has_many :join_team_contracts
  validates :first_name, length: {in: 2..20}
  validates :last_name, length: {in: 2..20}


  def full_name
    "#{first_name} #{last_name}"
  end
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      student = find_by_id(row["id"]) || new
      student.attributes = row.to_hash.slice(*row.to_hash.keys)
      student.save!
    end
  end
end
