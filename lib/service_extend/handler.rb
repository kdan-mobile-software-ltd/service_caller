module ServiceExtend
  module Handler
    def call
      defined?(::Rails::Engine) ? rails_call : ruby_call
    end

    private

    def ruby_call
      super
    rescue ServiceError => e
      @error = e
    rescue Exception => e
      @error = ServiceError.generate_from_exception(e)
    end

    def rails_call
      super
    rescue ServiceError => e
      @error = e
    rescue ActiveRecord::RecordNotFound => e
      @error = ServiceError.new(404, e.message)
      @error.set_backtrace(e.backtrace)
    rescue Exception => e
      @error = ServiceError.generate_from_exception(e)
    end
  end
end