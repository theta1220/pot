
var main = octopus.main.new();

while(true)
{
    var command = "";
    system_call("Pot.Sumi.Input", command);
    if(command == "exit")
    {
        break;
    }
    main.entry(command);
}