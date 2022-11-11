package tacos.data;

import java.sql.Timestamp;
import java.sql.Types;
import java.util.Arrays;
import java.util.Date;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementCreatorFactory;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import lombok.extern.log4j.Log4j;
import tacos.Ingredient;
import tacos.Taco;


@Repository
public class JdbcTacoRepository implements TacoRepository {

	private JdbcTemplate jdbc;

	public JdbcTacoRepository(JdbcTemplate jdbc) {
		this.jdbc = jdbc;
	}

	@Override
	public Taco save(Taco taco) {
		long tacoId = saveTacoInfo(taco); 
		taco.setId(tacoId);
		for (String ingredientId : taco.getIngredients()) {
			saveIngredientToTaco(ingredientId, tacoId);
		}
		return taco;
	}
	/*
	 * Este método inserta en la tabla taco la información relacionada con la instacia del taco en sí,
	 * como su id, su nombre y la fecha en la que fue creado; y retorna el id del taco para poder 
	 * relacionar la información de las otras tablas involucradas (taco_orders_tacos y taco_ingredients)
	 */
	private long saveTacoInfo(Taco taco) {
		taco.setCreatedAt(new Date());
		PreparedStatementCreatorFactory pscFactory =
				new PreparedStatementCreatorFactory("insert into tacos (name, createdAt) values (?,?)", Types.VARCHAR, Types.TIMESTAMP);
		pscFactory.setReturnGeneratedKeys(true);
		PreparedStatementCreator psc = pscFactory.newPreparedStatementCreator(Arrays.asList(taco.getName(), new Timestamp(taco.getCreatedAt().getTime())));
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbc.update(psc, keyHolder);
		return keyHolder.getKey().longValue();
	}

	private void saveIngredientToTaco(String ingredientId, long tacoId) {
		jdbc.update("insert into taco_ingredients (taco, ingredient) values (?, ?)", tacoId, ingredientId);
	}

}
