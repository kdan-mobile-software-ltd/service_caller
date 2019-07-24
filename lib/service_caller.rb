require 'service_caller/base'
require 'service_caller/exception'
require 'service_caller/handler'

class ServiceCaller
  include Base
  extend Base::ClassMethods
  prepend Handler
end