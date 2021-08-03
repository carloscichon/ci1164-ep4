# Testes
Para realizar os testes é necessário executar o comando:

``` ./realizaTestes.sh ``` 

ou  

``` source realizaTestes.sh  ```

# Tabelas

É possível visualizar a tabela de cada teste para cada função nos arquivos:

<teste>_<function>.txt
RUNTIME_<function>.txt

Onde a primeira coluna de cada arquivo representa o tamanho das matrizes e vetores. A segunda coluna representa a métrica não otimizada. A terceira representa a métrica com otimização.

Obs: No caso do FLOPS_DP a segunda coluna representa o DP não otimizado e a terceira o AVX não otimizado. A quarta o DP otimizado e a quinta o AVX otimizado.

Obs2: Nos resultados rodados por nós não foi possível o cálculo do AVX por essa métrica não estar presente em nossa máquina. Entretanto, o script está preparado para encontrá-la corretamente caso esteja disponível.

# Arquitetura

--------------------------------------------------------------------------------
CPU name:	AMD A8-7600 Radeon R7  10 Compute Cores 4C+6G  
CPU type:	AMD Interlagos processor
CPU stepping:	1
********************************************************************************
Hardware Thread Topology
********************************************************************************
Sockets:		1
Cores per socket:	4
Threads per core:	1
--------------------------------------------------------------------------------
HWThread        Thread        Core        Die        Socket        Available
0               0             0           0          0             *                
1               0             1           0          0             *                
2               0             2           0          0             *                
3               0             3           0          0             *                
--------------------------------------------------------------------------------
Socket 0:		( 0 1 2 3 )
--------------------------------------------------------------------------------
********************************************************************************
Cache Topology
********************************************************************************
Level:			1
Size:			16 kB
Type:			Data cache
Associativity:		4
Number of sets:		64
Cache line size:	64
Cache type:		Non Inclusive
Shared by threads:	1
Cache groups:		( 0 ) ( 1 ) ( 2 ) ( 3 )
--------------------------------------------------------------------------------
Level:			2
Size:			2 MB
Type:			Unified cache
Associativity:		16
Number of sets:		2048
Cache line size:	64
Cache type:		Non Inclusive
Shared by threads:	2
Cache groups:		( 0 1 ) ( 2 3 )
--------------------------------------------------------------------------------
********************************************************************************
NUMA Topology
********************************************************************************
NUMA domains:		1
--------------------------------------------------------------------------------
Domain:			0
Processors:		( 0 1 2 3 )
Distances:		10
Free memory:		5820.05 MB
Total memory:		11939.8 MB
--------------------------------------------------------------------------------


********************************************************************************
Graphical Topology
********************************************************************************
Socket 0:
+-----------------------------------------+
| +-------+ +-------+ +-------+ +-------+ |
| |   0   | |   1   | |   2   | |   3   | |
| +-------+ +-------+ +-------+ +-------+ |
| +-------+ +-------+ +-------+ +-------+ |
| | 16 kB | | 16 kB | | 16 kB | | 16 kB | |
| +-------+ +-------+ +-------+ +-------+ |
| +-----------------+ +-----------------+ |
| |       2 MB      | |       2 MB      | |
| +-----------------+ +-----------------+ |
+-----------------------------------------+
