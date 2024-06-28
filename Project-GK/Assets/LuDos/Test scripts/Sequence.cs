public class Sequence : BTNode
{
    private BTNode[] nodes;

    public Sequence(params BTNode[] nodes)
    {
        this.nodes = nodes;
    }

    public override bool Execute()
    {
        foreach (BTNode node in nodes)
        {
            if (!node.Execute())
            {
                return false;
            }
        }
        return true;
    }
}