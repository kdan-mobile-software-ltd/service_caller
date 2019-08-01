module ServiceExtend
  module Handler

    def call
      if defined?(::Rails::Engine)
        begin
          super
        rescue ServiceError => e
          @error = e
        rescue ActiveRecord::RecordNotFound => e
          @error = ServiceError.new(404, e.message)
          @error.set_backtrace(e.backtrace)
        rescue Exception => e
          @error = ServiceError.generate_from_exception(e)
        end
      else
        begin
          super
        rescue ServiceError => e
          @error = e
        rescue Exception => e
          @error = ServiceError.generate_from_exception(e)
        end
      end
    end

  end
end