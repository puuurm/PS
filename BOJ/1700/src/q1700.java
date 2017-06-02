import java.io.*;
import java.util.*;
class Node{
	int idx; int cnt;
	public Node(int n) {
		idx = n;
		cnt = 0;
	}
	@Override
	public String toString() {
		return idx+" "+cnt;
	}	
}

public class q1700 {
	static int N, K; static Node[] info;
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		StringTokenizer st = new StringTokenizer(br.readLine());
		N = Integer.valueOf(st.nextToken());
		K = Integer.valueOf(st.nextToken());
		info = new Node[105];
		int[] order = new int[K];
		boolean[] multi = new boolean[K+1];
		for(int i=0; i<=K; i++) info[i]=new Node(i);
		st = new StringTokenizer(br.readLine());
		
		for(int i=0; i<K; i++){
			int n = Integer.valueOf(st.nextToken());
			order[i] = n;
			info[n].cnt++;
		}
		// ÃÊ±âÈ­
		int put = 0; int b = 0;
		for(int i=0; i<K; i++){
			int now = order[i];
			if(put==N) {b=i; break;}
			if(multi[now]) {info[now].cnt--; continue;}
			multi[now] = true;
			info[now].cnt--;;
			put++;
		}
		int dNum = 0;
		if(b!=0){
			for(int i=b; i<K; i++){
				int now = order[i];
				info[now].cnt--;
				if(!multi[now]) {
					int d = -1;
					for(int p=1; p<=K; p++){
						if(!multi[p]) continue;
						if(info[p].cnt==0) {
							d = p;
							break;
						}
					}
					if(d==-1){
						int[] count = new int[K+1];
						for(int p=K-1; p>i; p--){
							int n = order[p];
							if(!multi[n])continue;
							if(count[n]==0)count[n]=info[n].cnt;
							if(count[n]==1) {d = n; break;}
							count[n]--;
						}
					}
					multi[d] = false;
					multi[now] = true;
					dNum++;
				}
			}
		}
		System.out.println(dNum);		
	}

}