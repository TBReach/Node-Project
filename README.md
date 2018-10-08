# Node-Project
- The Node communicates with BD MGIT using a serial to WiFi adapter - PUCK232. <br />
- The MGIT has to be in LIS mode, which has to be configured in settings. <br />
- The test status data are automatically uploaded when a new test is added to the drawer <br />
  - MGIT960 has 3 drawers, MGIT320 has 1.
- The scripts in Node convert data from MGIT into csv files and upload to a configurable server. <br />


## Enabling communication from the node
- Make the scripts executable. <br />
- Update the port in the openCommunicationMgit.sh file with the port used by the puck to communicate. <br />
- Execute the script openCommunicationMgit.sh with sudo and the puck IP as parameter <br />
- To stop the communication process press Ctrl + C <br />
