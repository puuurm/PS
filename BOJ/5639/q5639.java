import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Scanner;
import java.util.StringTokenizer;

class Node {
	Node left;
	Node right;
	int data;
	
	public Node(int data) {
		this.data = data;
	}
}

public class q5639 {
	static Node tree;
	static StringBuffer sb = new StringBuffer();
	static void postOrder(Node root) {
		if (root!=null) {
			postOrder(root.left);
			postOrder(root.right);
			sb.append(root.data+"\n");
		}
	}
	static void insertNode(Node root, Node n) {
		int rV = root.data; int nV = n.data;
		if (rV < nV) {
			if(root.right==null) {root.right=n;}
			else insertNode(root.right, n);
		} else {
			if(root.left==null) {root.left=n;}
			else insertNode(root.left, n);
		}
	}
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));		
		int rootValue = Integer.valueOf(br.readLine());
		tree = new Node(rootValue);
		String str;
		while((str=br.readLine())!=null&&str.length()!=0) {
			int input = Integer.valueOf(str);
			Node n = new Node(input);
			insertNode(tree, n);
		}
		
		postOrder(tree);
		br.close();
		System.out.println(sb);
	}

}
