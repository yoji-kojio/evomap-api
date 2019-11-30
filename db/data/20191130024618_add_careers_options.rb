class AddCareersOptions < SeedMigration::Migration
  def up
    Career.create(name: "Desenvolvedor Frontend", description: "Programador que implementa a interface de usuario")
    Career.create(name: "Desenvolvedor Backend", description: "Programador que implementa o sistema da aplicacao")
    Career.create(name: "DevOps", description: "Auxilia na integracao entre as equipes de desenvolvimento de softwares")
  end

  def down
    Career.delete_all
  end
end
