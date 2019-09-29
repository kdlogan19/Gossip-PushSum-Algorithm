defmodule GossipMainModule do
    import Topology
    use GenServer
    def main(total_nodes, topology) do
        create_nodes(total_nodes,topology)
        start_time = System.system_time(:millisecond)
        StartGossiping.initiate_process(total_nodes, :gossip)
        time_diff = System.system_time(:millisecond) - start_time
        IO.puts("Time taken to achieve convergence: #{time_diff} milliseconds")
    end

    def create_nodes(total_nodes,topology) do
    #getting correct number of nodes
        node_list = 1..total_nodes
        Enum.each(node_list, fn node_number -> spawn(fn -> NetworkNode.start(node_number, get_neighbours(node_number, node_list, topology))end) |> Process.monitor end)
    end
end