import java.io.*;
import java.util.*;
 
public class q2618 {
    static int n, m; 
    static int[][] dp = new int[1005][1005]; 
    static int[][] px = new int[1005][1005];
    static int[][] py = new int[1005][1005];
    static int[] x = new int[1005]; 
    static int[] y = new int[1005];
    static int dist[][] = new int[1005][1005];
    static final int INF = (int)1e9;
    static OutputStream out = new BufferedOutputStream(System.out);

    public static void main(String[] args) throws NumberFormatException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        n = Integer.parseInt(br.readLine());
        m = Integer.parseInt(br.readLine());
        x[0]=y[0]=1;
        x[1]=y[1]=n;
        for(int i=2; i<=m+1; i++){
            StringTokenizer st = new StringTokenizer(br.readLine());
            int in_x = Integer.valueOf(st.nextToken())-1;
            int in_y = Integer.valueOf(st.nextToken())-1;
            x[i]=in_x; y[i]=in_y;
        }
        for(int i=0;i<=m+1;++i){
        	for(int j=0;j<=m+1;++j){
        		dp[i][j]=INF;
        		dist[i][j]=Math.abs(x[i]-x[j])+Math.abs(y[i]-y[j]);
        	}
        }
        dp[0][1]=0;
        for(int i=0;i<=m;++i){
            for(int j=1;j<=m;++j){
                int k=Math.max(i,j)+1;
                if(dp[k][j]>dp[i][j]+dist[i][k]){
                    dp[k][j]=dp[i][j]+dist[i][k];
                    px[k][j]=i;
                    py[k][j]=j;
                }
                if(dp[i][k]>dp[i][j]+dist[j][k]){
                    dp[i][k]=dp[i][j]+dist[j][k];
                    px[i][k]=i;
                    py[i][k]=j;
                }
            }
        }
        int ans=INF;
        int cx=0;
        int cy=0;
        for(int i=0;i<=m;++i){
            if(ans>dp[m+1][i]){
                ans=dp[m+1][i];
                cx=m+1;
                cy=i;
            }   
            if(ans>dp[i][m+1]){
                ans=dp[i][m+1];
                cx=i;
                cy=m+1;
            }
        }
        System.out.println(ans);
        ArrayList<Integer> rec = new ArrayList<>();
        int last=m+1;
        while(cx!=0 || cy!=1){
            if(cx==last--){
                rec.add(1);
            }else{
                rec.add(2);
            }
            int nx=px[cx][cy];
            int ny=py[cx][cy];
            cx=nx;
            cy=ny;
        }
        
        for(int i=rec.size()-1;i>=0;--i){
            out.write((rec.get(i)+"\n").getBytes());
        }
        out.close();
    }
 
}