
var current = null;
var registered_states = [];

func new()
{
    return @this;
}

func find_state(id)
{
    foreach(state : registered_states)
    {
        if(state.id == id)
        {
            return state;
        }
    }
    return null;
}

func register(state)
{
    registered_states.push(state);
}

func switch(next_id) : bool
{
    var next = find_state(next_id);
    if(next == null)
    {
        log.warn("遷移先のステートが見つかりませんでした:{0}", next_id);
        return false;
    }
    if(current != null)
    {
        current.on_state_end();
    }
    current = next;
    current.on_state_began();
    return true;
}

func update()
{
    current.update();
}