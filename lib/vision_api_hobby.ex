defmodule VisionApiHobby do
  @moduledoc """
  Documentation for VisionApiHobby.
  """

  @doc """
  Hello world.

  ## Examples

      iex> VisionApiHobby.hello
      :world

  """

  alias GoogleApi.Vision.V1.Api.Images

  def judge_image(image, types, opts \\ []) do
    params =
      image
      |> build_resource(opts)
      |> build_request(types)

    conn =
      gen_conn()

    Images.vision_images_annotate(conn, [body: params])

  end

  defp build_request(resource, types) do
    %{
      requests: %{
        image: resource,
        features: Enum.map(types, &(
          %{type: &1}
        ))
      }
    }
  end

  defp gen_conn do
    {:ok, token} = Goth.Token.for_scope("https://www.googleapis.com/auth/cloud-platform")

    GoogleApi.Vision.V1.Connection.new(token.token)
  end

  defp build_resource(base64, [encoded: true]) do
    %{content: base64}
  end

  defp build_resource("http" <> _ = image_url, _) do
    %{source: %{imageUri: image_url}}
  end

  defp build_resource(image_path, _) do
    encoded =
      image_path
      |> File.read!
      |> Base.encode64

    %{content: encoded}
  end

end
