defmodule TestLiveGenWeb.ALive do
  use TestLiveGenWeb, :live_view
  alias TestLiveGen.Test

  def render(assigns) do
    ~H"""
    <div>
      <div>hello</div>
      <%=Test.get_state(:a)%>
    </div>
    """
  end
end
