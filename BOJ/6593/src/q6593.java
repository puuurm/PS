import java.io.*;
import java.util.*;

class Node{
	int pos; int cnt;
	public Node(int p, int c) {
		pos = p; cnt = c;
	}
	@Override
	public String toString() {
		return pos+" "+cnt;
	}
}

public class q6593 {
	static BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
	static int L, R, C;
	static char[][][] MATRIX;
	static boolean[] visit = new boolean[313131];
	static Queue<Node> Q = new LinkedList<>();
	static int[][] MOVE = {
			{-1, 0, 0}, {1, 0, 0},
			{0, -1, 0}, {0, 1, 0},
			{0, 0, -1}, {0, 0, 1}
	};
	static boolean inValid(int f, int i, int j){
		return f<0 || f>=L || i<0 || i>=R || j<0 || j>=C;
	}
	public static void main(String[] args) throws IOException {
		while(true){
			StringTokenizer st = new StringTokenizer(br.readLine());
			L = Integer.valueOf(st.nextToken());
			R= Integer.valueOf(st.nextToken());
			C = Integer.valueOf(st.nextToken());
			if(L==0) break;
			MATRIX = new char[35][35][35];
			
			Arrays.fill(visit, false);
			int S[] = new int[3]; int E[] = new int[3];
			// L:f  R:i C:j
			for(int f=0; f<L; f++){
				for(int i=0; i<R; i++){
					String input = br.readLine();
					for(int j=0; j<C; j++){					
						MATRIX[f][i][j] = input.charAt(j);
						if(MATRIX[f][i][j]=='S') {
							S[0] = f;
							S[1] = i;
							S[2] = j;
						}
						if(MATRIX[f][i][j]=='E') {
							E[0] = f;
							E[1] = i;
							E[2] = j;
						}
					}
				}
				br.readLine();
			}
			int sPos = S[0]*10000+S[1]*100+S[2];
			Q.add(new Node(sPos, 0));
			visit[sPos]=true;
			int ePos = E[0]*10000+E[1]*100+E[2];

			int res = 0;
			while(!Q.isEmpty()){
				int num = Q.peek().pos;
				int now_f = num/10000;
				int now_i = num%10000/100;
				int now_j = num%100;
				int cnt = Q.peek().cnt;
				Q.poll();
				for(int k = 0; k < 6; k++){
					int next_f = now_f+MOVE[k][0];
					int next_i = now_i+MOVE[k][1];
					int next_j = now_j+MOVE[k][2];
					if(inValid(next_f, next_i, next_j)) continue;
					if(MATRIX[next_f][next_i][next_j]=='#') continue;
					int nPos = next_f*10000+next_i*100+next_j;
					if(visit[nPos]) continue;
					visit[nPos]=true;
					Q.add(new Node(nPos, cnt+1));
					if(nPos==ePos){
						res = cnt + 1;
						Q.remove();
						break;
					}
					
				}
			}
			
			if(res==0) System.out.println("Trapped!");
			else System.out.println("Escaped in "+res+" minute(s).");
			if(!Q.isEmpty()) Q.remove();
			
		}

	}

}

