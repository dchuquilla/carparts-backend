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
  end
end
