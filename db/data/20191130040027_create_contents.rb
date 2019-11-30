class CreateContents < SeedMigration::Migration
  def up
    content = Content.find_or_create_by(name: "Content example", url: "https://google.com", image_url:"https://static.techspot.com/images2/news/bigimage/2018/07/2018-07-10-image-35.jpg")

    Requirement.all.each do |req|
      RequirementContent.find_or_create_by(requirement_id: req.id, content_id: content.id)
    end
  end

  def down
    content = Content.find_by_name("Content example")

    RequirementContent.where(content_id: content.id).delete_all
  end
end
