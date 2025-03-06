module Schemas
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
              part_year: { type: :integer }
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
              part_year: { type: :integer }
            }
          }
        }
      }
    end
  end
end
