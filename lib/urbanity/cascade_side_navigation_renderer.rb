module Urbanity
  module Renderer
    # Renders an ItemContainer as a <ul> element and its containing items as
    # <li> elements.
    # It adds the 'selected' class to li element AND the link inside the li
    # element that is currently active.
    #
    # If the sub navigation should be included (based on the level and
    # expand_all options), it renders another <ul> containing the sub navigation
    # inside the active <li> element.
    #
    # By default, the renderer sets the item's key as dom_id for the rendered
    # <li> element unless the config option <tt>autogenerate_item_ids</tt> is
    # set to false.
    # The id can also be explicitely specified by setting the id in the
    # html-options of the 'item' method in the config/navigation.rb file.
    class CascadeSideNavigation < SimpleNavigation::Renderer::Base
      def render(item_container)
        if skip_if_empty? && item_container.empty?
          ''
        else
          config_selected_class = SimpleNavigation.config.selected_class
          SimpleNavigation.config.selected_class = 'active'

          list_content = item_container.items.inject([]) do |list, item|
            li_options = item.html_options.reject {|k, v| k == :link}
            icon = li_options.delete(:icon)
            h4 = li_options.delete(:h4)
            li_content = tag_for(item, item.name, icon, h4)
            raise "li_content nil" if li_content.nil?
            if include_sub_navigation?(item)
              raise "li_content nil" if li_content.nil?
              li_content << render_sub_navigation_for(item)
            end
            raise "list nil" if list.nil?
            list << content_tag(:li, li_content, li_options)
          end.join
          SimpleNavigation.config.selected_class = config_selected_class
          result = content_tag(:ul, list_content, item_container.dom_attributes)
          raise "tag_for returns nil" if result.nil?
          result
        end
      end

      protected

      def tag_for(item, name = '', icon = nil, h4 = false)
        unless item.url or include_sub_navigation?(item)
          return item.name
        end
        link = Array.new
        link << content_tag("i", '', class: [icon].flatten.compact.join(' ')) unless icon.nil?
        if h4
          link << content_tag("h4", name, class: "group-title")
          link.join(" ").html_safe
        else
          link << name
          url = item.url
          if include_sub_navigation?(item)
            item_options = item.html_options
            item_options[:link] = Hash.new if item_options[:link].nil?
            item_options[:link][:class] = Array.new if item_options[:link][:class].nil?
            item.html_options = item_options
          end
          link_to(link.join(" ").html_safe, url, options_for(item))
        end
      end
    end
  end
end
