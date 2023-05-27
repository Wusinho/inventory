
module Requestable
  def inspiration_phrase
    url = 'https://es.wikiquote.org/w/api.php?action=query&format=json&list=search&srsearch=inspiracion'
    response = Faraday.get(url)

    if response.success?
      data = JSON.parse(response.body)
      resp = data['query']['search'][1]['snippet']
      sanitized = ActionController::Base.helpers.strip_tags(resp)
      extract_from_left_angle_bracket(remove_until_first_period(sanitized)).split('.')
    else
      [['Siempre hay un manhana mejor'],['Anonimo']]
    end
  end

  private

  def remove_until_first_period(input)
    period_index = input.index('.')
    return input unless period_index

    input[(period_index + 1)..-1].strip
  end

  def extract_from_left_angle_bracket(input)
    left_angle_bracket_index = input.index('«')
    return nil unless left_angle_bracket_index

    substring = input[(left_angle_bracket_index + 1)..-1]
    substring.gsub!('»', '')
    substring.strip
  end


end
