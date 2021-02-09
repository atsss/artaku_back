description = str = <<~EOS
  Atsushi was born in Oslo, Norway and raised in Chiba, Japan. He studied Mechanical Engineering at university. While at university, he also studied the history of South America and Spanish in Bogota, Colombia and Buenos Aires, Argentina for 8 months.
  After staying in South America, Atsushi did an internship in a food startup based in San Francisco, USA. Thanks to his experiences in San Francisco, he became interested in software engineering and started to teach himself how to code.
  He finished the internship in San Francisco and started to work for a construction startup as a software engineer in Japan and became a full-time worker there after graduating from university. As well as his experience in development, Atsushi has also been doing user research and UI/UX design for three years. During this time, he has been in charge of the development and design of two services.
  While working, he nurtured a strong interest in UX and went on to study human-centred design in a graduate school.
  He believes everything has a logic behind itself. He’d like to create logic from chaos and wants to keep doing that until he dies.
EOS

user = User.create!(slug: 'ats', name: 'Atsushi Ito', description: description)

artworks = [
  { title: 'title01', description: 'description01', published_at: Time.current, width: 100, height: 400,
    style: 'Pencil', material: 'Panel', completed_at: Time.current.ago(2.months) },
  { title: 'title02', description: 'description02', published_at: Time.current, width: 200, height: 500,
    style: 'Pencil', material: 'Panel', completed_at: Time.current.ago(1.months) },
  { title: 'title03', description: 'description03', published_at: Time.current, width: 300, height: 600,
    style: 'Pencil', material: 'Panel' }
]

artworks.each { |artwork| user.artworks.create!(artwork) }

description = str = <<~EOS
  Rather than focusing on the color, I focused on the shape to express depth.
  Next time, I would like to do something to make the contours stand out more.
EOS

Artwork.last.processes.create!(description: description, done_at: Time.current.ago(2.months))
