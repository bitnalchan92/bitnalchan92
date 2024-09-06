package statementLike.single;

import java.sql.*;
import java.util.ArrayList;

public class DAO {
    public ArrayList<Emp> search(int menu, String searchWord) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        ArrayList<Emp> result = new ArrayList<>();
        String[] columnName = {"empno", "ename", "job", "mgr", "hiredate", "sal", "comm", "deptno"};

        try {
            String driver = "oracle.jdbc.driver.OracleDriver";
            Class.forName(driver);

            String url = "jdbc:oracle:thin:@localhost:1521:xe";
            conn = DriverManager.getConnection(url, "scott", "tiger");
            stmt = conn.createStatement();

            String sql = "select * \n  from emp\n";

            if (menu != 9) {
                if (sql.contains("where"))
                    sql += "\n   and ";
                else
                    sql += " where ";

                sql += columnName[menu-1] + " like " + "'%" + searchWord + "%'";
            }

            System.out.println("\n✨EMP 테이블 SELECT QUERY✨");
            System.out.println(sql + ";\n");

            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Emp e = new Emp();

                e.setEmpno(rs.getInt("EMPNO"));
                e.setEname(rs.getString("ENAME"));
                e.setJob(rs.getString("JOB"));
                e.setMgr(rs.getInt("MGR"));
                e.setHiredate(rs.getDate("HIREDATE"));
                e.setSal(rs.getInt("SAL"));
                e.setComm(rs.getInt("COMM"));
                e.setDeptno(rs.getInt("DEPTNO"));

                result.add(e);
            }
        } catch (ClassNotFoundException cnfe) {
            System.out.println("해당 클래스를 찾을 수 없습니다. " + cnfe.getMessage());

        } catch (SQLException se) {
            System.out.println(se.getMessage());

        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    System.out.println(e.getMessage());
                }
            }

            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    System.out.println(e.getMessage());
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            }
        }

        return result;
    }
}