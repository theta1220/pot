
var id = null;

func new(id)
{
    var instance = @this;
    instance.id = id;
    return instance;
}

func on_state_began()
{
    log.debug("{0}に遷移しました", id);
}

func on_state_end()
{
    log.debug("{0}から去りました", id);
}

func update()
{

}