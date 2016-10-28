class AlexaResponse
  attr_reader :application, :environment

  def initialize(payload:)
    @application = payload.dig(:request, :intent, :slots, :application, :name)
    @environment = payload.dig(:request, :intent, :slots, :environment, :name)
  end

  def as_json(options)
    {
      version: "1.0",
      response: {
        outputSpeech: {
          type: "PlainText",
          text: "HAL has deployed #{application} to #{environment}"
        },
        shouldEndSession: true
      }
    }
  end
end
