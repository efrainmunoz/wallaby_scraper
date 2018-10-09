defmodule WallabyScraper do

  def fetch(url) do
    {:ok, new_session} = Wallaby.start_session
    
    new_session
    |> Wallaby.Browser.visit(url)
    |> Wallaby.Browser.all(Wallaby.Query.css(".module_container--widget"))
    |> IO.inspect()
    
    Wallaby.end_session(new_session)
  end
end
