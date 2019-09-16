class ServiceError < StandardError
  attr_reader :key
  attr_reader :error_obj

  class << self
    def generate_from_exception(exception)
      service_err = new(:internal_error, error_msg: "#{exception.class.name}: #{exception.message}")
      service_err.set_backtrace(exception.backtrace)
      service_err
    end
  end

  def initialize(key, error_obj={})
    @key = key
    @error_obj = error_obj
    super(error_obj[:error_msg] || key)
  end
end