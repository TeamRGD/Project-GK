using System;

public class WhileNode : BTNode
{
    private Func<bool> condition;
    private BTNode child;

    public WhileNode(Func<bool> condition, BTNode child)
    {
        this.condition = condition;
        this.child = child;
    }

    public override bool Execute()
    {
        while (condition())
        {
            if (!child.Execute())
            {
                return false;
            }
        }
        return true;
    }
}