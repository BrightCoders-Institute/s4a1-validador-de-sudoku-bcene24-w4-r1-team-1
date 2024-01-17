require 'httparty'

# Reemplaza 'tu-clave-de-api' con tu clave de API real
api_key = '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'

url = 'https://api.openai.com/v1/engines/davinci-codex/completions'  # Puedes ajustar el motor según tus necesidades

# Ejemplo de solicitud a la API para generar texto
response = HTTParty.post(
  url,
  headers: {
    'Content-Type' => 'application/json',
    'Authorization' => "Bearer #{api_key}"
  },
  body: {
    prompt: '¿Cuál es la capital de Francia?',
    max_tokens: 50  # Puedes ajustar la longitud del texto generado
  }.to_json
)

# Imprimir la respuesta generada
puts response
puts response.parsed_response['choices'][0]['text'].strip

def encode_board(board)
  board.reduce { |result, row, i| "#{result}%5B#{URI.encode_www_form_component(row)}%5D#{i == board.length - 1 ? '' : '%2C'}" }
end

def encode_params(params)
  params.map { |key, value| "#{key}=#{'%5B' + encode_board(value) + '%5D'}" }.join('&')
end

sudoku_board = HTTParty.get('https://sugoku.onrender.com/board?difficulty=random')
puts sudoku_board

HTTParty.post(
  'https://sugoku.onrender.com/solve',
  headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
  body: encode_params(sudoku_board)
)
