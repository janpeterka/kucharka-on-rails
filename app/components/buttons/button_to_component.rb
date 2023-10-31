# frozen_string_literal: true

module Buttons
  # Component for the button_to helper with default admin style.
  class ButtonToComponent < ButtonLinkComponent
    def call
      options[:form_class] ||= DEFAULT_BUTTON_TO_FORM_CLASSES
      updated_options = helpers.arguments_with_updated_default_class(DEFAULT_BUTTON_TO_FORM_CLASSES, prefix: 'form',
                                                                                                     **options)
      updated_options2 = helpers.arguments_with_updated_default_class(DEFAULT_BUTTON_CLASSES[type],
                                                                      **updated_options)
      if content
        button_to(path, **updated_options2) { content }
      else
        button_to(name, path, **updated_options2)
      end
    end
  end
end
