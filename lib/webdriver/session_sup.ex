defmodule WebDriver.SessionSup do
  use Supervisor.Behaviour

  def start_link state do
    :supervisor.start_link __MODULE__, state
  end

  def init state do
    child_processes = [worker(WebDriver.Session, [state], [ restart: :temporary ])]
    supervise(child_processes,[ strategy: :simple_one_for_one ])
  end
end
