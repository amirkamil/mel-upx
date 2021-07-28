UPCXX=upcxx
FLAGS=-O3
# -xmic-avx512 -DCHECK_RESULTS
all: match_rma match_promise

match_rpc: main.cpp maxematch_upx_rpc.hpp
	$(UPCXX) $(FLAGS) -DUSE_UPX_RPC main.cpp -o $@

match_rma: main.cpp maxematch_upx.hpp
	$(UPCXX) $(FLAGS) main.cpp -o $@

match_promise: main.cpp maxematch_upx_promise.hpp
	$(UPCXX) $(FLAGS) main.cpp -o $@

clean:
	rm -rf match_rpc match_rma match_promise
