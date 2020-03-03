import com.blog.entity.User;
import com.blog.mapper.UserMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import java.io.InputStream;
import java.util.List;

public class mybatisTest {
    /**
     * 测试查询所有
     */
    @Test
    public void testFindAll() throws Exception{
//       1. 读取配置文件，生成字节输入流
        InputStream in = Resources.getResourceAsStream("SqlMapConfig.xml");
//        2.获取sqlsessionFactory
        SqlSessionFactory factory = new  SqlSessionFactoryBuilder().build(in);
//        3.获取 SqlSession对象
        SqlSession sqlSession = factory.openSession();
//        4.获取dao的代理对象
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
//        5执行查询所有方法
        List<User> users = userMapper.findAll();
        for (User user :users){
            System.out.println(user);
        }
        sqlSession.close();
        in.close();
    }


    @Test
    public void testInsert() throws Exception{
//        1. 读取配置文件，生成字节输入流
        InputStream in = Resources.getResourceAsStream("SqlMapConfig.xml");
//        2.获取sqlsessionFactory
        SqlSessionFactory factory = new  SqlSessionFactoryBuilder().build(in);
//        3.获取 SqlSession对象
        SqlSession sqlSession = factory.openSession();
//        4.获取dao的代理对象
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
//        5执行insert方法
        User user = new User();
        user.setNickName("马化腾");
        user.setEmail("1111@qq.com");
        user.setPhone("10086");
        userMapper.insert(user);
        sqlSession.commit();
    }

}
