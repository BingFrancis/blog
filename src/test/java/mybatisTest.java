import org.springframework.stereotype.Service;


@Service
public class mybatisTest {
//    @Autowired
//    private static UserMapper userMapper = SpringContextHolder.getBean(UserMapper.class);
     /**
//     * 测试查询所有
//     */
//    @Test
//    public void testFindAll() throws Exception{
////       1. 读取配置文件，生成字节输入流
//        InputStream in = Resources.getResourceAsStream("SqlMapConfig.xml");
////        2.获取sqlsessionFactory
//        SqlSessionFactory factory = new  SqlSessionFactoryBuilder().build(in);
////        3.获取 SqlSession对象
//        SqlSession sqlSession = factory.openSession();
////        4.获取dao的代理对象
//        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
////        5执行查询所有方法
//        List<User> users = userMapper.findAll();
//        for (User user :users){
//            System.out.println(user);
//        }
//        sqlSession.close();
//        in.close();
//    }
//

//    @Test
//    public void testInsert() throws Exception{
////        5执行insert方法
//        User user = new User("admin");
//        user.setNickName("马化腾");
////        user.setEmail("1111@qq.com");
////        user.setPhone("10086");
//        InputStream in = Resources.getResourceAsStream("SqlMapConfig.xml");
////        2.获取sqlsessionFactory
//        SqlSessionFactory factory = new  SqlSessionFactoryBuilder().build(in);
////        3.获取 SqlSession对象
//        SqlSession sqlSession = factory.openSession();
//        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
//        System.out.println(userMapper.selectByNickName(user));
//        sqlSession.close();
//    }

//    @Test
//    public void testNickName() throws Exception {
//        User user = new User("admin");
//        user.setNickName("马化腾");
//        UserUtils userUtils = new UserUtils();
//        System.out.println(userMapper.selectByNickName(user));
//    }
}
