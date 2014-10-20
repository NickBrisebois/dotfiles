    #!/bin/sh

        A=0;
            F="0.1"

                while true; do

                        [ $A == 628318 ] && A=0 || A=$((A + 1))

                            R=$(echo "s ($F*$A + 0)*127 + 128" | bc -l | cut -d'.' -f1)
                                B=$(echo "s ($F*$A + 2)*127 + 128" | bc -l | cut -d'.' -f1)
                                    G=$(echo "s ($F*$A + 4)*127 + 128" | bc -l | cut -d'.' -f1)

                                        printf "\033]10;#%02x%02x%02x\007" $R $B $G

                                            sleep 0.01
                                                done
