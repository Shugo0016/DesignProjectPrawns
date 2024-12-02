using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Obstacle : MonoBehaviour
{
    public GameObject loseScreen;
    public GameObject player;

    private CreatureMovement playerScript;
    
    
    // Start is called before the first frame update
    void Start()
    {
        playerScript = player.GetComponent<CreatureMovement>();
        loseScreen.SetActive(false);
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    void OnTriggerEnter(Collider player)
    {
        loseScreen.SetActive(true);
        playerScript.frozen = true;
    }
}
