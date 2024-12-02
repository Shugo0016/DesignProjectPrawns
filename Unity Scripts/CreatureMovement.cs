using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;

public class CreatureMovement : MonoBehaviour
{
    public float velocity = 10.0f;
    public GameObject gameManager;

    [HideInInspector]
    public bool frozen = false;
    CodeManager actionManager;
    Vector3 startingPosition;
    public GameObject[] steps;
    int count = 0;
    Vector3 translation = new Vector3(0.0f, 0.0f, 0.0f);
    bool sorted = false;
    public GameObject loseScreen;


    // Start is called before the first frame update
    void Start()
    {
        actionManager = gameManager.GetComponent<CodeManager>();
        startingPosition = transform.position;
    }

    Vector3 calculateMovement(GameObject action)
    {
        Drag actionScript = action.GetComponent<Drag>();
        string actionType = actionScript.type;
        switch (actionType) { 
            case "Right":
                return new Vector3(-90.0f, 0.0f, 0.0f);
            case "Left":
                return new Vector3(90.0f, 0.0f, 0.0f);
            case "Up":
                return new Vector3(0.0f, 90.0f, 0.0f);
            case "Down":
                return new Vector3(0.0f, -90.0f, 0.0f);
        }
        return new Vector3(0.0f, 0.0f, 0.0f);

    }

    public void setVals()
    {
        steps = actionManager.actionsToExecute;
        translation = calculateMovement(steps[0]);
        sorted = true;
    }

    // Update is called once per frame
    void Update()
    {
        if (sorted && !frozen)
        {
            transform.position = Vector3.MoveTowards(transform.position, startingPosition + translation, velocity * Time.deltaTime);
            if(transform.position == startingPosition + translation)
            {
                count++;
                if (count < steps.Length)
                {
                    startingPosition = transform.position;
                    translation = calculateMovement(steps[count]);
                }
                else
                {
                    loseScreen.SetActive(true);
                }
            }
        }
    }
}
