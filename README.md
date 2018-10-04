# VisionApiHobby
Let's play with VisionAPI.

# Usage
```bash
$ git clone git@github.com:ghostrick/vision-api-hobby.git
$ cd vision-api-hobby
$ cp config/config.exs.sample config/config.exs
$ vim config/config.exs # Setting goth
$ mix deps.get
$ mix compile
$ iex -S mix
```

```elixir
# Detect items and places in the image.
# Pass local path or url.
# If you want to pass encoded data(base64).
# -> VisionApiHobby.Tag.detect_tags("...", encoded: true)
VisionApiHobby.Tag.detect_tags("./image/hoge.jpg")

# %{
#   labels: ["pink", "mammal", "cartoon", "vertebrate", "nose", "heart"],
#   landmarks: []
# }

# Function that wrapped v1/images:annotate.
VisionApiHobby.judge_image("./image/hoge.jpg", ["LABEL_DETECTION", "LANDMARK_DETECTION"])

# Function that download image and encode it with base64.
VisionApiHobby.Utils.download_image_base64("https://.../hoge.jpg")

```
