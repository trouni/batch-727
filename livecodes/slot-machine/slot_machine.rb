class SlotMachine
  # Assign a value for each symbol
  SYMBOLS = [nil, '🍒', '7️⃣', '🛎', '⭐️', '🤩'].freeze

  def initialize(reels = [nil, nil, nil])
    @reels = reels
  end

  def play
    60.times do
      @reels = @reels.map { |reel| SYMBOLS.compact.sample }
      print @reels.join("\t") + "\r"
      $stdout.flush
      sleep(0.03)
    end
    sleep(0.5)
    @reels = @reels.map { |reel| SYMBOLS.compact.sample }
    @reels
  end

  def score
    if three_of_the_same?
      symbol = @reels[0] # all identical so we can select any item
      symbol_value = SYMBOLS.index(symbol)
      return symbol_value * 10
    elsif two_of_the_same_plus_joker?
      # [🤩 🍒 🤩].sort => [🤩 🤩 🍒]
      # [🛎 ⭐️ 🛎].sort => [⭐️ 🛎 🛎]
      symbol = @reels.sort[1] # once sorted the duplicated item is always in the middle
      symbol_value = SYMBOLS.index(symbol)
      return symbol_value * 5
    else
      return 0
    end
  end

  private

  def three_of_the_same?
    # [🤩 🤩 🤩].uniq => [🤩]
    @reels.uniq.size == 1
  end

  def two_of_the_same_plus_joker?
    # [🤩 🤩 🍒].uniq => [🤩 🍒]
    @reels.uniq.size == 2 && @reels.include?('🤩')
  end
end