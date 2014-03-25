LEAKYBUCKET
===========

LeakyBucket is a clone of storage and data such as Dropbox, OneDrive, googledrive box and sharing tools .

Description of the activity
The design LeakyBucket as distributed backup tool should include 3 major components:
# Monitoring - Detection of changes to the local file system.
# Remote Storage - Transmission of data stored locally to the server. Access to data stored remotely.
# Synchronization and conflict resolution - Definition of differences between local and remotely stored data.

Two concerns are important in the design of this system. 
First, it must be reliable; latest copies of files can 
not be exchanged for older copies. Second, it needs to 
be efficient: avoid, insofar as possible, unnecessary 
transfer and remote storage. Obviously, there are other 
concerns including, for example, security: it is not 
desirable that your data is accessed by another person 
if you have not given permission to do so.
