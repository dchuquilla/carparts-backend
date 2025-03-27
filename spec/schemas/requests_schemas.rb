module Schemas
  class RequestIndexSchema
    def self.response_payload
      {
        type: :array,
        items: RequestCreateSchema.response_payload
      }
    end
  end

  class RequestCreateSchema
    def self.request_payload
      {
        type: :object,
        properties: {
          request: {
            type: :object,
            properties: {
              user_phone: { type: :string },
              user_name: { type: :string },
              user_email: { type: :string },
              part_name: { type: :string },
              part_brand: { type: :string },
              part_model: { type: :string },
              part_year: { type: :integer },
              part_image: { type: :string }
            }
          }
        }
      }
    end

    def self.response_payload
      {
        type: :object,
        properties: {
          request: {
            type: :object,
            properties: {
              id: { type: :integer },
              part_name: { type: :string },
              part_brand: { type: :string },
              part_model: { type: :string },
              part_year: { type: :integer },
              part_image: { type: :string },
              part_chassis: { type: :string },
              show_key: { type: :string },
              created_at: { type: :string },
              state: { type: :number },
              pending_data: { type: :array, items: { type: :string } }
            }
          }
        }
      }
    end
  end
end
