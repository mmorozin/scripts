#!/bin/bash
echo "Node disk check"


function testHpNode {
echo "testing $1:"
ssh root@$1 "hpacucli ctrl slot=$2 pd all show status" | sed  '/^$/d'
#echo $?
}

function testIbmNode {
echo "testing $1:"
ssh root@$1 /opt/MegaRAID/MegaCli/MegaCli64 -ShowSummary -aALL | awk '/Hardware/,/Storage/' | grep -e Connector -e "State              :" | awk 'NR%2{printf "%s ",$0;next;}1'
#echo $?
}

function testIbmJenkinsNode {
echo "testing $1:"
ssh root@$1 /opt/bin/megacli -ShowSummary -aALL | awk '/Hardware/,/Storage/' | grep -e Connector -e "State              :" | awk 'NR%2{printf "%s ",$0;next;}1'
}

echo "HP Node disk check"
testHpNode tnm-load-1k 0
testHpNode tnm-load-5k 0
testHpNode tnm-load-10k 0
testHpNode tnm-files 1
#testnode tnm-virtmimic ##Not working at the moment :(
testHpNode tnm-vm1 1
testHpNode tnm-vm2 1

echo "IBM Node disk check"
testIbmNode tnm-vm3
testIbmNode tnm-vm4
testIbmNode tnm-vm5
testIbmNode tnm-vm6
testIbmNode tnm-vm7
testIbmNode tnm-load-reg
testIbmJenkinsNode sw-jenkins

