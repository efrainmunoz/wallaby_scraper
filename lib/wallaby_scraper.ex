defmodule WallabyScraper do
  import Wallaby.Browser

  def fetch(url) do
    {:ok, new_session} = Wallaby.start_session
    new_session
    |> visit(url)
    |> page_source()
    |> IO.inspect()
    Wallaby.end_session(new_session)
  end
end
