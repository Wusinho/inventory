
module Requestable
  def inspiration_phrase
    url = 'https://es.wikiquote.org/w/api.php?action=query&format=json&list=search&srsearch=inspiracion'
    response = Faraday.get(url)

    if response.success?
      data = JSON.parse(response.body)
      phrase_count = data['query']['search'].size

      current_day = Date.today.yday

      selected_phrase_index = current_day % phrase_count
      selected_phrase = data['query']['search'][selected_phrase_index]['snippet']


      ActionController::Base.helpers.strip_tags(selected_phrase)
    else
      ['Siempre hay un mañana mejor, Anónimo']
    end
  end

end
