class ServiceError < StandardError
  attr_reader :code

  class << self
    def generate_from_exception(exception)
      service_err = new(500, "#{exception.class.name}: #{exception.message}")
      service_err.set_backtrace(exception.backtrace)
      service_err
    end

    def generate_from_hash(error_hash)
      new(error_hash[:error_code], error_hash[:error_message])
    end
  end

  def initialize(code, message)
    @code = code
    super(message)
  end
end