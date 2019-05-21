package com.espatial.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DataAccessUtils;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.espatial.model.Service;

@Component
public class ServiceDaoImpl implements ServiceDao {

	@Autowired
	DataSource datasource;

	@Autowired
	JdbcTemplate jdbcTemplate;

	public Service getService(String id) {
		String sql = "select * from services where id= ?";
		Service service = DataAccessUtils.singleResult(jdbcTemplate.query(sql, new Object[] {id},  new ServiceMapper()));
		if (service == null) {
			service = new Service();
			service.setId("TBD");
			service.setTitle("TBD");
			service.setText("Service text to be defined");
		}
		return service;
	}

	public boolean checkService (String id) {
		String sql = "select * from services where id= ?";
		Service service = DataAccessUtils.singleResult(jdbcTemplate.query(sql, new Object[] {id},  new ServiceMapper()));
		return service != null;
	}
	
	public void updateService (Service service) {
		String sql = "update services set title = ?, subtitle = ?, text = ? where id = ?";
		jdbcTemplate.update(sql, new Object[] {service.getTitle(), service.getSubtitle(), service.getText(), service.getId()});
	}
	
	public void includeService (Service service) {
		String sql = "insert into services values (?, ?, ?, ?)";
		jdbcTemplate.update(sql, new Object[] {service.getId(), service.getTitle(), service.getText(), service.getSubtitle()});
	}
	
	public void deleteService (String id) {
		String sql = "delete from services where id= ?";
		jdbcTemplate.update(sql, new Object[] {id});
	}
	
	public List<Service> getAllServices() {
		String sql = "select * from services";
		return jdbcTemplate.query(sql, new ServiceMapper());
	}
}

class ServiceMapper implements RowMapper<Service> {
	public Service mapRow(ResultSet rs, int arg1) throws SQLException {
		Service service = new Service();
		service.setId(rs.getString("id"));
		service.setTitle(rs.getString("title"));
		service.setSubtitle(rs.getString("subtitle"));
		service.setText(rs.getString("text"));
		service.setAction(Service.INSERT);

		return service;
	}
}