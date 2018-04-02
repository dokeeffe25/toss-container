defmodule TossContainer.Watcher do
  use GenServer

  def start_link(args) do
    GenServer.start_link(__MODULE__, args)
  end

  def init(args) do
    # TODO pass dirs as config
    HTTPoison.start
    {:ok, watcher_pid} = FileSystem.start_link(dirs: ["/tmp/hello"])
    FileSystem.subscribe(watcher_pid)
    {:ok, %{watcher_pid: watcher_pid}}
  end

  def handle_info({:file_event, watcher_pid, {path, events}}, state) do
    IO.inspect(events)
    case List.last(events) do
      :removed ->
        IO.puts "REMOVED"
        HTTPoison.delete("http://localhost:4000/delete")
      :created ->
        IO.puts "CREATED"
      :modified ->
        IO.puts "MODIFIED"
      _ ->
        IO.puts "NONE"
    end

    {:noreply, state}
  end

  def handle_info({:file_event, watcher_pid, :stop}, state) do
    {:noreply, state}
  end
end
