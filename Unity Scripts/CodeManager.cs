using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;


public class CodeManager : MonoBehaviour
{ 

    public Button submit;
    public GameObject CreatureObj;

    [HideInInspector]
    public GameObject[] actionsToExecute;

    // Start is called before the first frame update
    void Start()
    {
        Button check = submit.GetComponent<Button>();
        check.onClick.AddListener(executeCode);

        CreatureMovement creature = CreatureObj.GetComponent<CreatureMovement>();
        check.onClick.AddListener(creature.setVals);
    }

    void executeCode()
    {
        actionsToExecute = GameObject.FindGameObjectsWithTag("Action");
        for(int i = 0; i<actionsToExecute.Length; i++)
        {
            for (int j = 0; j < actionsToExecute.Length - 1; j++)
            {
                if (actionsToExecute[j].transform.position.x > actionsToExecute[j + 1].transform.position.x)
                {
                    GameObject temp = actionsToExecute[j];
                    actionsToExecute[j] = actionsToExecute[j + 1];
                    actionsToExecute[j + 1] = temp;
                }
            }
        }

        foreach(GameObject action in actionsToExecute)
        {
            Drag item = action.GetComponent<Drag>();
            Debug.Log(item.type);
        }
    }
    // Update is called once per frame
    void Update()
    {
        
    }
}
