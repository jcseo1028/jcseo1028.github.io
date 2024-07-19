---
layout: posts
comments: true
title : " 2024-07-16 OPCUA 노드 추가 방법 "
categories: ETC
tags: [ GPT ]
published: false
---

Sure! Let's go through the steps in more detail for adding an array node to an OPC UA server using the UA-.NET Standard library in C#.

### 1. Set Up the Project

First, you need to set up a C# project and include the UA-.NET Standard library. You can do this by installing the necessary NuGet packages:

```shell
dotnet add package Opc.Ua.Core
dotnet add package Opc.Ua.Server
dotnet add package Opc.Ua.Client
```

### 2. Initialize the Server

Create a new class for your OPC UA server. This will involve setting up the server configuration and starting the server.

```csharp
using Opc.Ua;
using Opc.Ua.Configuration;
using Opc.Ua.Server;
using System;
using System.Threading;
using System.Threading.Tasks;

class Program
{
    static async Task Main(string[] args)
    {
        ApplicationInstance application = new ApplicationInstance
        {
            ApplicationName = "UA Server",
            ApplicationType = ApplicationType.Server,
            ConfigSectionName = "Opc.Ua.Server"
        };

        // Load the application configuration
        ApplicationConfiguration config = await application.LoadApplicationConfiguration(false);

        // Check the application certificate
        bool haveAppCertificate = await application.CheckApplicationInstanceCertificate(false, 0);
        if (!haveAppCertificate)
        {
            throw new Exception("Application instance certificate invalid!");
        }

        // Start the server
        application.ApplicationConfiguration.CertificateValidator.CertificateValidation += (s, e) =>
        {
            e.Accept = (e.Error.StatusCode == StatusCodes.BadCertificateUntrusted);
        };

        // Create the server instance
        MyOpcServer server = new MyOpcServer();
        await application.Start(server);

        Console.WriteLine("Server started. Press Ctrl-C to exit...");
        ManualResetEvent quitEvent = new ManualResetEvent(false);
        Console.CancelKeyPress += (sender, eArgs) => { quitEvent.Set(); eArgs.Cancel = true; };
        quitEvent.WaitOne();

        Console.WriteLine("Server stopped.");
    }
}
```

### 3. Define the Custom Node Manager

Create a custom node manager to define the nodes and their values. In this case, we will add an array node.

```csharp
using Opc.Ua;
using Opc.Ua.Server;
using System.Collections.Generic;

public class MyNodeManager : CustomNodeManager2
{
    public MyNodeManager(IServerInternal server, ApplicationConfiguration configuration)
        : base(server, configuration, "urn:yourdomain:yourservernamespace")
    {
    }

    protected override NodeStateCollection LoadPredefinedNodes(ISystemContext context)
    {
        NodeStateCollection predefinedNodes = new NodeStateCollection();

        // Define the array data
        int[] arrayValues = new int[] { 1, 2, 3, 4, 5 };

        // Create a new variable node with array data
        BaseDataVariableState arrayNode = new BaseDataVariableState(null)
        {
            NodeId = new NodeId("ArrayNode", NamespaceIndex),
            BrowseName = new QualifiedName("ArrayNode", NamespaceIndex),
            DisplayName = new LocalizedText("Array Node"),
            DataType = DataTypeIds.Int32,
            ValueRank = ValueRanks.OneDimension,
            AccessLevel = AccessLevels.CurrentReadOrWrite,
            UserAccessLevel = AccessLevels.CurrentReadOrWrite,
            Value = arrayValues
        };

        // Add the new node to the predefined nodes collection
        predefinedNodes.Add(arrayNode);

        // Optionally, add the node to the Objects folder
        AddPredefinedNode(SystemContext, predefinedNodes, arrayNode);

        return predefinedNodes;
    }
}
```

### 4. Implement the Server Class

Implement the OPC UA server class to utilize the custom node manager.

```csharp
using Opc.Ua;
using Opc.Ua.Server;
using System.Collections.Generic;

public class MyOpcServer : StandardServer
{
    protected override MasterNodeManager CreateMasterNodeManager(IServerInternal server, ApplicationConfiguration configuration)
    {
        IList<INodeManager> nodeManagers = new List<INodeManager>
        {
            new MyNodeManager(server, configuration)
        };

        return new MasterNodeManager(server, configuration, null, nodeManagers.ToArray());
    }

    protected override void OnServerStarting(IServerInternal server)
    {
        base.OnServerStarting(server);

        // Set the namespaces for the server
        server.NamespaceUris.Append("urn:yourdomain:yourservernamespace");
    }
}
```

### 5. Running the Server

