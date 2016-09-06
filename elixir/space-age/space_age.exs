defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :neptune | :uranus

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds), do: seconds / orbital_period(planet)

  @spec orbital_period(planet) :: float
  defp orbital_period(:earth), do: 31557600
  defp orbital_period(:mercury), do: orbital_period(:earth) * 0.2408467
  defp orbital_period(:venus), do: orbital_period(:earth) * 0.61519726
  defp orbital_period(:mars), do: orbital_period(:earth) * 1.8808158
  defp orbital_period(:jupiter), do: orbital_period(:earth) * 11.862615
  defp orbital_period(:saturn), do: orbital_period(:earth) * 29.447498
  defp orbital_period(:uranus), do: orbital_period(:earth) * 84.016846
  defp orbital_period(:neptune), do: orbital_period(:earth) * 164.79132
end
