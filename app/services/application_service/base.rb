module ApplicationService
  class Base
    def self.call(params = {})
      new(params).()
    end

    def initialize(params = {})
      @params = params
    end

    protected

    attr_reader :params
  end
end
