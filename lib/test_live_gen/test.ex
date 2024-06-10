defmodule TestLiveGen.Test do
  use GenServer

  def start_link(init_args) do
    # init_args is a list of datas

    # required to initialize multiple processes at start, this way not working!
    Enum.each(init_args, fn arg ->
      GenServer.start_link(__MODULE__, arg.use_state, name: arg.id)
    end)

    # this works, but just single process
    # GenServer.start_link(__MODULE__, Enum.at(init_args, 0).use_state, name: Enum.at(init_args, 0).id)

  end

  def get_state(name) do
    GenServer.call(name, :get_state)
  end

  def init(init_arg) do
    {:ok, init_arg}
  end

  def handle_call(:get_state, _from, state) do
    {:reply, state, state}
  end
end
