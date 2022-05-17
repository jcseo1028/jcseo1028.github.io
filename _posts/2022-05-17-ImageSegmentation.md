---
layout: posts
comments: true
title : "Image Segmentation 방법에 대해 "
categories: Development
tags: [ ImageProcessing, C#, opencv, Cognex, python ]
published: false
---

### Image Segmentation using Watershed Algorithm 참고 사이트

[Image Segmenation with Watershed Algorithm using opencv](https://docs.opencv.org/4.x/d3/db4/tutorial_py_watershed.html)

[python 정리 예제](https://blog.naver.com/zeus05100/221810856536)


### Cognex 적용

Cognex 에서는 Blob Tool 의 Morphology 를 이용하면 될 듯 하다.

```csharp
PT_BlobTools[m_PatNo, i].RunParams.MorphologyOperations.Add(CogBlobMorphologyConstants.DilateSquare);
```

Image 의 크기에 따라 횟수가 많아지는 부분에 대한 추후 재검토가 필요하다.

KTG 는 걍 마크로 해도 될 거 같다고 하네...

