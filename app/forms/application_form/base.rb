module ApplicationForm
  require 'reform/form/validation/unique_validator'

  class Base < Reform::Form
    include Reform::Form::ActiveModel::ModelReflections
  end
end
