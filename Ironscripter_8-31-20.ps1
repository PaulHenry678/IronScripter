function Find-MissingSide {
    param (
        [Parameter(ParameterSetName = "LegA/Hypotenuse")]
        [Parameter(ParameterSetName = "Leg/Leg")]
        [double]$LegA,
        [Parameter(ParameterSetName = "LegB/Hypotenuse")]
        [Parameter(ParameterSetName = "Leg/Leg")]
        [double]$LegB,
        [Parameter(ParameterSetName = "LegA/Hypotenuse")]
        [Parameter(ParameterSetName = "LegB/Hypotenuse")]
        [double]$Hypotenuse
    )

    switch ($PSCmdlet.ParameterSetName) {
        "LegA/Hypotenuse" {
            $LegB = [math]::Sqrt([math]::Pow($Hypotenuse,2) - [math]::Pow($LegA,2))
            BREAK    
        }
        "LegB/Hypotenuse" {
            $LegA = [math]::Sqrt([math]::Pow($Hypotenuse,2) - [math]::Pow($LegB,2))
            BREAK
        }
        Default {
            $hypotenuse = [math]::Sqrt([math]::Pow($LegA,2) + [math]::Pow($LegB,2))
            BREAK
        }
    }

    RETURN "LegA is $LegA, LegB is $LegB, and the hypotenuse is $([math]::Round($hypotenuse,2))"
}

function Find-CircleArea {
    param(
        [decimal]$diameter
    )

    $Area = ([math]::Pow($diameter/2,2)) * [math]::PI

    RETURN "The area of a circle of diameter $diameter is $([math]::Round($Area))"

}

function Find-SphereVolume {
    param(
        [decimal]$diameter
    )

    $Volume = (4/3)*([math]::Pi)*([math]::Pow($diameter/2,3))

    RETURN "The volume of a sphere of diameter $diameter is $([math]::Round($volume))"
}

function Find-CylinderVolume {
    param(
        [decimal]$diameter,
        [decimal]$height
    )

    $Volume = (([math]::Pow($diameter/2,2)) * [math]::PI) * $height

    RETURN "The volume of a cylinder of diameter $diameter and height $height is $([math]::Round($volume))"

}

function Find-Factorial {
    param(
        [int]$input
    )
    [int]$result = 1

    switch ($input){
        0 {
            BREAK
        }
        1 {
            BREAK
        }
        default {
            
        }
    }

}