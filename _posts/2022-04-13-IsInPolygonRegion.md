---
layout: posts
comments: true
title : "Is a Point in Polygon Region?"
categories: Development
tags: [C#]
published: true
---

### 특정한 점이 지정된 Polygon 안에 있는 지 여부 확인 방법

왜 Cognex 에는 이런 method 가 지원되지 않는거냐?

[원문은 여기에...](https://wrf.ecse.rpi.edu/Research/Short_Notes/pnpoly.html)

[WIKIPEDIA 내용](https://en.wikipedia.org/wiki/Point_in_polygon)

```csharp

public bool IsPointInPolygon( Point p, Point[] polygon )
{
    double minX = polygon[ 0 ].X;
    double maxX = polygon[ 0 ].X;
    double minY = polygon[ 0 ].Y;
    double maxY = polygon[ 0 ].Y;
    for ( int i = 1 ; i < polygon.Length ; i++ )
    {
        Point q = polygon[ i ];
        minX = Math.Min( q.X, minX );
        maxX = Math.Max( q.X, maxX );
        minY = Math.Min( q.Y, minY );
        maxY = Math.Max( q.Y, maxY );
    }

    if ( p.X < minX || p.X > maxX || p.Y < minY || p.Y > maxY )
    {
        return false;
    }
    
    bool inside = false;
    for ( int i = 0, j = polygon.Length - 1 ; i < polygon.Length ; j = i++ )
    {
        if ( ( polygon[ i ].Y > p.Y ) != ( polygon[ j ].Y > p.Y ) &&
             p.X < ( polygon[ j ].X - polygon[ i ].X ) * ( p.Y - polygon[ i ].Y ) / ( polygon[ j ].Y - polygon[ i ].Y ) + polygon[ i ].X )
        {
            inside = !inside;
        }
    }

    return inside;
}

```
---

CogRectangleAffine 을 Polygon 화 하는 방법? -> 영역 자체를 Polygon 으로 변경해야 할 듯.

---
