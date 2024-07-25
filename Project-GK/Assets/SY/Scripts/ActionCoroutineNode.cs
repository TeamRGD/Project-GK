using System;
using System.Collections;
using UnityEngine;

public class ActionCoroutineNode : BTNode
{
    private Func<IEnumerator> coroutineAction;
    private MonoBehaviour monoBehaviour;
    private bool isRunning;
    private bool isCompleted;

    public ActionCoroutineNode(Func<IEnumerator> coroutineAction, MonoBehaviour monoBehaviour)
    {
        this.coroutineAction = coroutineAction;
        this.monoBehaviour = monoBehaviour;
        this.isRunning = false;
        this.isCompleted = false;
    }

    public override bool Execute()
    {
        if (!isRunning && !isCompleted)
        {
            isRunning = true;
            monoBehaviour.StartCoroutine(RunCoroutine());
        }
        return isCompleted;
    }

    private IEnumerator RunCoroutine()
    {
        yield return coroutineAction.Invoke();
        isRunning = false;
        isCompleted = true;
    }

    public void Reset()
    {
        isRunning = false;
        isCompleted = false;
    }
}