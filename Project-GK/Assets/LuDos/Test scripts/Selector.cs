public class Selector : BTNode
{
    private BTNode[] nodes;

    public Selector(params BTNode[] nodes)
    {
        this.nodes = nodes;
    }

    public override bool Execute()
    {
        foreach (BTNode node in nodes)
        {
            if (node.Execute())
            {
                return true;
            }
        }
        return false;
    }
}