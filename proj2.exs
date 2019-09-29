defmodule Proj2 do
  def start do
    [total_nodes, topology, algorithm] = System.argv()
    MainModule.main(String.to_integer(total_nodes), topology, algorithm) 
  end
end

Proj2.start