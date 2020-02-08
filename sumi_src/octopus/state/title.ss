
var id = "title";
var state_machine = base.state_machine.new();
var parent = null;

func new(parent)
{
    var self = @this;
    self.parent = parent;
    self.state_machine.register(main_menu.new(self));
    return self;
}

func on_state_began()
{
    
}

func on_state_end()
{

}

func update()
{
    
}