class ServiceError < StandardError
  attr_reader :key
  attr_reader :error_obj

  class << self
    def generate_from_exception(exception, append_info={})
      error_obj = {error_msg: "#{exception.class.name}: #{exception.message}"}
      error_obj.merge!(append_info)
      service_err = new(:internal_error, error_obj)
      service_err.set_backtrace(exception.backtrace)
      service_err
    end
  end

  def initialize(key, error_obj={})
    @key = key
    error_msg = error_obj.delete(:error_msg) || key
    @error_obj = error_obj
    super(error_msg)
  end
end