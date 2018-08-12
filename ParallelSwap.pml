#define N   10
int A[10];
int lock[10];
#define mutex0 (lock[0] <=1);
#define mutex1 (lock[1] <=1);
#define mutex2 (lock[2] <=1);
#define mutex3 (lock[3] <=1);
#define mutex4 (lock[4] <=1);
//#define mutex5 (lock[5] <=1);
//#define mutex6 (lock[6] <=1); 
//#define mutex7 (lock[7] <=1);
//#define mutex8 (lock[8] <=1); 
//#define mutex9 (lock[9] <=1);
active proctype Filler() {
    //this will fill the array
    //printf("n is: %d\n", N);
    int i =0;
    do
    ::i >= N -> break;
    ::else->    
        A[i]=i;
        lock[i]=0;
        i++;
    od;
    printf("A[N-1]= %d\n", A[N-1]);
}

active [10] proctype Swapper() {
//this will create n processes which each pick a number between 0 and n, and swap those 2 numbers in the array
//each cell in the array will have a different mutex lock,
//before performing the swap operation, process i will swap cells i and j,
//it checks the number in mutex[i] and mutex[j] if either of those is =1,
//it waits for both to be =0, then it sets both to 1, and performs the operation,
//then it sets both back to 0 and terminates

    printf("Swapper started\n");
    int j=0;

    do 
    :: j < N-1 -> j++;
    :: j < N-1 -> j++;
    :: j < N-1 -> j++;
    :: j < N-1 -> j++;
    ::break;
    od;
    
    printf("for process %d j is: %d before reassignment\n", _pid, j);
    if //make sure that a process doesn't swap _pid with _pid
    ::j==_pid-1 ->
        j++;
    ::else ->
    fi;
    
    if
    ::j>=10 ->
        j = j-2;
    ::else ->
    fi;
    printf("for process %d j is: %d\n", _pid, j);
    
    
    //after picking a random index to swap, perform mutex checks and swap
    
    do
    :: lock[_pid-1]==0 && lock[j]==0 ->
        lock[_pid-1]=1;
        printf("Process %d has locked mutex: %d as first\n", _pid, _pid-1);
        lock[j]=1;
        printf("Process %d has locked mutex: %d as second\n", _pid, j);
        int temp = A[j];
        A[j]=A[_pid-1];
        A[_pid-1]=temp;
        printf("Process %d has swapped\n", _pid);
    
        lock[j]=0;//unlock the cell
        printf("Process %d has unlocked mutex: %d\n", _pid, j);
        lock[_pid-1]=0;//unlock the cell
        printf("Process %d has released mutex: %d \n", _pid, _pid-1);
        break;
    ::else
    //wait
    od;
    
    printf("Process %d is done\n", _pid);
}



