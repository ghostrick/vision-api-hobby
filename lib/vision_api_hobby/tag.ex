defmodule VisionApiHobby.Tag do

  def detect_tags(image, opts \\ []) do
    {:ok, %{ responses: [responses | _] }} =
      VisionApiHobby.judge_image(image, ["LABEL_DETECTION", "LANDMARK_DETECTION"], opts)

    %{
      labels: responses.labelAnnotations |> filter_items,
      landmarks: responses.landmarkAnnotations |> filter_items
    }

  end

  defp filter_items(nil), do: []

  defp filter_items(items) do
    items
    |> Enum.filter(&( &1.score > 0.8 ))
    |> Enum.map(&(&1.description))
  end

end
