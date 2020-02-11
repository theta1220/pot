
#def UNITY
// #def CONSOLE

var main = octopus.main.new();

while(true)
{
    var command = "";

    #ifdef UNITY
    system_call("Aquarium.Terminal.GetInput", null, command);
    if(command == "")
    {
        continue;
    }
    main.entry(command);
    #end
    #ifdef CONSOLE
    system_call("Pot.Sumi.Input", null, command);
    if(command == "exit")
    {
        break;
    }
    main.entry(command);
    #end
}