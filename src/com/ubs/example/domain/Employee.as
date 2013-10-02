package com.ubs.example.domain
{
    import mx.collections.ArrayCollection;

    [Bindable]
    public class Employee
    {
        public var name:String;
        public var role:String;
        public var image:String;
        public var pets:ArrayCollection;
    }
}
