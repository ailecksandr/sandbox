class ActionAssetsLoader < ::ApplicationService::Base
  def initialize(params = {})
    @context         = params[:context]
    @controller_name = params[:controller_name]
    @action_name     = params[:action_name]
    @asset_type      = params[:asset_type]
    @optional        = params[:optional]
    @silence_mode    = params[:silence]
  end

  def call
    load!
  rescue Sprockets::Rails::Helper::AssetNotFound, Sprockets::Rails::Helper::AssetNotPrecompiled
    show_message! unless silence_mode
  end

  private

  attr_reader :context, :controller_name, :action_name, :asset_type, :optional, :silence_mode

  def load!
    case asset_type
    when :javascript
      context.javascript_include_tag(path, optional)
    when :stylesheet
      context.stylesheet_link_tag(path, optional)
    end
  end

  def show_message!
    context.javascript_tag("console.log(\"#{message}\")")
  end

  def message
    @message ||= I18n.t('assets.errors.not_loaded', asset_type: humanized_asset_type, path: path)
  end

  def humanized_asset_type
    @humanized_asset_type ||= I18n.t("assets.types.#{asset_type}")
  end

  def path
    @path ||= "#{controller_name}#{"/#{action_name}" if action_name}"
  end
end
