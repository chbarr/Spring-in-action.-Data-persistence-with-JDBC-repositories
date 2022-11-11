package tacos.web;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import lombok.extern.slf4j.Slf4j;
import tacos.Ingredient;
import tacos.Ingredient.Type;
import tacos.Order;
import tacos.Taco;
import tacos.data.JdbcIngredientRepository;
import tacos.data.JdbcTacoRepository;

@Slf4j
@Controller
@RequestMapping("/design")
@SessionAttributes("order")
public class DesingTacoController {
	
	private final JdbcIngredientRepository ingredientRepo;
	private JdbcTacoRepository designRepo;
	@Autowired
	public DesingTacoController(JdbcIngredientRepository ingredientRepo, JdbcTacoRepository designRepo) {
		this.ingredientRepo = ingredientRepo;
		this.designRepo = designRepo;
	}

	/*
	 * Añade a la vista html todos los ingredientes consultados en la bbdd
	 */
	@ModelAttribute
	public void addIngredientsToModel(Model model) {
		List<Ingredient> ingredients = new ArrayList<>();

		for (Ingredient ingredient : ingredientRepo.findAll()) {
			ingredients.add(ingredient);
		}
		Type[] types = Ingredient.Type.values();
		for (Type type : types) {
			model.addAttribute(type.toString().toLowerCase(), filterByType(ingredients, type));
		}
	}

	@GetMapping
	public String showDesingForm(Model model) {
		model.addAttribute("design", new Taco());
		return "design";
	}

	@ModelAttribute
	public Order order() {
		return new Order();
	}
	
	@ModelAttribute
	public Taco taco() {
		return new Taco();
	}
	
	@PostMapping
	public String processDesign(@Valid @ModelAttribute("design") Taco design, @ModelAttribute Order order, Errors errors) {
		if (errors.hasErrors()) {
			return "design";
		}
		log.info("Processing design: " + design);
		Taco saved = designRepo.save(design);
		log.info("Este es el taco creado: "+saved.toString());
		order.getTacos().add(saved);
		//log.info("Tacos de la orden: "+order.getTacos());
		return "redirect:/orders/current";
	}
	/*
	 * redirect es una palabra reservada utilizada para enviar
	 * una solicitud http a otra página. La solicitud enviada
	 * es de tipo get, por lo tanto, se utiliza la etiqueta getmapping
	 * en el método del controlador encargado de manejar esta solicitud
	 */

	private List<Ingredient> filterByType(List<Ingredient> ingredients, Type type) {
		ArrayList<Ingredient> filteredList = new ArrayList<Ingredient>();
		for (Ingredient ingredient : ingredients) {
			if (ingredient.getType() == type) {
				filteredList.add(ingredient);
			}
		}
		return filteredList;
	}

}
