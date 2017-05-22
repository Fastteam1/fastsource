/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.config;

import java.io.IOException;
import java.util.Properties;
import javax.sql.DataSource;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import vnpt.media.efinder.dao.CustomerDAO;
import vnpt.media.efinder.dao.EmployeeDAO;
import vnpt.media.efinder.dao.GameCategoryDAO;
import vnpt.media.efinder.dao.GameServiceNumberDAO;
import vnpt.media.efinder.dao.GameTemplateDAO;
import vnpt.media.efinder.dao.RoleUserDAO;
import vnpt.media.efinder.dao.impl.CustomerDAOImpl;
import vnpt.media.efinder.dao.impl.EmployeeDAOImpl;
import vnpt.media.efinder.dao.impl.GameCategoryDAOImpl;
import vnpt.media.efinder.dao.impl.GameTemplateDAOImpl;
import vnpt.media.efinder.dao.impl.RoleUserDAOImpl;
import vnpt.media.efinder.util.Constants;

/**
 *
 * @author vnpt2
 */
@Configuration
@ComponentScan("vnpt.media.efinder.*")
@EnableTransactionManagement
// Load to Enviroment
@PropertySource(value = {"classpath:ds-hibernate-cfg.properties", "classpath:config.properties"})
public class ApplicationContextConfig {

    // Luu tru cac gia thuoc tinh load boi @PropertySource
    @Autowired
    private Environment env;

    @Bean
    public ResourceBundleMessageSource messageSource() {
        ResourceBundleMessageSource rb = new ResourceBundleMessageSource();
        // Load property in mesage/validator.properties
        rb.setBasenames(new String[]{"messages/validator"});
        return rb;
    }

    @Bean(name = "viewResolver")
    public InternalResourceViewResolver getViewResolver() {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setPrefix("/WEB-INF/pages/");
        viewResolver.setSuffix(".jsp");
        return viewResolver;
    }

    @Bean(name = "multipartResolver")
    public CommonsMultipartResolver multipartResolver() {
        CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver();

        return commonsMultipartResolver;
    }

    @Bean(name = "dataSource")
    public DataSource getDataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();

        // Xem: ds-hibernate-cfg.properties
        dataSource.setDriverClassName(env.getProperty("ds.database-driver"));
        dataSource.setUrl(env.getProperty("ds.url"));
        dataSource.setUsername(env.getProperty("ds.username"));
        dataSource.setPassword(env.getProperty("ds.password"));
        System.out.println("## getDataSource: " + dataSource);
        return dataSource;
    }

    @Autowired
    @Bean(name = "sessionFactory")
    public SessionFactory getSessionFactory(DataSource dataSource) throws IOException {
        Properties properties = new Properties();

        // Xem: ds-hirbernate-cfg.properties
        properties.put("hibernate.dialect", env.getProperty("hibernate.dialect"));
        properties.put("hibernate.show_sql", env.getProperty("hibernate.show_sql"));
        properties.put("current_session_context_class", env.getProperty("current_session_context_class"));

        LocalSessionFactoryBean factoryBean = new LocalSessionFactoryBean();

        // Package chua cac entity class
        factoryBean.setPackagesToScan(new String[]{"vnpt.media.efinder.entity"});
        factoryBean.setDataSource(dataSource);
        factoryBean.setHibernateProperties(properties);
        factoryBean.afterPropertiesSet();

        SessionFactory sf = factoryBean.getObject();
        System.out.println("## getSessionFactory: " + sf);
        return sf;
    }

    @Autowired
    @Bean(name = "transactionManager")
    public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory) {
        HibernateTransactionManager transactionManager = new HibernateTransactionManager(sessionFactory);
        return transactionManager;
    }

    @Bean(name = "roleUserDAO")
    public RoleUserDAO getRoleUserDAO() {
        return new RoleUserDAOImpl();
    }

    @Bean(name = "gameCategoryDAO")
    public GameCategoryDAO getGameCategoryDAO() {
        return new GameCategoryDAOImpl();
    }

    @Bean(name = "gameTemplateDAO")
    public GameTemplateDAO getGameTemplateDAO() {
        return new GameTemplateDAOImpl();
    }

    @Bean(name = "customerDAO")
    public CustomerDAO getCustomerDAO() {
        return new CustomerDAOImpl();
    }

    @Bean(name = "employeeDAO")
    public EmployeeDAO getEmployeeDAO() {
        return new EmployeeDAOImpl();
    }
    
}
