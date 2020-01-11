
void tables_orcc(int N, double *y, 
	    double a1, double *x1, double a2, double *x2, 
	    double a3, double *x3) {

/*@ begin PerfTuning (
 def build {
   arg build_command = 'cc -O0';
 } 
 def performance_counter {
   arg repetitions = 10;
 }
 def performance_params {  
   param UF[] = range(1,33);
 }
 def input_params {
   param N[] = [100000000];
 }
 def input_vars {
   decl dynamic double x1[N] = random;
   decl dynamic double x2[N] = random;
   decl dynamic double x3[N] = random;
   decl dynamic double y[N] = 0;
   decl double a1 = 0.5;
   decl double a2 = 1.0;
   decl double a3 = 1.5;
 }
 def search {
   arg algorithm = 'Simplex';
   arg time_limit = 10;
   arg total_runs = 10; 
   arg simplex_local_distance = 2;
   arg simplex_reflection_coef = 1.5;
   arg simplex_expansion_coef = 2.5;
   arg simplex_contraction_coef = 0.6;
   arg simplex_shrinkage_coef = 0.7;
}
) @*/

  int n=N;
  register int i;

/*@ begin Loop ( 
  transform Unroll(ufactor=UF) 
  for (i=0; i<=n-1; i++)
    y[i]=y[i]+a1*x1[i]+a2*x2[i]+a3*x3[i];
) @*/

 for (i=0; i<=n-1; i++)
   y[i]=y[i]+a1*x1[i]+a2*x2[i]+a3*x3[i];

/*@ end @*/
/*@ end @*/

}
