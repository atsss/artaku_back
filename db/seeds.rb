description = <<~EOS
  Atsushi was born in Oslo, Norway and raised in Chiba, Japan. He studied Mechanical Engineering at university. While at university, he also studied the history of South America and Spanish in Bogota, Colombia and Buenos Aires, Argentina for 8 months.
  After staying in South America, Atsushi did an internship in a food startup based in San Francisco, USA. Thanks to his experiences in San Francisco, he became interested in software engineering and started to teach himself how to code.
  He finished the internship in San Francisco and started to work for a construction startup as a software engineer in Japan and became a full-time worker there after graduating from university. As well as his experience in development, Atsushi has also been doing user research and UI/UX design for three years. During this time, he has been in charge of the development and design of two services.
  While working, he nurtured a strong interest in UX and went on to study human-centred design in a graduate school.
  He believes everything has a logic behind itself. He’d like to create logic from chaos and wants to keep doing that until he dies.
EOS

user = User.create!(slug: 'ats', name: 'Atsushi Ito', description: description)
user_image = user.create_image!
user_image.main.attach(io: File.open("#{Rails.root}/public/samples/user01.jpg"), filename: "user01.jpg")

description01 = <<~EOS
  Artaku is a service platform that connects art lovers and artists by providing artworks on rental and creating a home gallery experience. It aims to democratize the art experience and make it accessible for everyone, everywhere.

  It provides an opportunity to integrate art with everyday life by creating an art gallery experience at home. Millennial art lovers can discover artworks by local artists, rent them, host a home gallery and connect with fellow art lovers.

  I was in charge of business research, experience prototyping, design, and development. Decided not to pursue this concept because there were no needs in New York City.
EOS
description02 = <<~EOS
  Tailart provides a place to display their work and more exposure for the artists. Unlike the usual, Tailart allows artists to choose the multiple locations where their work will be displayed first. The locations are the home of the art lovers who own the Tailart. By showing the process of creation of the work, it provides an opportunity to see the work for a longer period of time in one piece.
EOS
description03 = <<~EOS
  Building Memories is a project that with help of machine learning, buildings can gather everyday data and start building their own language, reflect on their own dreams and express their own voice with humans who visit them.
EOS

attributes = [
  { title: 'title01', description: description01, completed_at: Time.current.ago(2.months) },
  { title: 'title02', description: description02, completed_at: Time.current.ago(1.months) },
  { title: 'title03', description: description03 }
]

attributes.each do |attribute|
  artwork = user.artworks.create!(attribute)
  image = artwork.images.create!
  image.main.attach(io: File.open("#{Rails.root}/public/samples/artwork01.jpg"), filename: "artwork01.jpg")
end

references = [
  { kind: :code, url: 'https://github.com/atsss' },
  { kind: :document, url: 'http://ciid.dk/education/students-2020/atsushi-ito' }
]
references.each { |reference| Artwork.first.references.create!(reference) }

description = <<~EOS
  Rather than focusing on the color, I focused on the shape to express depth.
  Next time, I would like to do something to make the contours stand out more.
EOS

Artwork.last.processes.create!(description: description, done_at: Time.current.ago(2.months))
