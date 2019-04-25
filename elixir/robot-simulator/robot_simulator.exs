defmodule RobotSimulator do
  @enforce_keys [:position, :direction]
  defstruct @enforce_keys

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(direction \\ :north, position \\ {0, 0}) do
    with {_, true} <- {:direction, direction in ~w(north east south west)a},
         {_, true} <- {:position, match?({x, y} when is_number(x) and is_number(y), position)} do
      %__MODULE__{direction: direction, position: position}
    else
      {:direction, _} -> {:error, "invalid direction"}
      {:position, _} -> {:error, "invalid position"}
    end
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(%__MODULE__{} = robot, instructions) do
    instructions
    |> String.split("", trim: true)
    |> Enum.reduce_while(robot, &do_simulate/2)
  end

  defp do_simulate("R", %{direction: :north} = robot), do: {:cont, %{robot | direction: :east}}
  defp do_simulate("R", %{direction: :east} = robot), do: {:cont, %{robot | direction: :south}}
  defp do_simulate("R", %{direction: :south} = robot), do: {:cont, %{robot | direction: :west}}
  defp do_simulate("R", %{direction: :west} = robot), do: {:cont, %{robot | direction: :north}}

  defp do_simulate("L", %{direction: :north} = robot), do: {:cont, %{robot | direction: :west}}
  defp do_simulate("L", %{direction: :east} = robot), do: {:cont, %{robot | direction: :north}}
  defp do_simulate("L", %{direction: :south} = robot), do: {:cont, %{robot | direction: :east}}
  defp do_simulate("L", %{direction: :west} = robot), do: {:cont, %{robot | direction: :south}}

  defp do_simulate("A", %{direction: :north, position: {x, y}} = robot) do
    {:cont, %{robot | position: {x, y + 1}}}
  end

  defp do_simulate("A", %{direction: :east, position: {x, y}} = robot) do
    {:cont, %{robot | position: {x + 1, y}}}
  end

  defp do_simulate("A", %{direction: :south, position: {x, y}} = robot) do
    {:cont, %{robot | position: {x, y - 1}}}
  end

  defp do_simulate("A", %{direction: :west, position: {x, y}} = robot) do
    {:cont, %{robot | position: {x - 1, y}}}
  end

  defp do_simulate(_, _) do
    {:halt, {:error, "invalid instruction"}}
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: %__MODULE__{}) :: atom
  def direction(%__MODULE__{direction: direction}) do
    direction
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: %__MODULE__{}) :: {integer, integer}
  def position(%__MODULE__{position: position}) do
    position
  end
end
