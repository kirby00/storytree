class RoundFactory

  class << self

    def round_without_winner
      Round.create(story_id: 1)
    end

    def round_with_winner
      Round.create(story_id: 1, winner_id: 1)
    end

  end
end