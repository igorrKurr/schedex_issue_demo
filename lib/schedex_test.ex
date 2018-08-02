defmodule SchedexTest do
  @moduledoc """
  Documentation for SchedexTest.
  """

  @doc """
  Hello world.

  ## Examples

      iex> SchedexTest.hello
      :world

  """
  def hello do
    :world
  end

  def test_run_at do
    datetime = Timex.shift(DateTime.utc_now(), milliseconds: 2_000)
    child = %{id: "test_run_at", start: {SchedEx, :run_at, [fn -> IO.inspect "schedex" end, datetime]}}
    DynamicSupervisor.start_child(DS, child)
  end

  def test_run_every do
    child = %{id: "test_run_every", start: {SchedEx, :run_every, [fn -> IO.inspect "schedex" end, "* * * * *"]}}
    DynamicSupervisor.start_child(DS, child)
  end

  def test_run_in do
    child = %{id: "test_run_in", start: {SchedEx, :run_in, [fn -> IO.inspect "schedex" end, 2_000]}}
    DynamicSupervisor.start_child(DS, child)
  end
end
