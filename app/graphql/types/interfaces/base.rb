module Types
  module Interfaces
    module Base
      include GraphQL::Schema::Interface

      field_class Types::Fields::Base
    end
  end
end
