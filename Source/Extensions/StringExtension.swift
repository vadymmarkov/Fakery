extension String
{
    public func indexOfCharacter(char: Character) -> Int?
    {
        if let idx = find(self, char) {
            return distance(self.startIndex, idx)
        }
        return nil
    }
}
