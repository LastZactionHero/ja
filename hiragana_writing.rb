
VOICE_NAME_JA = 'Kyoko'.freeze
hiragana = [
  # Monographs
  { char: 'あ', sound: 'a' },
  { char: 'い', sound: 'i' },
  { char: 'う', sound: 'u' },
  { char: 'え', sound: 'e' },
  { char: 'お', sound: 'o' },
  { char: 'か', sound: 'ka' },
  { char: 'き', sound: 'ki' },
  { char: 'く', sound: 'ku' },
  { char: 'け', sound: 'ke' },
  { char: 'こ', sound: 'ko' },
  { char: 'さ', sound: 'sa' },
  { char: 'し', sound: 'shi' },
  { char: 'す', sound: 'su' },
  { char: 'せ', sound: 'se' },
  { char: 'そ', sound: 'so' },
  { char: 'た', sound: 'ta' },
  { char: 'ち', sound: 'chi' },
  { char: 'つ', sound: 'tsu' },
  { char: 'て', sound: 'te' },
  { char: 'と', sound: 'to' },
  { char: 'な', sound: 'na' },
  { char: 'に', sound: 'ni' },
  { char: 'ぬ', sound: 'nu' },
  { char: 'ね', sound: 'ne' },
  { char: 'の', sound: 'no' },
  { char: 'は', sound: 'ha' },
  { char: 'ひ', sound: 'hi' },
  { char: 'ふ', sound: 'fu' },
  { char: 'へ', sound: 'he' },
  { char: 'ほ', sound: 'ho' },
  { char: 'ま', sound: 'ma' },
  { char: 'み', sound: 'mi' },
  { char: 'む', sound: 'mu' },
  { char: 'め', sound: 'me' },
  { char: 'も', sound: 'mo' },
  { char: 'や', sound: 'ya' },
  { char: 'ゆ', sound: 'yu' },
  { char: 'よ', sound: 'yo' },
  { char: 'ら', sound: 'ra' },
  { char: 'り', sound: 'ri' },
  { char: 'る', sound: 'ru' },
  { char: 'れ', sound: 're' },
  { char: 'ろ', sound: 'ro' },
  { char: 'わ', sound: 'wa' },
  { char: 'ゐ', sound: 'wi' },
  { char: 'ゑ', sound: 'we' },
  { char: 'を', sound: 'wo' },
  { char: 'ん', sound: 'n' },

  # Diacritics
  { char: 'ぎ', sound: 'gi' },
  { char: 'ぐ', sound: 'gu' },
  { char: 'げ', sound: 'ge' },
  { char: 'ご', sound: 'go' },
  { char: 'ざ', sound: 'za' },
  { char: 'じ', sound: 'ji' },
  { char: 'ず', sound: 'zu' },
  { char: 'ぜ', sound: 'ze' },
  { char: 'ぞ', sound: 'zo' },
  { char: 'だ', sound: 'da' },
  { char: 'ぢ', sound: 'ji' },
  { char: 'づ', sound: 'zu' },
  { char: 'で', sound: 'de' },
  { char: 'ど', sound: 'do' },
  { char: 'ば', sound: 'ba' },
  { char: 'び', sound: 'bi' },
  { char: 'ぶ', sound: 'bu' },
  { char: 'べ', sound: 'be' },
  { char: 'ぼ', sound: 'bo' },
  { char: 'ぱ', sound: 'pa' },
  { char: 'ぴ', sound: 'pi' },
  { char: 'ぷ', sound: 'pu' },
  { char: 'ぺ', sound: 'pe' },
  { char: 'ぽ', sound: 'po' },

  # Digraphs
  # { char: 'きゃ', sound: 'kya' },
  # { char: 'きゅ', sound: 'kyu' },
  # { char: 'きょ', sound: 'kyo' },
  # { char: 'しゃ', sound: 'sha' },
  # { char: 'しゅ', sound: 'shu' },
  # { char: 'しょ', sound: 'sho' },
  # { char: 'ちゃ', sound: 'cha' },
  # { char: 'ちゅ', sound: 'chu' },
  # { char: 'ちょ', sound: 'cho' },
  # { char: 'にゃ', sound: 'nya' },
  # { char: 'にゅ', sound: 'nyu' },
  # { char: 'にょ', sound: 'nyo' },
  # { char: 'ひゃ', sound: 'hya' },
  # { char: 'ひゅ', sound: 'hyu' },
  # { char: 'ひょ', sound: 'hyo' },
  # { char: 'みゃ', sound: 'mya' },
  # { char: 'みゅ', sound: 'myu' },
  # { char: 'みょ', sound: 'myo' },
  # { char: 'りゃ', sound: 'rya' },
  # { char: 'りゅ', sound: 'ryu' },
  # { char: 'りょ', sound: 'ryo' },

  # Digraphs with diacritics
  # { char: 'ぢゃ', sound: 'ja' },
  # { char: 'ぢゅ', sound: 'ju' },
  # { char: 'ぢょ', sound: 'jo' },
  # { char: 'じゃ', sound: 'ja' },
  # { char: 'じゅ', sound: 'ju' },
  # { char: 'じょ', sound: 'jo' },
  # { char: 'ぎゃ', sound: 'gya' },
  # { char: 'ぎゅ', sound: 'gyu' },
  # { char: 'ぎょ', sound: 'gyo' },
  # { char: 'びゃ', sound: 'bya' },
  # { char: 'びゅ', sound: 'byu' },
  # { char: 'びょ', sound: 'byo' },
  # { char: 'ぴゃ', sound: 'pya' },
  # { char: 'ぴゅ', sound: 'pyu' },
  # { char: 'ぴょ', sound: 'pyo' }
]

while 1 do
  pair = hiragana.sample

  puts pair[:sound]
  `say -v #{VOICE_NAME_JA} --quality=127 #{pair[:char]}`

  gets.strip

  puts pair[:char]
  gets.strip
  
end