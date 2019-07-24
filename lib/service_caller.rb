require 'service_extend/callable'
require 'service_extend/handler'
require 'service_error'

class ServiceCaller
  include ServiceExtend::Callable
  extend ServiceExtend::Callable::ClassMethods
  prepend ServiceExtend::Handler
end