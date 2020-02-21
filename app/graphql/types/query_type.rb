module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :get_categories, [Types::CategoryType], null: true

    field :get_category, Types::CategoryType, null: true do
      argument :id, Integer, required: true
    end

    field :get_parts, [Types::PartType], null: true do
      argument :category_id, Integer, required: false
    end

    def get_parts(category_id: nil)
      scope = Part.all
      unless category_id.nil?
        scope = scope.where(category_id: category_id.to_i)
      end
      scope
    end

    field :get_part, Types::PartType, null: true do
      argument :id, Integer, required: true
    end

    def get_part(id:)
      Part.find_by(id: id)
    end

    private

    def get_categories
      Category.all
    end

    def get_category(id:)
      Category.find_by(id: id)
    end
  end
end
