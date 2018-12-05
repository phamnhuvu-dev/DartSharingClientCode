pub run build_runner build

find . -name '*.dart' -print0 | xargs -0 \
  pub run intl_translation:extract_to_arb \
    --locale en \
    --output-dir messages \
    --output-file messages_en.arb