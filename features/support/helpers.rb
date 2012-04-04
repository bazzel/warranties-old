module Helpers
  def within_flash
    within('.alert') { yield }
  end

  def input_error(options)
    page.should have_css('span.help-inline', options)
  end
end

World(Helpers)
