module ApplicationService
  class FormService < Base
    def initialize(params = {})
      @model  = params.fetch(:model, class_name.new)
      @params = params.fetch(:params, {}).merge(params.fetch(:additional, {}))
    end

    def call
      form.save if form.validate(params)

      form
    end

    def self.form_class(form_class)
      define_method :form_class do
        form_class
      end
    end

    private

    attr_reader :model

    def form
      @form ||= form_class.new(model)
    end

    def class_name
      form_class.parent_name.gsub(/Form\z/, '').constantize
    end
  end
end
