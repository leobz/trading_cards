defmodule TradingCardTest do
  use ExUnit.Case
  doctest TradingCard

  describe "aggregate_team_score" do
    test "returns the total score of the team" do
      cards = [
        %{name: "Player A", team: "Team X", score: 10},
        %{name: "Player B", team: "Team Y", score: 20},
        %{name: "Player C", team: "Team X", score: 15},
        %{name: "Player D", team: "Team Z", score: 5}
        ]

      assert TradingCard.aggregate_team_score(cards, "Team X") == 25
    end

    test "returns zero if the team is not found" do
      cards = [%{name: "Player A", team: "Team X", score: 10}]

      assert TradingCard.aggregate_team_score(cards, "Unknown Team") == 0
    end

    test "returns zero if list the is empty" do
      assert TradingCard.aggregate_team_score([], "Team X") == 0
    end
  end
end
