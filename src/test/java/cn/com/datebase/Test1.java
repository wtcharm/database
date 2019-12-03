package cn.com.datebase;
class People{
	String name;
	public People(){
		System.out.println(1);
	}
	public People(String name) {
		System.err.println(2);
		this.name = name;
	}
}


class Child extends People {
	People father;
	
	public Child (String name) {
		System.err.println(3);
		this.name = name;
		father = new People(name + ":F");
	}
	
	public Child() {
		System.err.println(4);
	}
}

public class Test1 {

	public static void main(String[] args) {
		new Child("mike");
	}

}
