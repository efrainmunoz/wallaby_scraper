defmodule WallabyScraper do

  def fetch(%{url: url, xpath: xpath}) do
    {:ok, session} = Wallaby.start_session
    
    session = Wallaby.Browser.visit(session, url)
    :timer.sleep(5000)

    try do
      body = Wallaby.Browser.find(
        session,
        Wallaby.Query.xpath(xpath)
      )
      IO.puts(Wallaby.Element.text(body))
    rescue _ ->
      IO.puts("cant't find specified xpath")
    end
    Wallaby.end_session(session)
  end

  def multi([]), do: IO.puts("END")
  def multi([website | rest]) do
    Task.async(WallabyScraper, :fetch, [website])
    multi(rest)
  end
end
