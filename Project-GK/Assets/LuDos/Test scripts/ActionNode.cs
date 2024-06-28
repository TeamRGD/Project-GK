using System;

public class ActionNode : BTNode
{
    private Func<bool> action;

    public ActionNode(Func<bool> action)
    {
        this.action = action;
    }

    public override bool Execute()
    {
        return action();
    }
}
