

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class q1328 {

	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		StringTokenizer st = new StringTokenizer(br.readLine());
		int N = Integer.valueOf(st.nextToken());
		int L = Integer.valueOf(st.nextToken());
		int R = Integer.valueOf(st.nextToken());
		long[][][] dp = new long[N+1][N+1][N+1];
		dp[1][1][1] = 1;
		for(int i=2; i<=N; i++){
			for(int j=1; j<=i; j++){
				for(int k=1; k<=i; k++){
					dp[i][j][k] = (dp[i-1][j][k-1] + dp[i-1][j-1][k] + dp[i-1][j][k]*(i-2)) % 1000000007;
				}
			}
		}
		System.out.println(dp[N][L][R]);
	}

}