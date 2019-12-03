class CreateFrontendContentAndRequirements < SeedMigration::Migration
  def up
    content_list.each do |content|
      Content.find_or_create_by!(name: content[0], url: content[1], image_url: content[2])
    end

    content_list.each do |content|
      new_content = Content.find_by_name(content[0])
      new_requirement = Requirement.find_by_name(content[0])

      if new_content.present? && new_requirement.present?
        RequirementContent.create!(enabled: true, requirement_id: new_requirement.id, content_id: new_content.id)
      end
    end
  end

  def down
    content_list.each do |content|
      search_content = Content.find_by_name(name: content[0])
      search_content.destroy if search_content.present?
    end

    content_list.each do |content|
      content = Content.find_by_name(content[0])
      requirement = Requirement.find_by_name(content[0])

      if content.present? && requirement.present?
        search_requirement = RequirementContent.find_by(requirement_id: requirement.id, content_id: content.id)
        search_requirement.destroy if search_requirement.present?
      end
    end
  end

  def content_list
    [
      ['HTML', 'https://www.w3schools.com/html/', 'https://i.ytimg.com/vi/rTOKBwtvMQw/maxresdefault.jpg'],
      ['CSS', 'https://www.w3schools.com/css/', 'https://arquivo.devmedia.com.br/marketing/img/guia-css-38149.png'],
      ['Javascript Basico', 'https://www.w3schools.com/js/', 'https://dkrn4sk0rn31v.cloudfront.net/2018/03/01133925/javascript.png'],
      ['Gerenciador de pacotes', 'https://www.sitepoint.com/beginners-guide-node-package-manager/', 'https://www.callicoder.com/assets/images/post/large/npm-package-manager-for-node-js.jpg'],
      ['Pre-processadores CSS', 'https://developer.mozilla.org/en-US/docs/Glossary/CSS_preprocessor', 'https://www.emotionstudios.net/wp-content/uploads/2019/04/css_preprocesors.jpg'],
      ['Frameworks CSS', 'https://www.sitepoint.com/a-css-framework-in-6-minutes-with-bulma/', 'https://miro.medium.com/max/780/1*YKgh6DRGSrsKIOi3jTGouQ.png'],
      ['Arquitetura CSS', 'https://seesparkbox.com/foundry/thoughtful_css_architecture', 'https://s3.amazonaws.com/ckl-website-static/wp-content/uploads/2016/03/css-architecture-1280x680.jpg'],
      ['Ferramentas de Build', 'https://coreui.io/docs/getting-started/build-tools/', 'https://hackernoon.com/hn-images/1*uvBF2Fo6hPnPu1KsRBH_Uw.png'],
      ['Frameworks Javascript', 'https://www.afterhoursprogramming.com/tutorial/javascript/frameworks/', 'https://img.devrant.com/devrant/rant/r_2036843_A7g55.jpg'],
      ['Testes frontend', 'https://dev.to/christopherkade/introduction-to-front-end-unit-testing-510n', 'https://www.guru99.com/images/1/111617_0434_WhatisFront1.png'],
      ['Progressive Web Apps', 'https://developers.google.com/web/progressive-web-apps', 'https://miro.medium.com/max/2800/1*6DCP9J24eCy7JGUojnq1WA.png'],
      ['Server Side Rendering', 'https://flaviocopes.com/react-server-side-rendering/', 'https://miro.medium.com/max/2800/1*vqhwJbAmYIOQ20Va8RI6zg.png'],
      ['Geradores de sites estaticos', 'treinaweb.com.br/blog/geradores-de-sites-blogs-estaticos-o-que-sao-e-por-que-usa-los/', ''],
      ['Aplicacoes Moveis', 'https://www.tutorialspoint.com/mobile_development_tutorials.htm', 'https://dkrn4sk0rn31v.cloudfront.net/2018/03/28132543/img-hanashiro_1024.png'],
      ['Web Assembly', 'https://webassembly.org/getting-started/developers-guide/', 'https://miro.medium.com/max/3200/1*f__SEWRvsNwt4B-u8-85Bw.png'],
      ['Continue aprendendo', 'https://www.udemy.com/topic/front-end-web-development/', 'https://analistamodelosdenegocios.com.br/wp-content/uploads/2017/11/Modelo-de-Negocio-da-Udemy.jpg'],
    ]
  end
end
