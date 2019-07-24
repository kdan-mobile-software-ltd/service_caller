require 'service_extend/callable'
require 'service_extend/handler'
require 'service_error'

class ServiceCaller
  include ServiceExtend::Callable
  extend ServiceExtend::Callable::ClassMethods

  def self.inherited(child_class)
    child_class.prepend(ServiceExtend::Handler)
    super
  end
end