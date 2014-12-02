module ItemsHelper
  def mark_list_item_path(list, item)
    "/lists/#{list.id}/items/#{item.id}/mark"
  end

  def unmark_list_item_path(list, item)
    "/lists/#{list.id}/items/#{item.id}/unmark"
  end
end
