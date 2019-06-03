module ApplicationHelper
  def search_enabled?
    defined?(ALGOLIA_CONFIG) && ENV['ALGOLIA_SEARCH_KEY']
  end

  def theme
    return unless ENV['THEME']
    "theme--#{ENV['THEME']}"
  end

  def title
    if @product && @document_title
      "Nexmo Developer | #{@product.titleize} > #{@document_title}"
    elsif @document_title
      "Nexmo Developer | #{@document_title}"
    else
      'Nexmo Developer'
    end
  end

  def path_to_url(path)
    path.gsub(%r{.*#{@namespace_root}}, '').gsub('.md', '')
  end

  def url_to_configuration_identifier(url)
    url.tr('/', '.').sub(/^./, '')
  end

  def first_link_in_directory(context)
    return nil if context.empty?
    if context.first[:is_file?]
      path_to_url(context.first[:path])
    elsif context.first[:children]
      first_link_in_directory(context.first[:children])
    end
  end

  def show_canonical_meta?
    return true if params[:code_language].present?
    return true if Rails.env.production? && request.base_url != 'https://developer.nexmo.com'
    false
  end

  def canonical_path
    request.path.chomp("/#{params[:code_language]}")
  end

  def canonical_url
    base_url = Rails.env.production? ? 'https://developer.nexmo.com' : request.base_url
    canonical_path.prepend(base_url)
  end

  def normalize_summary_title(summary, operation_id)
    # return summary early if provided
    return summary unless summary.nil?

    # If the operation ID is camelCase,
    if operation_id.match?(/^[a-zA-Z]\w+(?:[A-Z]\w+){1,}/x)
      # Use the rails `.underscore` method to convert someString to some_string
      operation_id = operation_id.underscore
    end

    # Replace snake_case and kebab-case with spaces and titelize the string
    operation_id = operation_id.gsub(/(_|-)/, ' ').titleize

    # Some terms need to be capitalised all the time
    uppercase_array = ['SMS', 'DTMF']
    operation_id.split(' ').map do |c|
      next c.upcase if uppercase_array.include?(c.upcase)
      c
    end.join(' ')
  end
end
