module Formlets

  def render_form
    "<form method='post' action='#{action}'>#{render_attributes if defined? form_attributes}</form>"
  end

  private

  def render_attributes
    form_attributes.map{ |a| render_attribute a }.join
  end

  def render_attribute(a)
    render_parent_div(a)
  end

  def render_parent_div(a)
    "<div class='form-#{a[0]}'>#{render_label(a)}#{render_input(a)}</div>"
  end

  def render_input(a)
    send(a[1], a)
  end

  def render_label(a)
    "<label>#{a[0].capitalize}:</label><br/>"
  end

  #
  # Supported HTML Tags:
  #

  def text(a)
    input(a)
  end

  def file(a)
    input(a)
  end

  def textarea(a)
    "<textarea rows='10' cols='20' id='#{a[0]}'></textarea>"
  end

  def input(a)
    "<input type='#{a[1]}' id='#{a[0]}'></input>"
  end

  module_function

  def render(klass)
    klass.new.render_form
  end
end


