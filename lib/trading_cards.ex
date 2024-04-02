defmodule TradingCard do
  defstruct name: nil, team: nil, score: nil

  @doc """
  Accepts a list of trading cards and a team name, returning the total score for all cards belonging to that team.

  ## Examples
      iex> cards = [
      ...> %{name: "Player A", team: "Team X", score: 10},
      ...> %{name: "Player B", team: "Team Y", score: 20},
      ...> %{name: "Player C", team: "Team X", score: 15},
      ...> %{name: "Player D", team: "Team Z", score: 5}
      ...> ]
      iex> TradingCard.aggregate_team_score(cards, "Team X")
      25

  """
  @spec aggregate_team_score([%TradingCard{}], String.t()) :: integer()
  def aggregate_team_score(cards, team_name) do
    # More efficient approach:
    # Enum.reduce(cards, 0, fn card, acc ->
    #   if card.team == team_name, do: acc + card.score, else: acc
    # end)

    # More expressive approach:
    cards
    |> Enum.filter(&(&1.team == team_name))
    |> Enum.map(&(&1.score))
    |> Enum.sum()
  end
end
