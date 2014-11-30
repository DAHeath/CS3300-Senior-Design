module JoinTeamContractsHelper

  def team_accept(contract)
    contract.team_accepted = true
    if complete?(contract)
      execute_contract(contract)
    end
    contract.save
  end

  def student_accept(contract)
    contract.student_accepted = true
    if complete?(contract)
      execute_contract(contract)
    end
    contract.save
  end

  def complete?(contract)
    contract.team_accepted && contract.student_accepted
  end

  def execute_contract(contract)
    team = Team.find_by(id: contract.team_id)
    student = Student.find_by(id: contract.student_id)
    team.students << student
    student.team_id = team.id
    student.save
    team.save
  end
end
