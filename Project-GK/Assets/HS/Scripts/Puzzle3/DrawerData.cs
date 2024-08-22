using UnityEngine;
using System.Collections.Generic;


[CreateAssetMenu(fileName = "DrawerData", menuName = "Puzzle/DrawerData", order = 1)]
public class DrawerData : ScriptableObject
{
    public List<Drawer> stairDrawerList;
}
