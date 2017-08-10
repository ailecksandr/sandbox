module ApplicationHelper
  def include_action_javascript
    ActionAssetsLoader.(
      context:         self,
      controller_name: controller_name,
      action_name:     action_name,
      asset_type:      :javascript,
      optional: {
        'data-turbolinks-track': 'reload'
      },
      silence: Rails.env.production?
    )
  end

  def include_action_stylesheet
    ActionAssetsLoader.(
      context:         self,
      controller_name: controller_name,
      action_name:     action_name,
      asset_type:      :stylesheet,
      optional: {
        'data-turbolinks-track': 'reload',
        media:                   'all'
      },
      silence: Rails.env.production?
    )
  end

  def page_title
    page_name = t("#{controller_name}.#{action_name}.page_title", default: '')

    return t('app_name') if page_name.blank?

    t('app_action', action_name: page_name)
  end

  def image_types_for_field
    IMAGE_TYPES.join(', ')
  end
end
