using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class GoalManager : MonoBehaviour
{
    public GameObject winScreen;
    public GameObject player;
    public TextMesh test;

    private ServerComs serverCommunication;
    private CreatureMovement playerScript;
    private int stepsCount;
    private GameObject movesText;
    private Text scoreText;

    private int session_id = 1;

    // Start is called before the first frame update
    void Start()
    {
        playerScript = player.GetComponent<CreatureMovement>();
        serverCommunication = GetComponent<ServerComs>();
        winScreen.SetActive(false);
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    int calculateScore(){
        //todo: equation for score
        return 222;
    }

    void OnTriggerEnter(Collider player)
    {
        winScreen.SetActive(true);
        movesText = GameObject.FindWithTag("MovesCount");
        scoreText = movesText.GetComponent<Text>();
        playerScript.frozen = true;
        stepsCount = playerScript.steps.Length;
        scoreText.text = string.Concat(scoreText.text, stepsCount.ToString());
        StartCoroutine(serverCommunication.dataSender("score", calculateScore(), session_id));
    }
}
