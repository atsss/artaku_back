module Types
  class MutationType < Types::Objects::Base
    field :update_wall, mutation: Mutations::Updates::Wall
  end
end
