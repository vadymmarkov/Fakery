class Address
{
    class func city() -> String
    {
        return Generator.sharedInstance.parseKey("address.city")
    }

    class func streetName() -> String
    {
        return Generator.sharedInstance.parseKey("address.street_name")
    }
}
