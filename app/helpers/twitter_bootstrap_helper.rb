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

  # Returns structure for Twitter Bootstrap popover with +content+ used as content for the popup.
  #
  # @param [String] content Text that's visible when the popup shows up.
  #   +simple_format+ is used to add P- and BR-tags. Long text is truncated after appr. 800 characters.
  # @param [Hash] opts Set of options to configure the popup:
  # @option opts [Symbol, String] :tag HTML tag used as wrapped (default :div)
  # @option opts [String] :title Title for the popover
  # @option opts [String] :class CSS classname used for +tag+
  #
  # @return [String] HTML to use in your view
  #
  # === Examples
  #   tb_popover("Hello world!")
  #   # <div data-content="<p>Hello world!</p>" rel="popover"></div>
  #
  #   tb_popover("Hello world!", :title => "Important!", :tag => 'i', :class => 'icon-info-sign')
  #   # <i class="icon-info-sign" data-content="<p>Hello world!</p>" rel="popover" data-original-title="Important!"></i>
  #
  def tb_popover(content, opts = {})
    tag = opts[:tag] || :div
    content = simple_format(escape_once(truncate(content, :length => 800)))
    options = {
      :class => opts[:class],
      :rel => 'popover',
      :title => opts[:title],
      :data => { :content => content }
    }

    content_tag(tag, options) {}
  end
end
