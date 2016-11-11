defmodule Identicon do
  def main(input) do
    input
    |> hash_input
    |> pick_color
  end

  # pattern matching inside the argument to the function
  def pick_color(%Identicon.Image{hex: [r, g, b | _tail]} = image) do
    # will put hex list in hex_list from image struct
    # _tail is the rest of the elements. We put _ as we are not using it.

    %Identicon.Image{image | color: { r, g, b}}
    # create a new record with the existing properties and adding the color
  end

  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end
end
