---
layout: posts
comments: true
title : " 2024-07-19 OPCUA 와 OPCDA 차이점 "
categories: ETC
tags: [ GPT ]
published: false
---

OPC UA (OPC Unified Architecture) and OPC DA (OPC Data Access) are both standards for industrial communication, developed by the OPC Foundation. They are used to facilitate communication between various devices and software in industrial automation systems. However, they differ significantly in their architecture, capabilities, and underlying technologies. Here are the key differences:

### OPC DA (Data Access)

1. **Legacy Technology**:
   - **Introduced**: In the mid-1990s.
   - **Based on**: Microsoft COM/DCOM (Component Object Model/Distributed Component Object Model).

2. **Architecture**:
   - **Client-Server Model**: A client requests data from a server which holds the process data.
   - **Platform Dependency**: Highly dependent on Windows operating system due to its reliance on COM/DCOM.

3. **Data Types and Access**:
   - **Data Focus**: Primarily focused on real-time data access (current data).
   - **Simplicity**: Simplified access to real-time data values, typically used for acquiring current values of sensors, actuators, and control points.

4. **Security**:
   - **Limited Security**: Basic security measures provided by DCOM, which are often considered insufficient by modern standards.

5. **Communication**:
   - **Network Dependency**: Primarily operates within local networks due to limitations of DCOM over wide-area networks.

### OPC UA (Unified Architecture)

1. **Modern Technology**:
   - **Introduced**: Mid-2000s as a successor to OPC Classic standards (including OPC DA).
   - **Based on**: A platform-independent, service-oriented architecture (SOA).

2. **Architecture**:
   - **Client-Server and Pub-Sub Models**: Supports both client-server interactions and publisher-subscriber models for data distribution.
   - **Platform Independence**: Designed to be platform-independent, can run on Windows, Linux, and other operating systems.
   - **Scalability**: Suitable for small devices (like sensors) to large systems (like SCADA).

3. **Data Types and Access**:
   - **Comprehensive Data Access**: Provides real-time data, historical data, and event notifications.
   - **Complex Data Types**: Supports a wide range of data types including complex structures, alarms, and conditions.
   - **Information Modeling**: Allows for sophisticated information modeling and supports standard and custom data models.

4. **Security**:
   - **Advanced Security**: Includes built-in security features such as encryption, authentication, and auditability. Utilizes modern security standards like TLS (Transport Layer Security) and certificates.

5. **Communication**:
   - **Interoperability**: Designed for seamless communication over local networks, the internet, and enterprise networks.
   - **Transport Protocols**: Supports multiple transport protocols including TCP, HTTP, and HTTPS, making it suitable for a wide range of network configurations.

### Summary of Key Differences

1. **Technological Foundation**:
   - OPC DA is based on COM/DCOM, while OPC UA is based on a platform-independent service-oriented architecture.

2. **Platform Dependency**:
   - OPC DA is limited to Windows, whereas OPC UA is platform-independent.

3. **Data Handling**:
   - OPC DA focuses on real-time data access. OPC UA handles real-time data, historical data, and events, supporting complex data types and information modeling.

4. **Security**:
   - OPC DA has limited security features. OPC UA offers comprehensive security including encryption and authentication.

5. **Communication Flexibility**:
   - OPC DA is typically used within local networks. OPC UA supports communication over local networks, the internet, and enterprise networks with multiple transport protocols.

In conclusion, OPC UA is a more modern, secure, and flexible standard compared to OPC DA. It is designed to meet the requirements of contemporary industrial automation systems, providing a robust framework for communication across diverse platforms and environments.

OPC UA(OPC 통합 아키텍처)와 OPC DA(OPC 데이터 액세스)는 모두 OPC 재단에서 개발한 산업용 통신 표준입니다.
이는 산업 자동화 시스템의 다양한 장치와 소프트웨어 간의 통신을 촉진하는 데 사용됩니다. 그러나 아키텍처, 기능 및 기본 기술은 크게 다릅니다. 주요 차이점은 다음과 같습니다.

OPC DA(데이터 액세스)
기존 기술:

