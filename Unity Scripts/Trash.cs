using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Trash : MonoBehaviour
{
    private Drag arrowScript;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    void OnTriggerEnter(Collider arrow){
        Debug.Log("Arrow entering");
        arrowScript = arrow.gameObject.GetComponent<Drag>();
        arrowScript.onTrash = true;
    }
    void OnTriggerExit(Collider arrow){
        Debug.Log("Arrow leaving");
        arrowScript = arrow.gameObject.GetComponent<Drag>();
        arrowScript.onTrash = false;
    }
}
