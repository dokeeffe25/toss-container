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
    # TODO spawn process here to perform http request?
    # TODO config server location
    test_resp = HTTPoison.get("http://localhost:4000/hello")
    IO.puts(path)
    IO.inspect(events)
    IO.inspect(test_resp)
    {:noreply, state}
  end

  def handle_info({:file_event, watcher_pid, :stop}, state) do
    {:noreply, state}
  end
end
