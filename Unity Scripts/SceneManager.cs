using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class SceneManagerScript : MonoBehaviour
{ 
    private int session_id = 1;
    private ServerComs serverCommunication;
    // Start is called before the first frame update
    void Start()
    {
        Button next = GetComponent<Button>();
        serverCommunication = GetComponent<ServerComs>();
        next.onClick.AddListener(nextScene);
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    void nextScene()
    {
        string newSceneName;
        int sceneNumber = 1;
        Scene currentScene = SceneManager.GetActiveScene();
        if (currentScene.name == "Start")
        {
            StartCoroutine(serverCommunication.dataSender("game_id", 2, session_id));
            newSceneName = "Level1";
        }
        else
        {
            sceneNumber = (currentScene.name[currentScene.name.Length - 1]) - '0';
            Debug.Log(currentScene.name);
            Debug.Log(currentScene.name[currentScene.name.Length - 1]);
            Debug.Log(sceneNumber);
            sceneNumber++;
            if (sceneNumber == 5)
            {
                sceneNumber = 1;
            }
            newSceneName = "Level" + sceneNumber.ToString();
        }
        StartCoroutine(serverCommunication.dataSender("level_id", sceneNumber, session_id));
        SceneManager.LoadScene(newSceneName, LoadSceneMode.Single);
    }
}
