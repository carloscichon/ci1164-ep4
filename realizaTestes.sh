#!/bin/bash
#TAMANHOS="64 100 128 2000 2048"
TAMANHOS="64"

TESTES="FLOPS_DP"
CORE_ID=3

for teste in $TESTES; do
    rm "$teste".txt
    for tam in $TAMANHOS; do
        ./perfctr $CORE_ID $teste ./matmult -n $tam > tmp.txt
        if [ "$teste" = "L3" ]; then
            cat tmp.txt | grep "L3 bandwidth" | cut -d'|' -f3 >> "$teste"_"$tam".txt
        elif [ "$teste" = "L2CACHE" ]; then
            cat tmp.txt | grep "miss ratio" | cut -d'|' -f3 >> "$teste"_"$tam".txt
        elif [ "$teste" = "FLOPS_DP" ]; then
            cat tmp.txt | grep "DP " | cut -d'|' -f3 >> "$teste"_"$tam"_dp.txt            
            cat tmp.txt | grep "AVX " | cut -d'|' -f3 >> "$teste"_"$tam"_avx.txt
            # retira linha por linha dos arquivos dp e avx
            for i in $TAMANHOS; do
                DP=$(head -1 "$teste"_"$tam"_dp.txt)
                AVX=$(head -1 "$teste"_"$tam"_avx.txt)
                echo "$DP | $AVX" >> "$teste"_"$tam".txt
                sed -i '1d' "$teste"_"$tam"_dp.txt
                sed -i '1d' "$teste"_"$tam"_avx.txt
            done
            #rm "$teste"_"$tam"_dp.txt "$teste"_"$tam"_avx.txt
        fi
        while read line; do
                echo "$tam | $line" >> $teste.txt    
            done < "$teste"_"$tam".txt
        
        rm "$teste"_"$tam".txt
        rm tmp.txt
    done
done