---
layout: posts
comments: true
title : " 2024-07-25 Toss 증권에서 주식 정보 가져오기 "
categories: ETC
tags: [ GPT ]
published: false
---

It looks like the URL you provided is an API endpoint returning JSON data. To access and display this data in a user-friendly manner, you can use a tool or write a small program to fetch and parse the JSON. Here’s an example of how you could do this in C#:

1. **Make an HTTP request to the API.**
2. **Parse the JSON response.**
3. **Display the data.**

Here is a sample C# code to fetch and display the stock prices from the given API:

```csharp
using System;
using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json.Linq;

class Program
{
    static async Task Main(string[] args)
    {
        string url = "https://wts-info-api.tossinvest.com/api/v2/stock-prices?codes=A322000";

        using (HttpClient client = new HttpClient())
        {
            try
            {
                HttpResponseMessage response = await client.GetAsync(url);
                response.EnsureSuccessStatusCode();

                string responseBody = await response.Content.ReadAsStringAsync();
                JObject json = JObject.Parse(responseBody);

                // Assuming the JSON has a specific structure. Adjust as necessary.
                var prices = json["prices"];
                foreach (var price in prices)
                {
                    Console.WriteLine($"Code: {price["code"]}, Price: {price["price"]}");
                }
            }
            catch (HttpRequestException e)
            {
                Console.WriteLine("Request error: " + e.Message);
            }
        }
    }
}
```

### Explanation

1. **HTTP Request:**
   - `HttpClient` is used to make an asynchronous GET request to the API URL.
   - `response.EnsureSuccessStatusCode()` checks if the request was successful.

2. **Parse JSON:**
   - `response.Content.ReadAsStringAsync()` reads the response body as a string.
   - `JObject.Parse(responseBody)` parses the JSON string into a `JObject`.

3. **Display Data:**
   - The code assumes that the JSON has an array named "prices" and iterates through it to print each stock code and price.

Make sure you have the `Newtonsoft.Json` package installed, which you can add via NuGet Package Manager:

```shall
Install-Package Newtonsoft.Json
```

This code fetches the stock prices and prints them to the console. Adjust the JSON parsing as necessary based on the actual structure of the API response.

### 참고사항

종목 정보

- [미국주식](https://wts-info-api.tossinvest.com/api/v2/stock-infos?codes=NAS0230309002)
- [한국주식](https://wts-info-api.tossinvest.com/api/v2/stock-infos?codes=A322000)

가격 정보

- [미국주식](https://wts-info-api.tossinvest.com/api/v2/stock-prices?codes=AMX0221122003)
- [한국주식](https://wts-info-api.tossinvest.com/api/v2/stock-prices?codes=A322000)