Compile and run your project. The server will start and host an array node with the specified values. You can then use an OPC UA client to connect to your server and read the array node.

#### Full Example Code

Putting it all together, here's a simplified version of the entire setup:

#### Program.cs

```csharp
using Opc.Ua;
using Opc.Ua.Configuration;
using Opc.Ua.Server;
using System;
using System.Threading;
using System.Threading.Tasks;

class Program
{
    static async Task Main(string[] args)
    {
        ApplicationInstance application = new ApplicationInstance
        {
            ApplicationName = "UA Server",
            ApplicationType = ApplicationType.Server,
            ConfigSectionName = "Opc.Ua.Server"
        };

        ApplicationConfiguration config = await application.LoadApplicationConfiguration(false);

        bool haveAppCertificate = await application.CheckApplicationInstanceCertificate(false, 0);
        if (!haveAppCertificate)
        {
            throw new Exception("Application instance certificate invalid!");
        }

        application.ApplicationConfiguration.CertificateValidator.CertificateValidation += (s, e) =>
        {
            e.Accept = (e.Error.StatusCode == StatusCodes.BadCertificateUntrusted);
        };

        MyOpcServer server = new MyOpcServer();
        await application.Start(server);

        Console.WriteLine("Server started. Press Ctrl-C to exit...");
        ManualResetEvent quitEvent = new ManualResetEvent(false);
        Console.CancelKeyPress += (sender, eArgs) => { quitEvent.Set(); eArgs.Cancel = true; };
        quitEvent.WaitOne();

        Console.WriteLine("Server stopped.");
    }
}
```

#### MyNodeManager.cs

```csharp
using Opc.Ua;
using Opc.Ua.Server;
using System.Collections.Generic;

public class MyNodeManager : CustomNodeManager2
{
    public MyNodeManager(IServerInternal server, ApplicationConfiguration configuration)
        : base(server, configuration, "urn:yourdomain:yourservernamespace")
    {
    }

    protected override NodeStateCollection LoadPredefinedNodes(ISystemContext context)
    {
        NodeStateCollection predefinedNodes = new NodeStateCollection();

        int[] arrayValues = new int[] { 1, 2, 3, 4, 5 };

        BaseDataVariableState arrayNode = new BaseDataVariableState(null)
        {
            NodeId = new NodeId("ArrayNode", NamespaceIndex),
            BrowseName = new QualifiedName("ArrayNode", NamespaceIndex),
            DisplayName = new LocalizedText("Array Node"),
            DataType = DataTypeIds.Int32,
            ValueRank = ValueRanks.OneDimension,
            AccessLevel = AccessLevels.CurrentReadOrWrite,
            UserAccessLevel = AccessLevels.CurrentReadOrWrite,
            Value = arrayValues
        };

        predefinedNodes.Add(arrayNode);
        AddPredefinedNode(SystemContext, predefinedNodes, arrayNode);

        return predefinedNodes;
    }
}
```

#### MyOpcServer.cs

```csharp
using Opc.Ua;
using Opc.Ua.Server;
using System.Collections.Generic;

public class MyOpcServer : StandardServer
{
    protected override MasterNodeManager CreateMasterNodeManager(IServerInternal server, ApplicationConfiguration configuration)
    {
        IList<INodeManager> nodeManagers = new List<INodeManager>
        {
            new MyNodeManager(server, configuration)
        };

        return new MasterNodeManager(server, configuration, null, nodeManagers.ToArray());
    }

    protected override void OnServerStarting(IServerInternal server)
    {
        base.OnServerStarting(server);
        server.NamespaceUris.Append("urn:yourdomain:yourservernamespace");
    }
}
```

With this setup, your OPC UA server will have an array node that clients can read. Adjust the namespaces, NodeId, and array values to fit your specific use case.

Yes, we can automate the process a bit more by creating a utility method to add array nodes to the OPC UA server. This utility method can be called with different parameters to add various array nodes as needed. Here is an enhanced version of the code that includes such a utility method.

### Utility Method for Adding Array Nodes

First, let's create a utility method in the `MyNodeManager` class that simplifies the process of adding an array node.

#### MyNodeManager.cs (Updated)