도입: 1990년대 중반.
기준: Microsoft COM/DCOM(구성 요소 개체 모델/분산 구성 요소 개체 모델).
아키텍처:

클라이언트-서버 모델: 클라이언트는 프로세스 데이터를 보유하고 있는 서버에 데이터를 요청합니다.
플랫폼 종속성: COM/DCOM에 의존하기 때문에 Windows 운영 체제에 대한 의존도가 높습니다.
데이터 유형 및 액세스:

데이터 초점: 주로 실시간 데이터 액세스(현재 데이터)에 중점을 둡니다.
단순성: 일반적으로 센서, 액추에이터 및 제어점의 현재 값을 획득하는 데 사용되는 실시간 데이터 값에 대한 단순화된 액세스입니다.
보안:

제한된 보안: DCOM에서 제공하는 기본 보안 조치로, 현대 표준에서는 종종 불충분하다고 간주됩니다.
커뮤니케이션:

네트워크 종속성: 광역 네트워크에 대한 DCOM의 제한으로 인해 주로 로컬 네트워크 내에서 작동합니다.
OPC UA(통합 아키텍처)
현대 기술:

도입: OPC Classic 표준(OPC DA 포함)의 후속 제품으로 2000년대 중반.
기반: 플랫폼 독립적인 서비스 지향 아키텍처(SOA).
아키텍처:

클라이언트-서버 및 게시-구독 모델: 데이터 배포를 위해 클라이언트-서버 상호 작용과 게시자-구독자 모델을 모두 지원합니다.
플랫폼 독립성: 플랫폼 독립적으로 설계되었으며 Windows, Linux 및 기타 운영 체제에서 실행될 수 있습니다.
확장성: 소형 장치(예: 센서)부터 대규모 시스템(예: SCADA)까지 적합합니다.
데이터 유형 및 액세스:

포괄적인 데이터 액세스: 실시간 데이터, 기록 데이터 및 이벤트 알림을 제공합니다.
복잡한 데이터 유형: 복잡한 구조, 경보 및 조건을 포함한 광범위한 데이터 유형을 지원합니다.
정보 모델링: 정교한 정보 모델링이 가능하고 표준 및 사용자 정의 데이터 모델을 지원합니다.
보안:

고급 보안: 암호화, 인증, 감사 기능과 같은 보안 기능이 내장되어 있습니다. TLS(전송 계층 보안) 및 인증서와 같은 최신 보안 표준을 활용합니다.
커뮤니케이션:

상호 운용성: 로컬 네트워크, 인터넷 및 기업 네트워크를 통한 원활한 통신을 위해 설계되었습니다.
전송 프로토콜: TCP, HTTP, HTTPS를 포함한 여러 전송 프로토콜을 지원하므로 광범위한 네트워크 구성에 적합합니다.
주요 차이점 요약
기술 기반:

OPC DA는 COM/DCOM을 기반으로 하는 반면, OPC UA는 플랫폼 독립적인 서비스 지향 아키텍처를 기반으로 합니다.
플랫폼 종속성:

OPC DA는 Windows로 제한되는 반면, OPC UA는 플랫폼 독립적입니다.
데이터 처리:

OPC DA는 실시간 데이터 액세스에 중점을 둡니다. OPC UA는 실시간 데이터, 기록 데이터 및 이벤트를 처리하고 복잡한 데이터 유형과 정보 모델링을 지원합니다.
보안:

OPC DA에는 보안 기능이 제한되어 있습니다. OPC UA는 암호화 및 인증을 포함한 포괄적인 보안을 제공합니다.
커뮤니케이션 유연성:

OPC DA는 일반적으로 로컬 네트워크 내에서 사용됩니다. OPC UA는 여러 전송 프로토콜을 사용하여 로컬 네트워크, 인터넷 및 기업 네트워크를 통한 통신을 지원합니다.
결론적으로 OPC UA는 OPC DA에 비해 더 현대적이고 안전하며 유연한 표준입니다. 이는 현대 산업 자동화 시스템의 요구 사항을 충족하도록 설계되어 다양한 플랫폼과 환경에서 통신할 수 있는 강력한 프레임워크를 제공합니다.
