module ApplicationQuery
  class Base
    def initialize(relation = relation_model.all)
      @relation = relation
    end

    private

    attr_reader :relation

    def relation_model
      self.class.name.gsub(/Query\z/, '').singularize.constantize
    end
  end
end
