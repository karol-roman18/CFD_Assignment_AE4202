extractVal()
{
    if [ -f "$2" ]
    then
        foamDictionary -entry "$1" -value "$2" | \
            sed -n '/(/,/)/{ s/[()]//g; /^ *$/d; p}' \
            > "$3"
    else
        # Or some other tag?
        echo "Not such file: $2" 1>&2
        echo "0" > "$3"
    fi
}
        timeDir=$(foamListTimes -latestTime)

        # Create datasets for benchmark comparisons
        extractVal boundaryField.Wing.value "$timeDir/Cx" "Cx.$$"
        extractVal boundaryField.Wing.value "$timeDir/wallShearStress" "tau.$$"
        extractVal boundaryField.Wing.value "$timeDir/Cp" "cp.$$"
        extractVal boundaryField.Wing.value "$timeDir/yPlus" "yplus.$$"

        echo "# ccx tau_xx tau_yy tau_zz cp yplus" > profiles.dat
        paste -d ' ' Cx.$$ tau.$$ cp.$$ yplus.$$ >> profiles.dat
        rm -f Cx.$$ tau.$$ cp.$$ uplus.$$

