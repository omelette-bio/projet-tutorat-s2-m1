if [ "$1" = "AMD" ]; then
	gcc -O2 memory_bound.c -o memory_bound_bench
	for i in {1..10}
	do
		perf stat -e L1-dcache-loads,L1-dcache-load-misses,l2_cache_req_stat.ls_rd_blk_l_hit_x,l2_cache_req_stat.ls_rd_blk_c,cache-misses,cache-references ./memory_bound_bench 2>> memory_bound_AMD.data > /dev/null
	done
fi
if [ "$1" = "INTEL" ]; then
  gcc -O2 memory_bound.c -o memory_bound_bench
  for i in {1..10}
  do
    perf stat -e L1-dcache-load-misses,l2_rqsts.miss,cache-misses,LLC-store-misses,LLC-load-misses,L1-dcache-stores ./memory_bound_bench > /dev/null 2>> memory_bound_INTEL.data 
  done
fi

