class Address
{
    class func city() -> String
    {
        return Generator.sharedInstance.parseKey("address.city")
    }
}
