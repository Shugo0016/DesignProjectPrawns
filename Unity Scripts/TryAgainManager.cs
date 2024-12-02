using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class TryAgainManager : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        Button again = GetComponent<Button>();
        again.onClick.AddListener(nextScene);
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    void nextScene()
    {
        SceneManager.LoadScene(SceneManager.GetActiveScene().name);
    }
}
