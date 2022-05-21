package utils;

import java.util.ArrayList;

import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.Customer;
import com.stripe.model.PaymentMethod;
import com.stripe.model.PaymentMethodCollection;
import com.stripe.param.CustomerListPaymentMethodsParams;

import model.CreditCard;
import model.DAO;
import model.PaymentMethods;
import model.User;

public class PaymentCardRetriever {
	public static ArrayList<CreditCard> RetrieveCards(User user) throws StripeException{
		Stripe.apiKey="sk_test_51L1HugBYa9gzCakFmWr011KOzYFiePCxyVhXA9wsXI22PAp62dGnQ6W4UxIliQ2mojOoCWLQwUkIiXlndsRYIx8m00Cgv9Zz7z";
		
		DAO dao = new DAO();
		String customer_id = dao.getCustomerId(user.getEmail());
		Customer customer = Customer.retrieve(customer_id);

		CustomerListPaymentMethodsParams params =
		  CustomerListPaymentMethodsParams.builder()
		    .setType(CustomerListPaymentMethodsParams.Type.CARD)
		    .build();

		PaymentMethodCollection paymentMethods =
		  customer.listPaymentMethods(params);
		ArrayList<CreditCard> cardlist = new ArrayList<CreditCard>();
		for(PaymentMethod method : paymentMethods.getData()) {
			CreditCard card = new CreditCard();
			PaymentMethod paymentMethod = null;
			try {
				paymentMethod =
				  PaymentMethod.retrieve(
				    method.getId()
				  );
			} catch (StripeException e) {
				e.printStackTrace();
			}
			card.setCardNumber(paymentMethod.getCard().getLast4());
			card.setExp_month(paymentMethod.getCard().getExpMonth().toString());
			card.setExp_year(paymentMethod.getCard().getExpYear().toString());
			PaymentMethods methods = new PaymentMethods();
			methods.setPaymentMethods(method.getId());
			card.setMethodInfo(methods);
			cardlist.add(card);
		}
		return cardlist;
	}
}
