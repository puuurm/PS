import java.io.*;
import java.util.*;
class customer{
	int day; int cost;
	public customer(int d, int c) {
		day=d; cost=c;
	}
}
class Node{
	ArrayList<Integer> adj;
	public Node() {
		adj = new ArrayList<>();
	}
	
}

public class q14501 {
	static boolean[] visit;
	static customer[] c;
	static Node[] info; static int maxV = 0;
	static void dfs(int i, int cnt){
		visit[i]=true;
		int size = info[i].adj.size();
		//System.out.println("visit: "+i+", cnt: "+cnt);
		if(size==0) maxV = Math.max(maxV, cnt);
		for(int next:info[i].adj){
			dfs(next, cnt+c[next].cost);
		}
	}
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int N = Integer.parseInt(br.readLine());
		c = new customer[N+1]; 
		for(int i=1; i<=N; i++){
			StringTokenizer st = new StringTokenizer(br.readLine());
			int day = Integer.valueOf(st.nextToken()); int cost = Integer.valueOf(st.nextToken());
			c[i] = new customer(day, cost);
		}
		info = new Node[N+1];
		visit = new boolean[N+1];
		for(int i=1; i<=N; i++) info[i]=new Node();
		
		for(int i=1; i<=N; i++){
			for(int j=i+c[i].day; j<=N; j++){
				if(j+c[j].day <=N+1) info[i].adj.add(j);
			}
		}
		for(int i=1; i<=N; i++){
			if(visit[i] || i+c[i].day>N+1) continue;
			dfs(i, c[i].cost);
		}
		System.out.println(maxV);
	}

}