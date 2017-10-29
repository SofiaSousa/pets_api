module AcceptanceSpecHelper
  # Parse JSON response to ruby hash
  def json
    JSON.parse(response_body)
  end
end