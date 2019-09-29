defmodule Topology do
    def get_neighbours(node_number,node_list, topology) do
        case topology do
            "full" -> get_full(node_number, node_list)
            "line" -> get_line(node_number, node_list)
            "rand2D" -> IO.puts "rand2D"
            "3Dtorus" -> IO.puts "3Dtorus"
            "honeycomb" -> IO.puts "honeycomb"
            "randhoneycomb" -> IO.puts "randhoneycomb"
        end
    end

    def get_full(node_number, node_list) do
        Enum.reject(node_list, fn x -> x == node_number end)
    end

    def get_line(node_number, node_list) do
        u = Enum.at(node_list, 0)
        v = Enum.at(node_list, -1)
        cond  do
            node_number == u -> [node_number+1]
            node_number == v -> [node_number-1]
            true -> [node_number+1, node_number-1]
        end
    end
end