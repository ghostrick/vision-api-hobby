defmodule VisionApiHobby.Utils do

  def download_image_base64(url) do
    case HTTPoison.get(url) do
      {:ok, %{body: body}} -> Base.encode64(body)
      _ -> :error
    end
  end

end
