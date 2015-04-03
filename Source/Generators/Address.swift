class Address: Generator
{
    class func city() -> String
    {
        return generate("address.city")
    }

    class func streetName() -> String
    {
        return generate("address.street_name")
    }
}
