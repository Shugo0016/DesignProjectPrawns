using System.Collections;
using UnityEngine;
using UnityEngine.Networking;

[System.Serializable]

public class Data{
    public string to_update;
    public int value;
    public int session_id;
}

public class ServerComs : MonoBehaviour
{
    private const string ServerUrl = "http://localhost:3030/unitydata"; // Your server URL

    // Function to send score to the server
    public IEnumerator dataSender(string update, int val, int session)
    {
        // Create the data to send
        var postData = new Data{to_update = update, value = val, session_id = session};

        // Convert data to JSON
        string jsonData = JsonUtility.ToJson(postData);
        Debug.Log(jsonData);

        // Send the POST request
        using (UnityWebRequest request = new UnityWebRequest(ServerUrl, "POST"))
        {
            byte[] bodyRaw = System.Text.Encoding.UTF8.GetBytes(jsonData);
            request.uploadHandler = new UploadHandlerRaw(bodyRaw);
            request.downloadHandler = new DownloadHandlerBuffer();
            request.SetRequestHeader("Content-Type", "application/json");

            // Wait for the request to complete
            yield return request.SendWebRequest();

            if (request.result == UnityWebRequest.Result.Success)
            {
                Debug.Log("Data sent successfully: " + request.downloadHandler.text);
            }
            else
            {
                Debug.LogError("Error sending data: " + request.error);
            }
        }
    }
    
}