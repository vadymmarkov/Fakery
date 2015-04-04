public class Business: Generator
{
    public func creditCardNumber() -> String
    {
        return generate("business.credit_card_numbers")
    }
}
