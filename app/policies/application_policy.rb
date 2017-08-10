class ApplicationPolicy
  def initialize(user, record)
    @user   = user
    @record = record
  end

  def create?
    !user.blocked?
  end

  def update?
    create?
  end

  def index?; end
  def show?; end
  def edit?; end
  def destroy?; end
  def new?; end

  protected

  attr_reader :user, :record
end
