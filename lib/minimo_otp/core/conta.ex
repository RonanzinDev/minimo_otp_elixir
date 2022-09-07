defmodule Core.Conta do
  use GenServer
  def init(conta), do: {:ok, conta}

  def start_link({nome, saldo}) do
    GenServer.start_link(__MODULE__, {nome, saldo}, name: nome)
  end

  def handle_call(:dados, _from, state) do
    {nome, saldo} = state
    {:reply, state, {nome, saldo + 500}}
  end

  def handle_cast({:credito, credito}, state) do
    {nome, saldo_atual} = state
    {:noreply, {nome, saldo_atual + credito}}
  end
end
