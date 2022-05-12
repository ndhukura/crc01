1)	CRC:
import java.util.*; public class CRC {
public static void main(String args[]){ 
Scanner sc = new Scanner(System.in); 
int size_data,size_gen; 
System.out.println("Enter Data size"); 
size_data = sc.nextInt();
int data[] = new int[size_data]; 
for(int i=0;i<size_data;i++){
System.out.println("Enter bit:"+(size_data-i)+":"); 
data[i] = sc.nextInt();
}
System.out.println("Enter Generator size"); 
size_gen = sc.nextInt();
int gen[] = new int[size_gen];
for(int i=0;i<size_gen;i++){
System.out.println("Enter bit:"+(size_gen-i)+":"); 
gen[i] = sc.nextInt();
}
int rem[] = divide_data(data,gen); 
System.out.println("Generated crc code is:"); 
for(int i=0;i<data.length;i++)
System.out.println(data[i]); 
for(int i=0;i<gen.length;i++)
System.out.println(gen[i]);
int sentData[] = new int[data.length+rem.length-1]; 
System.out.println("Enter bits in array you ant to send:"); 
for(int i=0;i<sentData.length;i++){
System.out.println("Enter bit:"+(sentData.length-1)+":"); 
sentData[i] = sc.nextInt();
}
recieveData(sentData,gen);
}
static int[] divide_data(int oldData[],int gen[]){ int rem[] = new int[gen.length];
int data[] = new int[oldData.length+ gen.length]; 
System.arraycopy(oldData,0,data,0,oldData.length); 
System.arraycopy(data,0,rem,0,gen.length);
for(int i=0;i<oldData.length;i++){ 
System.out.println("First data bit:"+rem[0]); 
System.out.println("Remainder:"); 
if(rem[0]==1){
for(int j=1;j<gen.length;j++){
rem[j-1] = exor(rem[j],gen[j]); 
System.out.println(rem[j-1]);
}
}
else{
for(int j=1;j<gen.length;j++){ rem[j-1] = exor(rem[j],0); 
System.out.println(rem[j-1]);
}
}
rem[gen.length-1] = data[i+gen.length]; 
System.out.println(rem[gen.length-1]);
}
return rem;
}
static int exor(int a,int b){ if(a==b) return 0;
return 1;
}
static void recieveData(int data[],int gen[]){ 
int rem[] = divide_data(data,gen);
for(int i=0;i<rem.length;i++){ 
if(rem[i]!=0){
System.out.println("Corrupted data"); 
return;
}
}
System.out.println("Data Recieved Success");
}

}

 
