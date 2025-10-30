require 'service_extend/configuration'

class ServiceError < StandardError
  attr_reader :key
  attr_reader :error_obj

  class << self
    def generate_from_exception(exception, append_info={})
      if ServiceExtend.configuration.hide_exception_message
        error_message = ServiceExtend.configuration.hide_exception_message_replacement.to_s
      else
        error_message = "#{exception.class.name}: #{exception.message}"
      end
      error_obj = { error_message: error_message }.merge!(append_info)
      service_err = new(:internal_error, error_obj)
      service_err.set_backtrace(exception.backtrace) unless ServiceExtend.configuration.hide_exception_backtrace
      service_err
    end
  end

  def initialize(key, error_obj={})
    @key = key
    error_message = error_obj.delete(:error_message) || key
    @error_obj = error_obj
    super(error_message)
  end
end
