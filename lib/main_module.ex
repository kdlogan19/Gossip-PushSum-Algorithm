defmodule MainModule do
  def main(total_nodes, topology, algorithm) do
    Registry.start_link(keys: :unique, name: :registry)

    case algorithm do
      "gossip" -> GossipMainModule.main(total_nodes,topology)
      "push-sum" -> IO.puts "starting push-sum"
      _ -> IO.puts "Invalid Algorithm selected"
    end
  end
end
