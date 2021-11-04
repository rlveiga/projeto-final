for f in corpus/whitepapers/*.txt
do
  tr '\n' ' ' < "$f" > dygiepp/data/blockchain_whitepapers/raw_data/$(basename "$f" .txt).txt
done

for f in corpus/academic/*.txt
do
  tr '\n' ' ' < "$f" > dygiepp/data/blockchain_academia/raw_data/$(basename "$f" .txt).txt
done

for f in corpus/wiki/*.txt
do
  tr '\n' ' ' < "$f" > dygiepp/data/blockchain_wiki/raw_data/$(basename "$f" .txt).txt
done