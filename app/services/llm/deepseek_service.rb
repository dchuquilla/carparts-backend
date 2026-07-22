require 'net/http'
require 'json'

module LLM
  class DeepseekService
    DEEPSEEK_BASE_URL = Rails.application.credentials.dig(:deepseek_base_url) || "https://api.deepseek.com/v1"
    DEEPSEEK_API_KEY = Rails.application.credentials.dig(:deepseek_api_key)

    SYSTEM_PROMPTS = [
      "Eres un experto en JSON, en vehículos de todas las marcas y modelos en la historia. Se enviará el pedido de un repuesto de vehículo; auto, moto, camión, camioneta, etc. Por favor crea un objeto JSON siguiendo estas reglas",
      "COMPLEMENTARIO: Cuando el texto sea información adicional con el formato de codigo de 8 caracteeres alfaniméricos para la solicitud de repuesto de auto, responde con {\"state\": \"COLLECT_DATA\",\"request\": { \"part_chassis\": \"string\" }}",
      "COMENTARIO: Cuando el texto sea un comentario insultante sin relación con solicitar repuestos de auto, responde con {\"state\": \"COMMENT\"}",
      "INAPROPIADO: Cuando el texto sea un comentario con contenido sexual, insultante o acosador, responde con {\"state\": \"UNPLEASANT\"}",
      "EXCEPTION: Cuando el texto no sea un saludo, una solicitud de repuesto, la solicitud no incluya el nombre del repuesto, marca, modelo y/o año, o sea un comentario, responde con {\"state\": \"NO_REPLACEMENT\"}",
      "SALUDO: Cuando el texto sea un saludo sin informacion de alguna solicitud, responde con {\"state\": \"GREETING\"}",
      "ESTRUCTURA: {\"state\": \"PARSE_REQUEST\",\"request\": { \"part_name\": \"string\", \"part_brand\": \"string\", \"part_model\": \"string\", \"part_year\": \"string\" }}."
    ].freeze

    def self.parse_message(input)
      new.parse_message(input)
    end

    def parse_message(input)
      return { state: "ERROR_CREATE_REQUEST" } if input.blank?

      messages = [
        *SYSTEM_PROMPTS.map { |prompt| { role: "system", content: prompt } },
        { role: "user", content: input }
      ]

      response = call_deepseek_api("chat/completions", {
        model: "deepseek-chat",
        messages: messages,
        temperature: 0.5,
        max_tokens: 200
      })

      parse_response(response)
    rescue StandardError => e
      Rails.logger.error("Deepseek parse_message error: #{e.message}")
      { state: "ERROR_CREATE_REQUEST" }
    end

    private

    def call_deepseek_api(endpoint, payload)
      uri = URI("#{DEEPSEEK_BASE_URL}/#{endpoint}")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == "https"

      request = Net::HTTP::Post.new(uri.path, headers)
      request.body = JSON.generate(payload)

      response = http.request(request)
      handle_response(response)
    end

    def handle_response(response)
      case response.code.to_i
      when 200
        JSON.parse(response.body)
      else
        Rails.logger.error("Deepseek API error: #{response.code} - #{response.body}")
        { error: "API Error", status: response.code }
      end
    rescue JSON::ParserError => e
      Rails.logger.error("Failed to parse Deepseek response: #{e.message}")
      { error: "Invalid response format" }
    end

    def parse_response(response)
      return { state: "ERROR_CREATE_REQUEST" } if response["error"].present?

      begin
        content = response.dig("choices", 0, "message", "content")
        return { state: "ERROR_CREATE_REQUEST" } if content.blank?

        parsed = JSON.parse(content)
        parsed.is_a?(Hash) ? parsed : { state: "ERROR_CREATE_REQUEST" }
      rescue JSON::ParserError => e
        Rails.logger.error("Failed to parse Deepseek message content: #{e.message}")
        { state: "ERROR_CREATE_REQUEST" }
      end
    end

    def headers
      {
        "Authorization" => "Bearer #{DEEPSEEK_API_KEY}",
        "Content-Type" => "application/json"
      }
    end
  end
end
