class CreateBackEndRequirements < SeedMigration::Migration
  def up
    backend_career = Career.find_by_name('Desenvolvedor Backend')

    requirements_hash.each do | key, value |
      new_requirement = Requirement.find_or_create_by(name: key, description: value)
      CareerRequirement.find_or_create_by(career_id: backend_career.id, requirement_id: new_requirement.id)
    end
  end

  def down
    Requirement.where(name: requirements_hash.keys).delete_all
    CareerRequirement.where(career_id: backend_career).delete_all
  end

  def requirements_hash
    {
      'Linguagens de Script' => 'descricao padrao sobre Linguagens de Script',
      'Linguagens Funcionais' => 'descricao padrao sobre Linguagens Funcionais',
      'Outras Linguagens' => 'descricao padrao sobre Outras Linguagens',
      'Pratique o que voce aprendeu' => 'descricao padrao sobre Pratique o que voce aprendeu',
      'Padroes e Boas Praticas' => 'descricao padrao sobre Padroes e Boas Praticas',
      'Faca e distribua algum pacote ou biblioteca' => 'descricao padrao sobre Faca e distribua algum pacote ou biblioteca',
      'Contribua para algum projeto Open Source' => 'descricao padrao sobre Contribua para algum projeto Open Source',
      'Testes' => 'descricao padrao sobre Testes',
      'Banco de Dados Relacional' => 'descricao padrao sobre Banco de Dados Relacional',
      'Frameworks' => 'descricao padrao sobre Frameworks',
      'Banco de Dados Nao-relacional' => 'descricao padrao sobre Banco de Dados Nao-relacional',
      'Caching' => 'descricao padrao sobre Caching',
      'API RESTful' => 'descricao padrao sobre API RESTful',
      'Autenticacao/Autorizacao' => 'descricao padrao sobre Autenticacao/Autorizacao',
      'Message Brokers' => 'descricao padrao sobre Message Brokers',
      'Search Engines' => 'descricao padrao sobre Search Engines',
      'Docker' => 'descricao padrao sobre Docker',
      'Web Servers' => 'descricao padrao sobre Web Servers',
      'Web Sockets'  => 'descricao padrao sobre Web Sockets',
      'Aprenda GraphQL' => 'descricao padrao sobre Aprenda GraphQL',
      'Graph Database' => 'descricao padrao sobre Graph Database',
    }
  end
end
