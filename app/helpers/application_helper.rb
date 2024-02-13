# frozen_string_literal: true

module ApplicationHelper
  def scoped_view_translation(key, options = {})
    translation_scope = ".#{controller_name}.#{key}"
    t(translation_scope, **options)
  end
end
