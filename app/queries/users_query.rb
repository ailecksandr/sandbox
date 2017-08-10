class UsersQuery < ApplicationQuery::Base
  def confirmed
    relation.where.not(confirmed_at: nil)
  end

  def except_user(user)
    relation.where.not(id: user.id)
  end

  def search(query, user, columns)
    with_profile.except_user(user).where(search_criterion(query, columns))
  end

  private

  def with_profile(scope = relation)
    scope.includes(:profile).references(:profile)
  end

  def search_criterion(query, columns)
    columns.map { |column| "LOWER(#{column}) LIKE LOWER('%#{query}%')" }.join(' OR ')
  end
end
