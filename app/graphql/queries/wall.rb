module Queries
  class Wall < Base
    type Types::Objects::Wall, null: true

    argument :id, ID, required: true

    def resolve(id: nil)
      ::Wall.find(id)
    end
  end
end
