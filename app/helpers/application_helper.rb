##
# Extra Wiki-related and general stuff
module ApplicationHelper

  ##
  # Apply markup rules
  # Need no parser etc here, it's primitive
  def page_content_as_html(content)
    content = content.gsub /\*\*(.+)\*\*/, '<b>\1</b>'
    content = content.gsub /\\\\(.+)\\\\/, '<i>\1</i>'

    content.gsub(/\(\(\/(?<url>[^\s]*)\s(?<text>.*)\)\)/) do
      "<a href="+ url_for(:action => :show, :path => $1)+">"+ $2 + "</a>"
    end
  end

  ##
  # Draws deep hashes as unmarked lists
  def tree_as_html(tree)
    tree.map do |item, subtree|
      render(item) + content_tag(:ul, tree_as_html(subtree))
    end.join.html_safe
  end

  ##
  # Turns \\n`s to <br/>`s
  def nl2br(string)
    string.gsub(/\n/, '<br>')
  end

end
