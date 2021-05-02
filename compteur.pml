# define LIMITE 10
# define NB_INC 10

int cpt = 0;

proctype incr(chan ending){
	int i = 0
	int tmp
	begin:
			i = i + 1
			tmp = cpt
			tmp = tmp + 1
			cpt = tmp
			if
				:: i < LIMITE -> goto begin
				:: i >= LIMITE -> goto end
			fi
	end:
			ending!0
}

init{
	int x,j
	int lim = NB_INC;
	chan ending = [0] of {int}
	for(j:1..lim){
		run incr(ending)
	}
	for(j:1..lim){
		ending?x -> printf("an incr has finished\n")
	}
	assert cpt == LIMITE * NB_INC
}




