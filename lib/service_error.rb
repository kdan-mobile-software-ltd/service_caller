class ServiceError < StandardError
  attr_reader :key

  class << self
    def generate_from_exception(exception)
      service_err = new(:internal_error, "#{exception.class.name}: #{exception.message}")
      service_err.set_backtrace(exception.backtrace)
      service_err
    end
  end

  def initialize(key, message=nil)
    @key = key
    super(message)
  end
end