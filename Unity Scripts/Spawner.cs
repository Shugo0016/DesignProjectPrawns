using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class Spawner : MonoBehaviour
{
    public GameObject action;

    private GameObject canvas;

    // Start is called before the first frame update
    void Start()
    {
        Button button = GetComponent<Button>();
        button.onClick.AddListener(spawn);

        canvas = GameObject.FindWithTag("Canvas");
    }

    void spawn()
    {
        GameObject clone = Instantiate(action);
        clone.transform.position = transform.position;
        clone.transform.SetParent(canvas.transform);
        clone.transform.SetAsLastSibling();
    }
    // Update is called once per frame
    void Update()
    {
        
    }
}
