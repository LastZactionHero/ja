require 'ruby-progressbar'

module Trial
  VOICE_NAME_JA = 'Kyoko'.freeze
  progressbar = nil

  # Progressive Learning
  def start_test(direction, activity)
    if activity == :learning
      Kernel.loop do
        if @no_mistakes
          new_trial = @words.sample
          break unless new_trial

          puts new_trial.hiragana.to_s
          puts new_trial.kanji.to_s
          puts new_trial.english.to_s
          say_ja(new_trial.hiragana)

          @trials << new_trial
          @words.delete(new_trial)
          puts "Adding: (#{@trials.count}) / #{@words.count + @trials.count}"
          x = $stdin.gets.strip # Confirm new word
        end

        trial_idx = 0
        results = @trials.shuffle.map do |trial| 
          trial_idx += 1
          test_trial(trial, direction, activity, trial_idx)          
        end
        puts results.inspect
        @no_mistakes = !results.include?(false)
      end
    elsif activity == :testing
      trial_idx = 0
      results = @words.shuffle.map do |trial| 
        trial_idx += 1
        test_trial(trial, direction, activity, trial_idx)
      end
      @no_mistakes = !results.include?(false)
    else
      raise ArgumentError
    end
  end

  def print_progress_bar(activity, trial_idx)
    puts "PRINT PROGRESS BAR"
    total = (activity == :learning ? @trials : @words).length
    bar_str = ProgressBar.create(title: "#{trial_idx}/#{total}", total: total, starting_at: trial_idx).to_s
    puts "\e[H\e[2J"
    puts bar_str
  end

  def test_trial(trial, direction, activity, trial_idx)
    print_progress_bar(activity, trial_idx)

    case direction
    when :ja_en_translation
      if trial.kanji && !trial.kanji.empty?
        puts trial.kanji
      else
        puts trial.hiragana
      end
    when :en_ja_translation
      puts trial.english
    else
      raise ArgumentError
    end

    answer = ''
    while answer.length == 0
      answer = $stdin.gets.strip
    end

    puts "You typed: _#{answer}_"

    correct = case direction
              when :ja_en_translation
                answer == trial.english
              when :en_ja_translation
                if trial.kanji && !trial.kanji.empty?
                  answer == trial.hiragana || (trial.kanji && !trial.kanji.empty? && answer == trial.kanji)
                else
                  answer == trial.hiragana
                end
              else
                raise ArgumentError
    end

    if correct
      puts 'Correct!'
      correct = true

      say_ja(trial.hiragana)
      $stdin.gets
    else
      @incorrect << trial

      puts 'Incorrect!'
      puts trial.hiragana.to_s
      puts trial.kanji.to_s
      puts trial.english.to_s

      say_ja(trial.hiragana)
      $stdin.gets
    end

    puts "\e[H\e[2J"

    correct
  end

  def say_ja(text)
    `say -v #{VOICE_NAME_JA} --quality=127 #{text}`
  end
end
