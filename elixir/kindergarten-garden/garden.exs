defmodule Garden do
  @doc """
    Accepts a string representing the arrangement of cups on a windowsill and a
    list with names of students in the class. The student names list does not
    have to be in alphabetical order.

    It decodes that string into the various gardens for each student and returns
    that information in a map.
  """

  @names ~w(alice bob charlie david eve fred ginny harriet ileana joseph kincaid larry)a

  @plants %{
    ?C => :clover,
    ?G => :grass,
    ?R => :radishes,
    ?V => :violets
  }

  @spec info(String.t, list) :: map
  def info(info_string, student_names \\ @names) do
    planted = parse_plants(info_string)
    student_names = Enum.sort(student_names)
    defaults = student_names |> Enum.drop(length(planted)) |> Enum.map(&({&1, {}}))

    defaults ++ Enum.zip(student_names, planted) |> Map.new
  end

  defp parse_plants(info_string) do
    info_string
    |> String.split
    |> Enum.map(&to_charlist/1)
    |> List.zip
    |> Enum.chunk(2)
    |> Enum.map(fn [{a, b}, {c, d}] ->
      {@plants[a], @plants[c], @plants[b], @plants[d]}
    end)
  end
end
