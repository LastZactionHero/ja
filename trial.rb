module Trial
  VOICE_NAME_JA = 'Kyoko'.freeze

  # Progressive Learning
  def start_test(mode)
    Kernel.loop do
      if @no_mistakes
        new_trial = @words.sample

        puts new_trial.hiragana.to_s
        puts new_trial.kanji.to_s
        puts new_trial.english.to_s
        say_ja(new_trial.hiragana)

        @trials << new_trial
        @words.delete(new_trial)
        puts "Adding: (#{@trials.count}) / #{@words.count + @trials.count}"
      end

      results = @trials.shuffle.map { |trial| test_trial(trial, mode) }
      @no_mistakes = !results.include?(false)
    end
  end

  def test_trial(trial, mode)
    case mode
    when :english_translation
      say_ja(trial.hiragana)
      puts trial.hiragana
      puts trial.kanji
    when :hiragana_translation
      puts trial.english
    else
      raise ArgumentError
    end

    answer = ''
    while answer.length == 0
      answer = $stdin.gets.strip
    end

    puts "You typed: _#{answer}_"

    correct = case mode
              when :english_translation
                answer == trial.english
              when :hiragana_translation
                answer == trial.hiragana || (trial.kanji && !trial.kanji.empty? && answer == trial.kanji)
              else
                raise ArgumentError
    end

    if correct
      puts 'Correct!'
      correct = true
      say_ja(trial.hiragana)
    else
      puts 'Incorrect!'
      puts trial.hiragana.to_s
      puts trial.kanji.to_s
      puts trial.english.to_s
      say_ja(trial.hiragana)
    end

    $stdin.gets
    puts "\e[H\e[2J"
    correct
  end

  def say_ja(text)
    `say -v #{VOICE_NAME_JA} --quality=127 #{text}`
  end
end
