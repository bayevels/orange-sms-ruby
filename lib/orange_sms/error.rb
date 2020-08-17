module OrangeSms
  module Error
    class AuthenticationError < StandardError
      attr_reader :message, :response, :status, :more_info, :error_message

      def initialize(message, response)
        @status = response.status
        body = JSON.parse(response.body)
        @error_message = body.fetch('error', nil)
        @more_info = body.fetch('error_description', nil)
        @message = format_message(message)
        @response = response
      end

      def to_s
        message
      end

      private

      def format_message(initial_message)
        message = "[HTTP #{status}] #{initial_message}"
        message += "\n#{error_message}" if error_message
        message += "\n#{more_info}" if more_info
        message += '\n For more details on Orange Authentication errors see https://developer.orange.com/tech_guide/2-legged-oauth/'
        message + "\n\n"
      end
    end

    class ApiError < StandardError
      attr_reader :message, :response, :status, :error_message

      def initialize(message, response)
        @status = response.status
        body = JSON.parse(response.body)
        @code = body.fetch('code', nil)
        @error_message = body.fetch('message', nil)
        @description = body.fetch('description', nil)
        @message = format_message(message)
        @response = response
      end

      def to_s
        message
      end

      private

      def format_message(initial_message)
        message = "[HTTP #{status}] #{code} : #{initial_message}"
        message += "\n#{error_message}" if error_message
        message += "\n#{description}" if description
        message += '\n For more details on Orange Api errors see https://developer.orange.com/apis/sms-sn/api-reference'
        message + "\n\n"
      end
    end
  end
end
