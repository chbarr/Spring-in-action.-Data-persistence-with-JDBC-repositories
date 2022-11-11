package tacos.data;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.databind.ObjectMapper;

import tacos.Order;
import tacos.Taco;
import tacos.web.DesingTacoController;
@Slf4j
@Repository
public class JdbcOrderRepository implements OrderRepository {

	private SimpleJdbcInsert orderInserter;
	private SimpleJdbcInsert orderTacoInserter;
	private ObjectMapper objectMapper;

	@Autowired
	public JdbcOrderRepository(JdbcTemplate jdbc) {
		this.orderInserter = new SimpleJdbcInsert(jdbc).withTableName("taco_orders").usingGeneratedKeyColumns("id");
		this.orderTacoInserter = new SimpleJdbcInsert(jdbc).withTableName("taco_orders_tacos");
		this.objectMapper = new ObjectMapper();
	}

	/*
	 * Este método define el flujo de ejecución para guardar toda la información relacionada
	 * con las ordenes de los tacos, es decir
	 * 1.Almacenena los datos relacionados con la orden (nombre del cliente, datos de entrega y de pago)
	 * a través del método saveOrderDetails.
	 * 2.Almacena los datos relacionados a cada orden a través del método saveTacoToOrder.
	 */
	@Override
	public Order save(Order order) {
		order.setPlacedAt(new Date());
		long orderId = saveOrderDetails(order);
		order.setId(orderId);
		List<Taco> tacos = order.getTacos();
		for(Taco taco: tacos) {
			log.info("mesj");
			saveTacoToOrder(taco, orderId);
		}
		return order;
	}

	/*
	 * Este método utiliza el objectMapper para convertir el objeto order a json, por lo que sus
	 * atributos quedan definidos en el formato clave valor, que es el utilizado por el HashMap, por lo tanto,
	 * se puede asignar sin inconvenientes, y añadir los campos adicionales de forma manual ("placedAt")
	 */
	private long saveOrderDetails(Order order) {
		@SuppressWarnings("unchecked")
		HashMap<String, Object> values = objectMapper.convertValue(order, HashMap.class);
		values.put("placedAt", order.getPlacedAt());
		long orderId = orderInserter.executeAndReturnKey(values).longValue();
		return orderId;
	}
	
	/*
	 * Este método almacena en la bbdd los datos que expresan la relación entre un taco y una orden
	 * a través del id de cada objeto.
	 */
	private void saveTacoToOrder(Taco taco, long orderId) {
		HashMap<String,Object> values = new HashMap<>();
		values.put("tacoOrder", orderId);
		values.put("taco", taco.getId());
		orderTacoInserter.execute(values);
	}

}
