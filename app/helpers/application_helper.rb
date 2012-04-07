module ApplicationHelper
  # Transform into proper Twitter Bootstrap type
  # when displaying flash message.
  #   Usage:
  # - flash.each do |name, msg|
  #   .alert{ :class => "alert-#{twitterized_type(name)}" }
  #     %a.close{ 'data-dismiss' => "alert" } x
  #     = msg
  def twitterized_type(type)
    case type
      when :alert
        "warning"
      when :error
        "error"
      when :notice
        "info"
      when :success
        "success"
      else
        type.to_s
    end
  end

end
