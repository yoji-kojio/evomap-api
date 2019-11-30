class AddFrontendRequirements < SeedMigration::Migration
  def up
    requirements_list = [
      'HTML', 'CSS', 'Javascript Basico', 'Gerenciadores de pacotes',
      'Pre-processadores CSS', 'Frameworks CSS', 'Arquitetura CSS',
      'Ferramentas de Build', 'Frameworks Javascript', 'Testes frontend',
      'Progressive Web Apps', 'Typescript', 'Server Side Rendering',
      'Geradores de sites estaticos', 'Aplicacoes Moveis', 'Web Assembly',
      'Continue aprendendo'
    ]

    requirements_list.each do |requirement|
      new_req = Requirement.find_or_create_by(name: requirement)
      career = Career.where(name: "Desenvolvedor Frontend").first

      CareerRequirement.find_or_create_by(career_id: career.id, requirement_id: new_req.id)
    end
  end

  def down
    requirements_list = [
      'HTML', 'CSS', 'Javascript Basico', 'Gerenciadores de pacotes',
      'Pre-processadores CSS', 'Frameworks CSS', 'Arquitetura CSS',
      'Ferramentas de Build', 'Frameworks Javascript', 'Testes frontend',
      'Progressive Web Apps', 'Typescript', 'Server Side Rendering',
      'Geradores de sites estaticos', 'Aplicacoes Moveis', 'Web Assembly',
      'Continue aprendendo'
    ]

    Requirement.where(name: requirements_list).delete_all
  end
end
