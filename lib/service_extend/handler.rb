module ServiceExtend
  module Handler
    def call
      super
    rescue ServiceError => e
      @error = e
    rescue Exception => e
      @error = ServiceError.generate_from_exception(e)
    end
  end
end