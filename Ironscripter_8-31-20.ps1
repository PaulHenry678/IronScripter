function Find-MissingSide {
    param (
        [Parameter(Mandatory=$true,ParameterSetName = "LegA/Hypotenuse")]
        [Parameter(Mandatory=$true,ParameterSetName = "Leg/Leg")]
        [ValidateRange(1,[int]::MaxValue)]
        [ValidateNotNull()]
        [double]$LegA,
        [Parameter(Mandatory=$true,ParameterSetName = "LegB/Hypotenuse")]
        [Parameter(Mandatory=$true,ParameterSetName = "Leg/Leg")]
        [ValidateRange(1,[int]::MaxValue)]
        [ValidateNotNull()]
        [double]$LegB,
        [Parameter(Mandatory=$true,ParameterSetName = "LegA/Hypotenuse")]
        [Parameter(Mandatory=$true,ParameterSetName = "LegB/Hypotenuse")]
        [ValidateRange(1,[int]::MaxValue)]
        [ValidateNotNull()]
        [double]$Hypotenuse,
        [switch]$ObjectOut
    )

    # This function assumes that the triangle is a right triangle.



    switch ($PSCmdlet.ParameterSetName) {
        "LegA/Hypotenuse" {
            IF($legA -gt $Hypotenuse){
                RETURN "The Hypotenuse cannot be larger than a leg."
            }else{
            $LegB = [math]::Sqrt([math]::Pow($Hypotenuse,2) - [math]::Pow($LegA,2))
            BREAK   
            } 
        }
        "LegB/Hypotenuse" {
            IF($legB -gt $Hypotenuse){
                RETURN "The Hypotenuse cannot be larger than a leg."
            }else{
            $LegA = [math]::Sqrt([math]::Pow($Hypotenuse,2) - [math]::Pow($LegB,2))
            BREAK
            }
        }
        "Leg/Leg" {
            $hypotenuse = [math]::Sqrt([math]::Pow($LegA,2) + [math]::Pow($LegB,2))
            BREAK
        }
        Default {

        }
    }

    IF($ObjectOut){

        $objectProperties = @{
            FirstLeg    = $LegA
            SecondLeg   = $LegB
            Hypotenuse  = $hypotenuse
        }

        $ReportingObject = New-Object -TypeName PSObject -Property $objectProperties

        RETURN $ReportingObject | Select-object FirstLeg,SecondLeg,Hypotenuse
    }else {
        RETURN "LegA is $LegA, LegB is $LegB, and the hypotenuse is $([math]::Round($hypotenuse,2))"
    }

}

function Find-CircleArea {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateRange(0,[int]::MaxValue)]
        [ValidateNotNull()]
        [decimal]$diameter,
        [switch]$ObjectOut
    )

    $Area = ([math]::Pow($diameter/2,2)) * [math]::PI
    IF($ObjectOut){

        $objectProperties = @{
            Diameter    = $diameter
            Area        = $Area
        }

        $ReportingObject = New-Object -TypeName PSObject -Property $objectProperties

        RETURN $ReportingObject | Select-object Diameter,Area
    }else {
    RETURN "The area of a circle of diameter $diameter is $([math]::Round($Area,2))"
    }
}

function Find-SphereVolume {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateRange(0,[int]::MaxValue)]
        [ValidateNotNull()]
        [decimal]$diameter,
        [switch]$ObjectOut
    )

    $Volume = (4/3)*([math]::Pi)*([math]::Pow($diameter/2,3))
    IF($ObjectOut){

        $objectProperties = @{
            Diameter    = $diameter
            Volume      = $Volume
        }

        $ReportingObject = New-Object -TypeName PSObject -Property $objectProperties

        RETURN $ReportingObject | Select-object Diameter,Volume
    }else {
    RETURN "The volume of a sphere of diameter $diameter is $([math]::Round($volume))"
    }
}

function Find-CylinderVolume {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateRange(0,[int]::MaxValue)]
        [ValidateNotNull()]
        [decimal]$diameter,
        [Parameter(Mandatory=$true)]
        [ValidateRange(0,[int]::MaxValue)]
        [ValidateNotNull()]
        [decimal]$height,
        [switch]$ObjectOut
    )

    $Volume = (([math]::Pow($diameter/2,2)) * [math]::PI) * $height

    IF($ObjectOut){

        $objectProperties = @{
            Diameter    = $diameter
            Height      = $height
            Volume      = $Volume
        }

        $ReportingObject = New-Object -TypeName PSObject -Property $objectProperties

        RETURN $ReportingObject | Select-object Diameter,Height,Volume
    }else {
    RETURN "The volume of a cylinder of diameter $diameter and height $height is $([math]::Round($volume))"
    }
}

function Find-Factorial {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateRange(0,[int]::MaxValue)]
        [ValidateNotNull()]
        [int]$value
    )
    [int]$result = 1

IF($value -gt 1){
    for($i=1; $i -le $value; $i++){
        $result = $result * $i
    }
}

    RETURN "$value! is $($result)"

}