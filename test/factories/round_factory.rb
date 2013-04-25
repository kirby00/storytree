class RoundFactory

  class << self

    def round_without_winner
      Round.create!(story_id: 1)
    end

    def round_with_winner(story)
      Round.create!(story_id: story.id, winner_id: addition.id)
    end

  end
end