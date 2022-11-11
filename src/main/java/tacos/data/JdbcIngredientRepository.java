package tacos.data;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import tacos.Ingredient;

@Repository
public class JdbcIngredientRepository implements IngredientRepository {

	private JdbcTemplate jdbc;

	@Autowired
	public JdbcIngredientRepository(JdbcTemplate jdbc) {
		this.jdbc = jdbc;
	}

	@Override
	public Iterable<Ingredient> findAll() {

		return jdbc.query("select id, name, type from ingredients", new IngredientMapper());
	}

	@Override
	public Ingredient findOne(String id) {
		return jdbc.queryForObject("select id, nome, type, from ingredients where id=?", new IngredientMapper(), id);

	}

	@Override
	public Ingredient save(Ingredient ingredient) {
		jdbc.update("insert into ingredients (id, name, type) values (?, ?, ?)", ingredient.getId(),
				ingredient.getName(), ingredient.getType().toString());
		return ingredient;
	}

}
