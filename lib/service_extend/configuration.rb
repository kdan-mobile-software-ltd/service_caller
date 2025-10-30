module ServiceExtend
  class Configuration

    attr_accessor :hide_exception_message
    attr_accessor :hide_exception_message_replacement
    attr_accessor :hide_exception_backtrace

    def initialize
      @hide_exception_message = false
      @hide_exception_message_replacement = ''
      @hide_exception_backtrace = false
    end
  end

  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration) if block_given?
    end
  end
end
