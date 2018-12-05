find . -name '*.dart' -print0 | xargs -0 \
  pub run intl_translation:generate_from_arb \
    --output-dir lib/messages \
    messages/messages_*.arb