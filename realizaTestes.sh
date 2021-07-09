#!/bin/bash
TAMANHOS="64 100"
TESTES="L3 L2CACHE FLOPS_DP"
CORE_ID=3

for teste in $TESTES; do
    rm "$teste".txt
    for tam in $TAMANHOS; do
        ./perfctr $CORE_ID $teste ./matmult -n $tam > tmp.txt
        if [ "$teste" = "L3" ]; then
            cat tmp.txt | grep "L3 bandwidth" | cut -d'|' -f3 >> "$teste"_"$tam".txt
        elif [ "$teste" = "L2CACHE" ]; then
            cat tmp.txt | grep "miss ratio" | cut -d'|' -f3 >> "$teste"_"$tam".txt
        # FLOPS_DP ainda não funciona
        elif [ "$teste" = "FLOPS_DP" ]; then
            DP=$(cat tmp.txt | grep "DP " | cut -d'|' -f3) 
            echo $DP
            AVX=$(cat tmp.txt | grep "AVX " | cut -d'|' -f3) 
            echo "$DP | $AVX" >> "$teste"_"$tam".txt
            
        fi
        while read line; do
                echo "$tam | $line" >> $teste.txt    
            done < "$teste"_"$tam".txt
        
        rm "$teste"_"$tam".txt
    done
done