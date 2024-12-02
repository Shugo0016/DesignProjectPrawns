using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

public class Drag : MonoBehaviour, IBeginDragHandler, IDragHandler, IEndDragHandler
{
    public Image image;
    public string type;


    [HideInInspector]
    public Transform parentObj;
    public bool onTrash;
    private Camera cam;

    public void OnBeginDrag(PointerEventData eventData)
    {
        image.raycastTarget = false;

        parentObj = transform.parent;
        transform.SetParent(transform.root);
        transform.SetAsLastSibling();
        //throw new System.NotImplementedException();
    }
    public void OnDrag(PointerEventData eventData)
    {
        //throw new System.NotImplementedException();
        transform.position = new Vector3(cam.ScreenToWorldPoint(Input.mousePosition).x, cam.ScreenToWorldPoint(Input.mousePosition).y,
            transform.position.z);

    }
    public void OnEndDrag(PointerEventData eventData)
    {
        image.raycastTarget = true;

        transform.SetParent(parentObj);

        if (onTrash)
        {
            Debug.Log("destorying");
            Destroy(this.gameObject);
        }
        //throw new System.NotImplementedException();
    }
    // Start is called before the first frame update
    void Start()
    {
        image = GetComponent<Image>();
        cam = Camera.main;
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
