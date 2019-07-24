module ServiceCaller
  module Base
    attr_reader :error, :result

    module ClassMethods
      def call(*args)
        service = new(*args)
        service.call
        service
      end
    end

    def success?
      error.nil? || error.empty?
    end

    def failed?
      !success?
    end
  end
end