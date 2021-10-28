defmodule DisabledChangeEventWeb.DemoLive do
  use DisabledChangeEventWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       changeset:
         form_changeset(%{
           "string_one" => "value_one",
           "string_two" => "value_two"
         })
     )}
  end

  def handle_event("validate", %{"profile" => profile_params}, socket) do
    IO.inspect(profile_params, label: "profile_params during validate")

    {:noreply, socket}
  end

  def handle_event("save", %{"profile" => profile_params}, socket) do
    IO.inspect(profile_params, label: "profile_params during save")

    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <.form let={f} for={@changeset} as="profile" phx_change={"validate"} phx_submit="save">

    <div>
      <%= label f, :string_one %>
      <%# Disabled form inputs are not included with the validate payload,
      which was an unexpected before for me. %>
      <%= text_input f, :string_one, [disabled: true] %>
      <%= error_tag f, :string_one %>
    </div>

    <div>
      <%= label f, :string_two %>
      <%= text_input f, :string_two %>
      <%= error_tag f, :string_two %>
    </div>

    <div>
     <%= submit "Submit" %>
    </div>

    </.form>
    """
  end

  defp form_changeset(params) do
    data = %{}
    types = %{string_one: :string, string_two: :string}

    changeset =
      {data, types}
      |> Ecto.Changeset.cast(params, Map.keys(types))
  end
end
