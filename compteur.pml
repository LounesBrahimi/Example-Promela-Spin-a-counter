# define LIMITE 10
# define NB_INC 10

int cpt = 0;

proctype incr(int id; chan ending; chan obs){
	int i = 0;
	int tmp;
	begin:
			i = i + 1;
			tmp = cpt;
			tmp = tmp + 1;
			cpt = tmp;
			obs!id, tmp;
			if
				:: i < LIMITE -> goto begin;
				:: i >= LIMITE -> goto end;
			fi
	end:
			ending!0;
}

proctype observ(chan obs){
	int id, x;
	do
	:: obs?(id ,x) -> printf("the inc %d, has changed the cpt to : %d\n",id ,x);
	od
}

init{
	int x,j;
	int lim = NB_INC;
	chan ending = [0] of {int}
	chan obs = [0] of {int, int}
	for(j:1..lim){
		run incr(j, ending, obs)
	}
	
	run observ(obs);
	
	for(j:1..lim){
		ending?x -> printf("an incr has finished\n")
	}
	assert cpt == LIMITE * NB_INC
}