```csharp
using Opc.Ua;
using Opc.Ua.Server;
using System.Collections.Generic;

public class MyNodeManager : CustomNodeManager2
{
    public MyNodeManager(IServerInternal server, ApplicationConfiguration configuration)
        : base(server, configuration, "urn:yourdomain:yourservernamespace")
    {
    }

    protected override NodeStateCollection LoadPredefinedNodes(ISystemContext context)
    {
        NodeStateCollection predefinedNodes = new NodeStateCollection();
        
        // Example usage of the utility method to add an array node
        AddArrayNode<int>(predefinedNodes, "ArrayNode1", "Array Node 1", new int[] { 1, 2, 3, 4, 5 }, DataTypeIds.Int32);
        
        return predefinedNodes;
    }

    private void AddArrayNode<T>(NodeStateCollection predefinedNodes, string nodeIdString, string displayName, T[] arrayValues, NodeId dataTypeId)
    {
        // Create a new variable node with array data
        BaseDataVariableState arrayNode = new BaseDataVariableState(null)
        {
            NodeId = new NodeId(nodeIdString, NamespaceIndex),
            BrowseName = new QualifiedName(nodeIdString, NamespaceIndex),
            DisplayName = new LocalizedText(displayName),
            DataType = dataTypeId,
            ValueRank = ValueRanks.OneDimension,
            AccessLevel = AccessLevels.CurrentReadOrWrite,
            UserAccessLevel = AccessLevels.CurrentReadOrWrite,
            Value = arrayValues
        };

        // Add the new node to the predefined nodes collection
        predefinedNodes.Add(arrayNode);

        // Optionally, add the node to the Objects folder
        AddPredefinedNode(SystemContext, predefinedNodes, arrayNode);
    }
}
```

### Modified Server Class

You can now call the `AddArrayNode` method with different parameters to add various array nodes.

#### Program.cs (Updated)

```csharp
using Opc.Ua;
using Opc.Ua.Configuration;
using Opc.Ua.Server;
using System;
using System.Threading;
using System.Threading.Tasks;

class Program
{
    static async Task Main(string[] args)
    {
        ApplicationInstance application = new ApplicationInstance
        {
            ApplicationName = "UA Server",
            ApplicationType = ApplicationType.Server,
            ConfigSectionName = "Opc.Ua.Server"
        };

        ApplicationConfiguration config = await application.LoadApplicationConfiguration(false);

        bool haveAppCertificate = await application.CheckApplicationInstanceCertificate(false, 0);
        if (!haveAppCertificate)
        {
            throw new Exception("Application instance certificate invalid!");
        }

        application.ApplicationConfiguration.CertificateValidator.CertificateValidation += (s, e) =>
        {
            e.Accept = (e.Error.StatusCode == StatusCodes.BadCertificateUntrusted);
        };

        MyOpcServer server = new MyOpcServer();
        await application.Start(server);

        Console.WriteLine("Server started. Press Ctrl-C to exit...");
        ManualResetEvent quitEvent = new ManualResetEvent(false);
        Console.CancelKeyPress += (sender, eArgs) => { quitEvent.Set(); eArgs.Cancel = true; };
        quitEvent.WaitOne();

        Console.WriteLine("Server stopped.");
    }
}
```

#### MyOpcServer.cs (Updated)

```csharp
using Opc.Ua;
using Opc.Ua.Server;
using System.Collections.Generic;

public class MyOpcServer : StandardServer
{
    protected override MasterNodeManager CreateMasterNodeManager(IServerInternal server, ApplicationConfiguration configuration)
    {
        IList<INodeManager> nodeManagers = new List<INodeManager>
        {
            new MyNodeManager(server, configuration)
        };

        return new MasterNodeManager(server, configuration, null, nodeManagers.ToArray());
    }

    protected override void OnServerStarting(IServerInternal server)
    {
        base.OnServerStarting(server);
        server.NamespaceUris.Append("urn:yourdomain:yourservernamespace");
    }
}
```

### Adding More Array Nodes

To add more array nodes, simply call the `AddArrayNode` method with different parameters within the `LoadPredefinedNodes` method:

```csharp
protected override NodeStateCollection LoadPredefinedNodes(ISystemContext context)
{
    NodeStateCollection predefinedNodes = new NodeStateCollection();
    
    // Example usage of the utility method to add various array nodes
    AddArrayNode<int>(predefinedNodes, "ArrayNode1", "Array Node 1", new int[] { 1, 2, 3, 4, 5 }, DataTypeIds.Int32);
    AddArrayNode<double>(predefinedNodes, "ArrayNode2", "Array Node 2", new double[] { 1.1, 2.2, 3.3 }, DataTypeIds.Double);
    AddArrayNode<string>(predefinedNodes, "ArrayNode3", "Array Node 3", new string[] { "one", "two", "three" }, DataTypeIds.String);

    return predefinedNodes;
}
```

### Summary

By using the `AddArrayNode` utility method, you can easily add multiple array nodes to your OPC UA server with different data types and values. This makes the code more modular and reusable, allowing you to add new nodes with minimal changes.
