public class PhoneNumber: Generator
{
    public func phoneNumber() -> String
    {
        return numerify(generate("phone_number.formats"))
    }

    public func cellPhone() -> String
    {
        return numerify(generate("cell_phone.formats"))
    }
}
