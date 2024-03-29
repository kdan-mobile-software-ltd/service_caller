module ServiceExtend
  module Callable
    attr_reader :error, :result

    module ClassMethods
      def call(*args, **hsh)
        service = new(*args, **hsh)
        service.call
        service
      end
    end

    def success?
      error.nil?
    end

    def failed?
      !success?
    end
  end
end