rm -rf dygiepp/data/blockchain_whitepapers/raw_data
rm -rf dygiepp/data/blockchain_academia/raw_data

mkdir dygiepp/data/blockchain_whitepapers/raw_data
mkdir dygiepp/data/blockchain_academia/raw_data

# Remove breaks
./scripts/remove_breaks.sh

cd dygiepp

# Format
python scripts/new-dataset/format_new_dataset.py data/blockchain_whitepapers/raw_data data/blockchain_whitepapers/formatted.jsonl scierc
python scripts/new-dataset/format_new_dataset.py data/blockchain_academia/raw_data data/blockchain_academia/formatted.jsonl scierc

# Predict
allennlp predict \
  models/scierc_lightweight/model.tar.gz \
  data/blockchain_whitepapers/formatted.jsonl \
  --predictor dygie \
  --include-package dygie \
  --use-dataset-reader \
  --output-file data/blockchain_whitepapers/result.jsonl \
  --cuda-device -1 \
  --silent

allennlp predict \
  models/scierc_lightweight/model.tar.gz \
  data/blockchain_academia/formatted.jsonl \
  --predictor dygie \
  --include-package dygie \
  --use-dataset-reader \
  --output-file data/blockchain_academia/result.jsonl \
  --cuda-device -1 \
  --silent
