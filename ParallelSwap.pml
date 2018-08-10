int A[24];
int n;
int mutex[24];

proctype Filler(){//this will fill the array
//this picks a random number form 2 - 24 and fills the array with that many distinct positive integers
//it fills the mutext array with all zeros
if
:: n =2
:: n =3
:: n =4
:: n =5
:: n =6
:: n =7
:: n =8
:: n =9
:: n =10
:: n =11
:: n =12
:: n =13
:: n =14
:: n =15
:: n =16
:: n =17
:: n =18
:: n =19
:: n =20
:: n =21
:: n =22
:: n =23
:: n =24
fi
//n is assigned a random value from 2 to 24
printf("n is: %d\n", n);
int i=0;
do
::i >= n ->break
::else->    
    A[i]=i;
    mutex[i]=0;
    i++
od;
printf("A[n-1]= %d\n", A[n-1]);
}

proctype Swapper(){
//this will create n processes which each pick a number between 0 and n, and swap those 2 numbers in the array
//each cell in the array will have a different mutex lock,
//before performing the swap operation, process i will swap cells i and j,
//it checks the number in mutex[i] and mutex[j] if either of those is =1,
//it waits for both to be =0, then it sets both to 1, and performs the operation,
//then it sets both back to 0 and terminates

    printf("SWapper started\n");
    int j=0;

    do 
    :: j < n -> j++
    :: j < n -> j++
    :: j < n -> j++
    :: j < n -> j++
    ::break;
    od;
    printf("for process %d j is: %d\n", _pid, j);
    
}

init {
    run Filler();
    int i=0;
    do
    ::i >= n ->break
    ::else->    
    run Swapper();
    i++;
    od;
    
}