module TwitterBootstrapHelper

  # Returns structure for Twitter Bootstrap navbar surrounding the content
  # and uses +name+ for outer element.
  #
  # === Examples
  #   <%= tb_navbar do -%>
  #     Hello world!
  #   <% end -%>
  #   # => <div class="navbar">
  #          <div class="navbar-inner">
  #            <div class="container">
  #              Hello world!
  #            </div>
  #          </div>
  #        </div>
  #
  #   <%= tb_navbar(:nav) do -%>
  #     Hello world!
  #   <% end -%>
  #   # => <nav class="navbar">
  #          <div class="navbar-inner">
  #            <div class="container">
  #              Hello world!
  #            </div>
  #          </div>
  #        </nav>
  def tb_navbar(name = :div, options = {})
    default_options = {:class => 'navbar'}
    options = options.merge(default_options)

    content_tag(name, options) do
      content_tag(:div, :class => 'navbar-inner') do
        content_tag(:div, '', :class => 'container') do
          yield if block_given?
        end
      end
    end
  end
end
