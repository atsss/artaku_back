module Types
  module Objects
    class Base < GraphQL::Schema::Object
      field_class Types::Fields::Base
    end
  end
end
