
module Requestable
  def inspiration_phrase
    semana = Time.now.strftime("%a")

    semana_hash = {
      "Mon" => "lunes",
      "Tue" => "martes",
      "Wed" => "miércoles",
      "Thu" => "jueves",
      "Fri" => "viernes",
      "Sat" => "sábado",
      "Sun" => "domingo"
    }

    title = "{{Plantilla:Frase-#{semana_hash[semana]}}}"

    url = "http://es.wikiquote.org/w/api.php?action=parse&text=#{CGI.escape(title)}&format=json&contentmodel=wikitext"

    response = Faraday.get(url)

    if response.status == 301
      redirected_url = response.headers["location"]
      response = Faraday.get(redirected_url)

      data = JSON.parse(response.body)

      phrase = data["parse"]["text"]["*"]
      ActionController::Base.helpers.strip_tags(phrase)

    else
      'Siempre hay un mañana mejor, Anónimo'

    end
  end


end
