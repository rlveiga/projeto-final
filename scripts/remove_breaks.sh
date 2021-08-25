for f in corpus/whitepapers/*.txt
do
  tr '\n' ' ' < "$f" > whitepaper_$(basename "$f" .txt).txt
done

for f in corpus/academic/*.txt
do
  tr '\n' ' ' < "$f" > academic_$(basename "$f" .txt).txt
done