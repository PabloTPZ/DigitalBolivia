package connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.List;

import entity.SignatureStudent;
import entity.Student;
import entity.Subject;

import java.util.ArrayList;
import java.sql.ResultSet;
import java.sql.Connection;

public class RegisterDao {
	private String dburl = "jdbc:mysql://localhost/classassignment";
	private String dbuname = "root";
	private String dbpassword = "";
	private String dbdriver = "com.mysql.cj.jdbc.Driver";
	
	public void loadDriver(String dbDriver) {
		try {
			Class.forName(dbDriver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() {
		Connection con = null;
		try {
			con = DriverManager.getConnection(dburl, dbuname, dbpassword);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public String insert(Student student) {	
		loadDriver(dbdriver);
		
		Connection con = getConnection();
		String result = "Successfully";
		String sql = "INSERT INTO `Student`(`last_name`, `first_name`) VALUES (?,?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql.toString());
			ps.setString(1, student.getLastName());
			ps.setString(2, student.getFirtName());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = "Error";
		}
		return result;
	}
	
	public String insertClass(Subject cls) {	
		loadDriver(dbdriver);
		
		Connection con = getConnection();
		String result = "Successfully";
		String sql = "INSERT INTO `Class`(`title`, `description`) VALUES (?,?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, cls.getTitle());
			ps.setString(2, cls.getDescription());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = "Error";
		}
		return result;
	}
	
	public List<SignatureStudent> getLitStudent() {
		loadDriver(dbdriver);

		List<SignatureStudent> student = new ArrayList<SignatureStudent>();
		Connection con = getConnection();
		String result = "Successfully";
		String sql = "SELECT id_student, last_name, first_name, title FROM Student, Class, Student_Class WHERE id_student = Student_id_student and code = Class_code";
		try {
			Statement st = con.createStatement();
			ResultSet rs= st.executeQuery(sql);
			while (rs.next()) {
				SignatureStudent user= new SignatureStudent();
				user.setId(rs.getInt("id_student"));
				user.setFirst_name(rs.getString("first_name"));
				user.setLast_name(rs.getString("last_name"));
				user.setTitle(rs.getString("title"));
				student.add(user);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = "Error";
		}
		return student;

	}
	
	public List<Subject> getLitsSubject() {
		loadDriver(dbdriver);

		List<Subject> subjects = new ArrayList<Subject>();
		Connection con = getConnection();
		String sql = "SELECT code, title, description FROM Class";
		try {
			Statement st = con.createStatement();
			ResultSet rs= st.executeQuery(sql);
			while (rs.next()) {
				Subject subject = new Subject();
				subject.setId(rs.getInt("code"));
				subject.setTitle(rs.getString("title"));
				subject.setDescription(rs.getString("description"));
				subjects.add(subject);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return subjects;

	}
	

	public String deleteStudent(Integer id) {	
		loadDriver(dbdriver);
		
		Connection con = getConnection();
		String result = "Successfully";
		String sql = "DELETE FROM Student WHERE id_student=" + id;
		try {
			Statement st = con.createStatement();
			st.executeUpdate(sql);
			System.out.println("Data Deleted Successfully!");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = "Error";
		}
		return result;
	}

	public String editStudent(Student student, int idClass) {	
		loadDriver(dbdriver);
		
		Connection con = getConnection();
		String result = "Successfully";
		if (student.getFirtName() != null && student.getLastName() != null) {
			String sql = "UPDATE Student SET last_name ="+ student.getLastName() +", first_name = "+ student.getFirtName() +" WHERE id_student = " + student.getId();
			try {
				Statement st = con.createStatement();
				st.executeUpdate(sql);
				System.out.println("Data Deleted Successfully!");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("Data Deleted Error!");
			}
		}
		else if (student.getFirtName() != null) {
			String sql = "UPDATE Student SET first_name = "+ student.getFirtName() +" WHERE id_student = " + student.getId();
			try {
				Statement st = con.createStatement();
				st.executeUpdate(sql);
				System.out.println("Data Deleted Successfully!");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("Data Deleted Error!");
			}
		}
		else if (student.getLastName() != null) {
			String sql = "UPDATE Student SET last_name = "+ student.getLastName() +" WHERE id_student = " + student.getId();
			try {
				Statement st = con.createStatement();
				st.executeUpdate(sql);
				System.out.println("Data Deleted Successfully!");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("Data Deleted Error!");
			}
		}
		return result;
	}

	public String deleteSubject(Integer id) {	
		loadDriver(dbdriver);
		
		Connection con = getConnection();
		String result = "Successfully";
		String sql = "DELETE FROM Class WHERE code=" + id;
		try {
			Statement st = con.createStatement();
			st.executeUpdate(sql);
			System.out.println("Data Deleted Successfully!");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = "Error";
		}
		return result;
	}
	
	public String editSubject(Subject subject, int idSubject) {	
		loadDriver(dbdriver);
		
		Connection con = getConnection();
		String result = "Successfully";
		if (subject.getTitle() != null && subject.getDescription() != null) {
			String sql = "UPDATE Class SET title ="+ subject.getTitle() +", description = "+ subject.getDescription() +" WHERE id_student = " + subject.getId();
			try {
				Statement st = con.createStatement();
				st.executeUpdate(sql);
				System.out.println("Data Deleted Successfully!");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("Data Deleted Error!");
			}
		}
		else if (subject.getTitle() != null) {
			String sql = "UPDATE Class SET title = "+ subject.getTitle() +" WHERE id_student = " + subject.getId();
			try {
				Statement st = con.createStatement();
				st.executeUpdate(sql);
				System.out.println("Data Deleted Successfully!");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("Data Deleted Error!");
			}
		}
		else if (subject.getDescription() != null) {
			String sql = "UPDATE Class SET description = "+ subject.getDescription() +" WHERE id_student = " + subject.getId();
			try {
				Statement st = con.createStatement();
				st.executeUpdate(sql);
				System.out.println("Data Deleted Successfully!");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("Data Deleted Error!");
			}
		}
		return result;
	}
}

