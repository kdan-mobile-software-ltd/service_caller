module ServiceCaller
  class ServiceError < StandardError
    attr_reader :code

    class << self
      def generate_from_exception(exception)
        service_err = new(500, "#{exception.class.name}: #{exception.message}")
        service_err.set_backtrace(exception.backtrace)
        service_err
      end
    end

    def initialize(code, message)
      @code = code
      super(message)
    end
  end
end