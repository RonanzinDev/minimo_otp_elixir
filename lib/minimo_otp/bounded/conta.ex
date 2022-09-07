defmodule MinimoOtp.Bounded.Conta do
  def criar({nome, saldo}), do: Core.Conta.start_link({nome, saldo})
  def extrato(nome), do: GenServer.call(nome, :saldo)
  def deposito(nome, credito), do: GenServer.cast(nome, {:credito, credito})
end
