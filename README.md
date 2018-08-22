# Lab: Create Your First Blockchain Application

This journey will guide you through the following process.

1. Request access to the LinuxONE Community Cloud.
2. Create your Linux guest on the LinuxONE Community Cloud.
3. Setup and verify of your blockchain environment.
4. Create a blockchain project in Hyperledger Composer.
5. Interact with blockchain and third party APIs through Composer Rest Server.



## Application Overview

This blockchain journey is intended to give you a basic understanding  of how a developer would interact with Hyperledger Fabric using  Hyperledger Composer. In this workshop you will use a browser based UI  to modify chaincode, test your code and deploy your changes. You will  also learn how tooling can take the code and generate API to allow for application integration through a REST-ful interface.

This lab will be broken into three parts:

### Part 1 - Setting up your LinuxONE Community Cloud guest

1. Request access to LinuxONE Community Cloud.
2. Create your LinuxONE guest
3. Setup your Linux guest for Hyperledger Fabric and Hyperledger Composer
4. Verify the installation of Hyperledger Fabric and Hyperledger Composer

### Part 2 — Creating a blockchain application and generating API

1. Importing the components of your blockchain application
2. Modeling the participants
3. Modeling assets
4. Modeling our transactions
5. Checking the code
6. Deploy application to Hyperledger Fabric
7. Generating the API

### Part 3 — Interacting with Blockchain from an Application

1. Running our sample application
2. Test the sample app

---





# Part 1 - Setting up your LinuxONE Community Cloud guest

### Scenario Overview

For this journey, we will simulate a Internet of Things (IoT)-based Perishable Goods network. It is a business network involving:

- Perishable items such as bananas, pears, and coffee
- Business partners such as growers, shippers, and importers
- Shipments of perishable goods
- Agreements between business parties that stipulate conditions of the agreements
- Acknowledgement of receipt of goods and services

First, I want to tell you about the business problem that your first blockchain business network will solve: shipment of perishable goods. More importantly, how the Internet of Things, temperature sensors, and the Blockchain are used to ensure the perishables are shipped in ideal conditions (and what happens if not).

#### Request access to LinuxONE Community Cloud.

1. In a browser, go to <https://developer.ibm.com/linuxone/> .

   [![LinuxONE Community Cloud Page](https://github.com/IBM/hyperledger-fabric-on-linux-one/raw/master/images/CommunityCloudPage.png)](https://github.com/IBM/hyperledger-fabric-on-linux-one/blob/master/images/CommunityCloudPage.png)

2. **Click** *Start your trial now*.

   [![Click Start your trial now.](https://github.com/IBM/hyperledger-fabric-on-linux-one/raw/master/images/StartNow.png)](https://github.com/IBM/hyperledger-fabric-on-linux-one/blob/master/images/StartNow.png)

3. **Complete** the required fields on the page and **select** *Request your trial*.

   [![Complete application](https://github.com/IBM/hyperledger-fabric-on-linux-one/raw/master/images/GuestApplication.png)](https://github.com/IBM/hyperledger-fabric-on-linux-one/blob/master/images/GuestApplication.png)

4. You will come to the following page. **Click** *Sign In*.

   [![Click Sign In.](https://github.com/IBM/hyperledger-fabric-on-linux-one/raw/master/images/SignIn.png)](https://github.com/IBM/hyperledger-fabric-on-linux-one/blob/master/images/SignIn.png)

5. Check your email for a registration confirmation similar to the  following shown. You'll need your User ID and Password from this email  for the next step.

   [![Check your email for the registration confirmation email.](https://github.com/IBM/hyperledger-fabric-on-linux-one/raw/master/images/RegistrationConfirmationEmail.png)](https://github.com/IBM/hyperledger-fabric-on-linux-one/blob/master/images/RegistrationConfirmationEmail.png)

#### Create your LinuxONE guest

6. Back in your browser, **enter** the *user ID* and *password* from your email. **Click** *Sign in*.

   - Note: Now is a good time to change your password to one you'll  remember. This can be done after the initial sign in by selecting your  username from the upper right corner of the web page and selecting  account settings.

   [![Sign in to LinuxONE Community Cloud.](https://github.com/IBM/hyperledger-fabric-on-linux-one/raw/master/images/SignInUserIDPW.png)](https://github.com/IBM/hyperledger-fabric-on-linux-one/blob/master/images/SignInUserIDPW.png)

7. From the Home page of IBM LinuxONE Community Cloud, **select** *Manage Instances* on Virtual Servers under Infrastructure.

   [![Select Virtual Servers.](https://github.com/IBM/hyperledger-fabric-on-linux-one/raw/master/images/VirtualServers.png)](https://github.com/IBM/hyperledger-fabric-on-linux-one/blob/master/images/VirtualServers.png)

8. **Click** create.

   [![Click create.](https://github.com/IBM/hyperledger-fabric-on-linux-one/raw/master/images/Create.png)](https://github.com/IBM/hyperledger-fabric-on-linux-one/blob/master/images/Create.png)

9. Complete the following information:

   - Select *General purpose VM* for the type.

   - Enter an instance name — `DJBlockchain`

   - Enter an instance description — `Blockchain guest for Developers Journey.`

   - Select *SLES12 SP3* for the image.

   - Select *LinuxONE-Medium* for the flavor.

     [![Create your LinuxONE guest.](https://github.com/IBM/hyperledger-fabric-on-linux-one/raw/master/images/LinuxONEFields.png)](https://github.com/IBM/hyperledger-fabric-on-linux-one/blob/master/images/LinuxONEFields.png)

10. **Scroll down**. Under *Select a SSH Key Pair* **click** *create*.

[![Click create.](https://github.com/IBM/hyperledger-fabric-on-linux-one/raw/master/images/CreateKeyPair.png)](https://github.com/IBM/hyperledger-fabric-on-linux-one/blob/master/images/CreateKeyPair.png)

11. In the pop-up dialog, **enter** the key name, `DJBlockchain` and **select** *Create a new key pair*.

   [![Enter a key name and select create.](https://github.com/IBM/hyperledger-fabric-on-linux-one/raw/master/images/KeyPairName.png)](https://github.com/IBM/hyperledger-fabric-on-linux-one/blob/master/images/KeyPairName.png)

12. Depending on your computer, you may receive a prompt asking you if you would like to save the new key pair. If so, choose to **Save File**.

   [![Click Save File.](https://github.com/IBM/hyperledger-fabric-on-linux-one/raw/master/images/SaveFile.png)](https://github.com/IBM/hyperledger-fabric-on-linux-one/blob/master/images/SaveFile.png)

13. In the *Select a SSH Key Pair* box, **select** your newly create key pair, *DJBlockchain*.

   [![Select DJBlockchain.](https://github.com/IBM/hyperledger-fabric-on-linux-one/raw/master/images/SelectDJBlockchain.png)](https://github.com/IBM/hyperledger-fabric-on-linux-one/blob/master/images/SelectDJBlockchain.png)

14. Review the Current Selection information for accuracy and **click** *create* at the bottom of the screen to create your SLES 12 LinuxONE guest.

   [![Click create.](https://github.com/IBM/hyperledger-fabric-on-linux-one/raw/master/images/CreateGuest.png)](https://github.com/IBM/hyperledger-fabric-on-linux-one/blob/master/images/CreateGuest.png)

15. Watch the status of your newly create guest go through the following phases of start up:  networking ➡️ spawning ➡️ Active. When your guest shows active, it is ready for use.

   - *Note* — Write down the IP address of your guest. You'll need that for the next steps.

   [![Guest is ready!](https://github.com/IBM/hyperledger-fabric-on-linux-one/raw/master/images/StartedGuest.png)](https://github.com/IBM/hyperledger-fabric-on-linux-one/blob/master/images/StartedGuest.png)

16. From a terminal on your computer, navigate to the directory where you saved the SSH Key Pair, *DJBlockchain*. An example location is shown below.

   [![Download location example.](https://github.com/IBM/hyperledger-fabric-on-linux-one/raw/master/images/DownloadDirectory.png)](https://github.com/IBM/hyperledger-fabric-on-linux-one/blob/master/images/DownloadDirectory.png)

17. Modify the permissions of your private key by entering `chmod 600 DJBlockchain.pem`.

   [![Modify permissions.](https://github.com/IBM/hyperledger-fabric-on-linux-one/raw/master/images/SSHKeyPermissions.png)](https://github.com/IBM/hyperledger-fabric-on-linux-one/blob/master/images/SSHKeyPermissions.png)

18. From the location where your *DJBlockchain.pem* SSH key pair is, enter the command `ssh -i DJBlockchain.pem linux1@xxx.xxx.x.x` where the x's correspond to your Linux guest IP.

19. **Type** `yes` to the continue connecting prompt and **hit** the *enter* key.

   [![Type yes.](https://github.com/IBM/hyperledger-fabric-on-linux-one/raw/master/images/ContinueConnecting.png)](https://github.com/IBM/hyperledger-fabric-on-linux-one/blob/master/images/ContinueConnecting.png)

20. You are now connected into your IBM LinuxONE Community Cloud Guest!

    [![Success!](https://github.com/IBM/hyperledger-fabric-on-linux-one/raw/master/images/CommunityCloudWelcome.png)](https://github.com/IBM/hyperledger-fabric-on-linux-one/blob/master/images/CommunityCloudWelcome.png)

#### Setup your Linux guest for Hyperledger Fabric and Hyperledger Composer

21. Now it is time to setup your guest! Run the following command, to  move the setup script from the Github Repository to your Linux guest.

22. ```bash
    wget https://raw.githubusercontent.com/titogarrido/meetup-hands-on/master/suse-prereq.sh
    ```

23. To make the file executable, run `chmod u+x suse-prereq.sh` and then `ls -al` to make sure that it is showing as an executable file.

    ![](https://github.com/titogarrido/Lab-Composer-Integrated/raw/master/images/suse-prereq.png)

24. You're ready to run the setup script! Run the script using the following command, `./suse-prereq.sh`. Be patient. It takes awhile!

25. The first time you run the script, it will set some permissions and  environment variables that require you to exit and log in again.

    - Exit the session by **typing** `exit`.
    - **Log in** again —  `ssh -i DJBlockchain.pem linux1@xxx.xxx.x.x` where the x's correspond to your Linux guest IP.

26. Now it is time to install your fabric network. Run the following command:

27. ```bash
    wget https://raw.githubusercontent.com/titogarrido/meetup-hands-on/master/install-fabric.sh		
    ```

28. Make it executable running `chmod +x install-fabric.sh`and the execute it `./install-fabric.sh`.

#### Verify the installation of Hyperledger Fabric and Hyperledger Composer

29. To see if your blockchain network is up and running, use the command `docker ps -a`. You should see 4 containers with image names like the ones shown below.

    ![](https://github.com/titogarrido/Lab-Composer-Integrated/raw/master/images/dockerps.png)

30. Verify that the composer command line interface and other tools were installed by entering `composer -v`.

31. ```bash
    linux1@blockchain:~> composer -v
    v0.19.14
    ```

32. Verify Composer Playground is running by looking for its process using the command, `ps -ef|grep playground`.

33. ```bash
    linux1@blockchain:~> ps -ef | grep playground
    linux1   11707  7504  0 16:51 pts/0    00:00:00 node /home/linux1/.nvm/versions/node/v8.11.4/bin/composer-playground
    linux1   12164  7504  0 16:56 pts/0    00:00:00 grep --color=auto playground
    ```

34. Open a browser and enter `xxx.xxx.x.x:8080` into the address bar where the x's correspond to your Linux guest's IP address.

    - **Note:** It is recommended to use Chrome as your  browser for Hyperledger Composer Playground. It is also recommended that  you open the Playground in a Incognito Window. This allows you to  quickly clear cache and history if you start noticing odd behaviors.
    - **Note:** If you use Firefox, you cannot use it in Private mode.
    - You should see the following:

    [![Loading Composer Playground.](https://github.com/IBM/hyperledger-fabric-on-linux-one/raw/master/images/ComposerPlaygroundUI1.png)](https://github.com/IBM/hyperledger-fabric-on-linux-one/blob/master/images/ComposerPlaygroundUI1.png)

    [![Loaded Composer Playground.](https://github.com/IBM/hyperledger-fabric-on-linux-one/raw/master/images/ComposerPlaygroundUI2.png)](https://github.com/IBM/hyperledger-fabric-on-linux-one/blob/master/images/ComposerPlaygroundUI2.png)

35. Congratulations! Part 1 is now complete! Lets get to work on the fun part. 😃

# Part 2: Creating a blockchain application and generating API

The Internet of Things (IoT)-based [Perishable Goods network](https://github.com/hyperledger/composer-sample-networks/tree/master/packages/perishable-network) is a business network involving:

- Perishable items such as bananas, pears, and coffee
- Business partners such as growers, shippers, and importers
- Shipments of perishable goods
- Agreements between business parties that stipulate conditions of the agreements
- Acknowledgement of receipt of goods and services

We'll be using this business network as the example throughout this workshop.

## Importing components for your application

1. In a terminal on **your local computer**, move to the home directory. `cd $HOME`

2. If not already installed, [install Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git_) for **your local computer**. 

3. Once Git is installed, run the following command to clone the needed materials for this exercise. `git clone https://github.com/titogarrido/Lab-Composer-Integrated.git`

4. ```bash
   Air-de-Tito:source titogarridoogando$ git clone https://github.com/titogarrido/Lab-Composer-Integrated.git
   Cloning into 'Lab-Composer-Integrated'...
   remote: Counting objects: 11, done.
   remote: Compressing objects: 100% (11/11), done.
   remote: Total 11 (delta 0), reused 11 (delta 0), pack-reused 0
   Unpacking objects: 100% (11/11), done.
   ```

5. To find the files you'll need for this, `cd Lab-Composer-Integrated/source/` and then run `ls` to see what is in the directory.

6. ```bash
   Air-de-Tito:source titogarridoogando$ ls
   README.md	logic.js	perishable.cto	permissions.acl
   ```

7. Go back to your browser that has Composer Playground open. If you've closed it, you can open it in your browser by entering `xxx.xxx.x.x:8080` into the address bar where the x's correspond to your Linux guest's IP address.

   - **Note:** You will need to view the browser in Full  Screen (fully expanded) mode to be able to access everything and prevent  issues with inability to scroll on certain screens.

8. Select Deploy a new business network under Connection: Web Browser. Select Deploy a new business network.

Complete the BASIC INFORMATION.

    Give your new Business Network a name: my-first-blockchain
    
    Describe what your Business Network will be used for: Creating my first blockchain network.
    
    Give the network admin card that will be created a name: admin@my-first-blockchain-dev

![](https://github.com/titogarrido/Lab-Composer-Integrated/raw/master/images/comp2.png)

9. Scroll until you can see *Choose a Business Network Definition to start with:* and select **empty-business-network** and **Deploy**. 

   ![](https://github.com/titogarrido/Lab-Composer-Integrated/raw/master/images/comp3.png)

10. From *My Wallet* select **Connect now** to go into your business network. 

  ![](https://github.com/titogarrido/Lab-Composer-Integrated/raw/master/images/comp4.png) 

11. Select **Add a File**.

    [![Select Add a File.](https://github.com/IBM/hyperledger-fabric-on-linux-one/raw/master/images/AddFile.png)](https://github.com/IBM/hyperledger-fabric-on-linux-one/blob/master/images/AddFile.png)

12. From the *Add a file* pop-up dialog, select **browse**.

    [![Select browse.](https://github.com/IBM/hyperledger-fabric-on-linux-one/raw/master/images/SelectBrowse.png)](https://github.com/IBM/hyperledger-fabric-on-linux-one/blob/master/images/SelectBrowse.png)

    

13. In the file explorer window, navigate to where you downloaded the files. Refer to step 5 if you need help finding this location. **Select** *README.md* and **Click** *Open*. 

    ![](https://github.com/titogarrido/Lab-Composer-Integrated/raw/master/images/comp5.png)

14. **Select** *Add*. [![Select Add.](https://github.com/IBM/hyperledger-fabric-on-linux-one/raw/master/images/AddREADME.png)](https://github.com/IBM/hyperledger-fabric-on-linux-one/blob/master/images/AddREADME.png)

15. On the *Current file will be replaced* dialog, **select** *Replace*.

    [![Select Add.](https://github.com/IBM/hyperledger-fabric-on-linux-one/raw/master/images/READMEReplace.png)](https://github.com/IBM/hyperledger-fabric-on-linux-one/blob/master/images/READMEReplace.png)

16. Let's keep adding the files to the Composer Playground.  **Repeat steps 11-15 to add the following files**:

    - *model.cto* — This is located in the source folder.  In this exercise you'll use this file to create a model for your asset  and transactions. You could also create participants in this file. This  is similar to creating a Java class and defining what you would need in  the class.
    - *logic.js* — This is located in the source folder. This is a  JavaScript file that becomes the brains of your application. In this  file is code, your smart contract, that defines how a transaction can  happen. This is similar to Java methods.
    - **Add last:** *permissions.acl* — This is where you would limit permissions for participants in a blockchain network.

17. Your files are all now loaded into Composer Playground. **Click** *Deploy changes* on the left side of the browser.

    ![](https://github.com/titogarrido/Lab-Composer-Integrated/raw/master/images/comp6.png)

18. Click on **Model File**.

    ![](https://github.com/titogarrido/Lab-Composer-Integrated/raw/master/images/comp7.png)

19. Click in the **editor** on the right to begin writing your models.

    - NOTE: **DO** **NOT** modify the namespace during the lab.

## Modeling the participants

1. A *participant* is a member of a business network. For the Perishable Goods network, this includes the growers who produce the perishable goods, the shippers who transport them from the growers to the ports, and the importers who take delivery of the goods at the ports. Obviously, this model is oversimplified, but it should give you a sense of how real-world applications are modeled using business network terminology.

2. On a new line, give your participant `Business` the following attribute.

   **Note:** a small "o" is used as a bullet in the model.

3. `o Double accountBalance` — this will be the amount of money that a business has

```javascript
    abstract participant Business identified by email {
      o String email
      o Double accountBalance
    }
```
4. ![](https://github.com/titogarrido/Lab-Composer-Integrated/raw/master/images/comp8.png)

5. Above the `Business` definition you will see our 3 participants:

    Grower

    Shipper

    Importer

6. Each participant inherits the *Business* abstraction that you created above. So, in this case we will not change anything, just keep the current definitions:

7. ```javascript
    /**
     * A Grower is a type of participant in the network
     */
    participant Grower extends Business {
    }
    
    /**
     * A Shipper is a type of participant in the network
     */
    participant Shipper extends Business {
    }
    
    /**
     * An Importer is a type of participant in the network
     */
    participant Importer extends Business {
    }
    ```

8. **Click** *Deploy changes* on the left side of the browser.

    ![](https://github.com/titogarrido/Lab-Composer-Integrated/raw/master/images/comp6.png)


## Modeling assets

An *asset* is anything of value that can be exchanged between parties in a business agreement. That means an asset can be pretty much anything. Examples include:

- A boat
- A quantity of stock
- A house
- A crate of bananas
- A shipment of bananas
- A contract for shipment of 1000 crates of bananas for X price based on conditions {X, Y, Z}

You name it. If it has perceived value, and can be exchanged between parties, it's an asset. In the Perishable Goods network, assets include the perishable goods themselves, shipments of those goods, and the                 contracts that govern the activities performed during the exchange.

1. We will start adding some attributes for two *enum* types. Enumerated types are used to specify a type that may have 1 or N  possible values. The example below defines the ProductType enumeration,  which may have the value `BANANA` or `APPLE` or `COFFEE`.

2. On a new line, give your *enum* `ProductType` the following attributes:

3. ```javascript
   enum ProductType {
     o BANANAS
     o APPLES
     o PEARS
     o PEACHES
     o COFFEE
   }
   ```

4. For `ShipmentStatus`add the following attributes:

5. ```javascript
   enum ShipmentStatus {
     o CREATED
     o IN_TRANSIT
     o ARRIVED
   }
   ```

6. These attributes will be used in our `Shipment`asset. Add the following attributes to our `asset Shipment`:

7. ```javascript
   asset Shipment identified by shipmentId {
     o String shipmentId
     o ProductType type
     o ShipmentStatus status
     o Long unitCount
     o TemperatureReading[] temperatureReadings optional
     --> Contract contract
   }
   ```

8. Take a minute to understand each attribute from your asset `Shipment`:

   - shipmentId - It is the ID of your shipment, unique identifier.
   - type - Type of your shipment will be based on the `ProductType ` *enum* that we have created above.
   - status - The status of your shipment based on `ShipmentStatus` *enum* that we have created above
   - unitCount - The quantity of good that is being trade
   - temperatureReadings - A list of temperature readings from the IoT device
   - contract - The contract that this shipment will obey. We will model it on the next step.

9. Add the following attributes to our asset Contract:


10. ```javascript
   asset Contract identified by contractId {
     o String contractId
     --> Grower grower
     --> Shipper shipper
     --> Importer importer
     o DateTime arrivalDateTime
     o Double unitPrice
     o Double minTemperature
     o Double maxTemperature
     o Double minPenaltyFactor
     o Double maxPenaltyFactor
   }
   ```

12. Take a minute to understand each attribute from your asset `Contract`:

    - contractId - It is the ID of your contract, unique identifier.
    - grower - refers to `participant Grower`
    - shipper - refers to `participant shipper`
    - importer - refers to `participant importer`
    - arrivalDateTime - It is the arrival date and time of the shipment
    - unitPrice - is the price of each unit of the shipment
    - minTemperature - Is the minimal temperature accepted for your cargo
    - maxTemperature - Is the maximum temperature accepeted for your cargo
    - minPenaltyFactor - How much we reduce the price for every degree below the min temp
    - maxPenaltyFactor - How much we reduce the price for every degree above the max temp

13. That is it for our assets, take some time to understand what we have modeled if needed.

14. **Click** *Deploy changes* on the left side of the browser.

15. ![](https://github.com/titogarrido/Lab-Composer-Integrated/raw/master/images/comp6.png)

## Modeling our transactions

Transaction will hold the business logic, but before the business logic (javascript) we need to define the parameters that this transaction will receive.

We have three transactions defined in our *model.cto*:

- TemperatureReading - Will be called from our IoT device adding temperature values (in centigrades) to our shipment

- ShipmentReceived - Will be called from the Importer to payout the grower

- SetupDemo - Will be used to make easier to setup our demonstation (more information at the end of this section). It will create:

  - 3 participants
    - a farmer (grower)
    - a shipper (shipper) 
    - supermarket (importer)
  - 1 contract (CONS_001)
  - 1 shipment (SHIP_001)

  

1. As our first step we are going to update our `TemperatureReading` transaction. We need to add two parameters, `centigrades`  and a reference to the `shipment`:

2. ```
   transaction TemperatureReading {
     --> Shipment shipment
     o Double centigrade
   }
   ```

3. For the `ShipmentReceived` transaction we will just need to add a reference to a shipment:

4. ```
   transaction ShipmentReceived {
     --> Shipment shipment
   }
   ```

5. The `SetupDemo` transaction doesn't need any parameter, so we are not going to change it.

6. **Click** *Deploy changes* on the left side of the browser.

7. ![](https://github.com/titogarrido/Lab-Composer-Integrated/raw/master/images/comp6.png)



**Note:** The `perishable-network` model includes a transaction implemented as a JavaScript function in the `lib/logic.js`  module called `setupDemo()` that you can use to instantiate the model and create entries in the Asset and Participant registries. It is provided as a way to get the business network from the template up and running more quickly than if you entered the model by hand.

I won't show the `setupDemo()` function here, but I would like  to point out that it does three things:

1. Creates instances of all the assets and participants from the model
2. Sets property values on those instances
3. Stores the instances in their respective registries

I encourage you to open the `lib/logic.js` file in the editor and look at it for yourself.

Any guesses what the code is doing for each transaction?

![](https://github.com/titogarrido/Lab-Composer-Integrated/raw/master/images/comp9.png)

### Final model.cto

This our final *model.cto*:

```javascript
/**
 * A business network definition
 */

namespace org.acme.shipping.perishable

/**
 * An abstract participant type in this business network
 */
abstract participant Business identified by email {
  o String email
  o Double accountBalance
}

/**
 * A Grower is a type of participant in the network
 */
participant Grower extends Business {
}

/**
 * A Shipper is a type of participant in the network
 */
participant Shipper extends Business {
}

/**
 * An Importer is a type of participant in the network
 */
participant Importer extends Business {
}

/**
 * The type of perishable product being shipped
 */
enum ProductType {
  o BANANAS
  o APPLES
  o PEARS
  o PEACHES
  o COFFEE
}

/**
 * The status of a shipment
 */
enum ShipmentStatus {
  o CREATED
  o IN_TRANSIT
  o ARRIVED
}

/**
 * Defines a contract between a Grower and an Importer to ship using
 * a Shipper, paying a set unit price. The unit price is multiplied by
 * a penality factor proportional to the deviation from the min and max
 * negociated temperatures for the shipment.
 */
asset Contract identified by contractId {
  o String contractId
  --> Grower grower
  --> Shipper shipper
  --> Importer importer
  o DateTime arrivalDateTime
  o Double unitPrice
  o Double minTemperature
  o Double maxTemperature
  o Double minPenaltyFactor
  o Double maxPenaltyFactor
}

/**
 * A shipment being tracked as an asset on the ledger
 */
asset Shipment identified by shipmentId {
  o String shipmentId
  o ProductType type
  o ShipmentStatus status
  o Long unitCount
  o TemperatureReading[] temperatureReadings optional
  --> Contract contract
}

/**
 * An temperature reading for a shipment. E.g. received from a
 * device within a temperature controlled shipping container
 */
transaction TemperatureReading {
  --> Shipment shipment
  o Double centigrade
}

/**
 * A notification that a shipment has been received by the
 * importer and that funds should be transferred from the importer
 * to the grower to pay for the shipment.
 */
transaction ShipmentReceived {
  --> Shipment shipment
}


/**
 * JUST FOR INITIALIZING A DEMO
 */
transaction SetupDemo {
}
```



## Checking the code

Under FILES, notice the following:

- `README.md` - this Markdown file provides a quick overview of the Perishable Goods network
- `models/model.cto` - contains the business model
- `lib/logic.js` - contains the business logic (smart contract) code, including transaction implementation

When you select one of the files under FILES, it opens in the editor window on the right side. 

So far in this section, we've talked about modeling assets, participants and transactions, but what about the business logic for transactions? Where do they show up?

To answer the first question: the transactions represent the business logic of the application (smart contracts, or chaincode). The business logic enforced by the smart contract generated by `setupDemo()`                 stipulates the following conditions: 

1. The temperature inside the shipping container is to be 6 degrees Celsius at all times. If the temperature of the shipment falls outside of the agreed-upon range (+/- 5 degrees), then the price of the                     shipment (\$0.50/unit) is reduced by \$0.20/unit for every degree below and \$0.10 for every degree above.
2. If the shipment arrives late, the Grower receives no payment for the shipment.

Okay, so where do the transactions show up? A transaction is not *instantiated* per se, but rather shows up as JavaScript code in `lib/logic.js`.

The figure below shows the smart contract code (from lib/logic.js) that enforces the second stipulation (zero payout for a late shipment) from the contract:

![](https://github.com/titogarrido/Lab-Composer-Integrated/raw/master/images/comp10.png)



### Instantiate the model

Click the **Test** tab at the top of the screen:

![](/Users/titogarridoogando/Documents/IBM/LabService/Blockchain/Workshop/Workshop%202%20days/Day%202/images/comp7.png)



To execute the **SetupDemo** transaction, click the **Submit Transaction** button.

![](/Users/titogarridoogando/Documents/IBM/LabService/Blockchain/Workshop/Workshop 2 days/Day 2/images/comp8.png)

Make sure that SetupDemo appears in the **Transaction Type** drop-down, then click the **Submit** button. When the transaction executes successfully, you will see a brief notification message telling you so.

Select **Grower** in the ASSETS pane on the left side, and all of its instances appear on the right side. The same is true for the other resources (go ahead, try it!).

Now that you have a business network defined, and assets and participants in their respective registries, you can test your network.

### Test the model

Now that the model is instantiated, it's time to test it, and that means running code! In this case, that means running JavaScript code from `lib/logic.js`.

Before you set up the test, let's review the contract (which was instantiated in the `setupDemo()` function) to see the terms. 

 The figure below shows the JavaScript code used to instantiate the contract asset:

![](https://github.com/titogarrido/Lab-Composer-Integrated/raw/master/images/comp11.png)



So now you're ready to test the smart contract. With Playground running in your browser, click the Test tab at the top of the Playground UI.

Let's test the following scenario:

1. IoT temperature sensors provide the following readings (numbers are degrees Celsius):
        5
        7
        1
        4
2. The Shipment is received.

Let's look at the components of this scenario one at a time, starting with the temperature sensor data.

In a real-world application, the IoT temperature sensors could, say, send this data to the IBM Cloud, where the smart contract code would be invoked against the blockchain to record these transactions.

In Playground, the blockchain is maintained in your browser's local storage, but the transaction code that executes is the same regardless of where the blockchain resides (which makes Playground a perfect place to test, right?).

Check out the temperatureReading() function inside lib/logic.js:

```javascript
/**
 * A temperature reading has been received for a shipment
 * @param {org.acme.shipping.perishable.TemperatureReading} temperatureReading - the TemperatureReading transaction
 * @transaction
 */
async function temperatureReading(temperatureReading) {  // eslint-disable-line no-unused-vars

    const shipment = temperatureReading.shipment;

    console.log('Adding temperature ' + temperatureReading.centigrade + ' to shipment ' + shipment.$identifier);

    if (shipment.temperatureReadings) {
        shipment.temperatureReadings.push(temperatureReading);
    } else {
        shipment.temperatureReadings = [temperatureReading];
    }

    // add the temp reading to the shipment
    const shipmentRegistry = await getAssetRegistry('org.acme.shipping.perishable.Shipment');
    await shipmentRegistry.update(shipment);
}

```

In the real-world app, when an IoT sensor in the shipping container wants to send a reading, it sends it to the cloud (through the cargo ship's network), where it is picked up by, say, a serverless function running in                 OpenWhisk, which invokes the `temperatureReading()` function.

To simulate this in Playground:

1. Click the **Submit Transaction** button (just like you did to invoke the `setupDemo()` function).
2. Make sure **TemperatureReading** appears in the **Transaction Type** drop-down.
3. Change the "centigrade" reading from 0 to 5 (the first reading we want to send) in the **JSON Data Preview** window.
4. Make sure the shipment ID is set to SHIP_001.
5. Click **Submit**.
6. Repeat for the remaining three readings.

To receive the shipment in a real-world application, an app running on the importer's hand-held device could indicate to an application running in the IBM Cloud (or a serverless function running in OpenWhisk) that the shipment was received, which would then calculate payment to be remitted to the grower.

To simulate receipt of the shipment in Playground, run the **ShipmentReceived** transaction in Playground, make sure to provide the shipment's ID, and click **Submit**.

## Deploy application to Hyperledger Fabric

1. Back in your browser where Hyperledger Composer Playground is running, **click** the *Define* tab and then **click** *Export* to save your code to your desktop. This is a safety measure. Export  saves all of the indivudual files we imported at the beginning of Part 2 into a compressed file called a business network archive (.bna).

![](https://github.com/titogarrido/Lab-Composer-Integrated/raw/master/images/comp12.png)

2. In the pop-up dialog, **choose** your directory location and **click** *Save*. 
3. ![](https://github.com/titogarrido/Lab-Composer-Integrated/raw/master/images/comp13.png)
4. In the upper right corner of your browser, **select**  *admin* and **click** *My Business Networks*. [![Select admin and logout.](https://github.com/IBM/hyperledger-fabric-on-linux-one/raw/master/images/ClickLogout.png)](https://github.com/IBM/hyperledger-fabric-on-linux-one/blob/master/images/ClickLogout.png) 
5. In the middle of the page, **click** *Deploy a new business network* under the *Connection: hlfv1* business network.

[![Select Create ID card.](https://github.com/IBM/hyperledger-fabric-on-linux-one/raw/master/images/DeployNetwork.png)](https://github.com/IBM/hyperledger-fabric-on-linux-one/blob/master/images/DeployNetwork.png)

6. Complete the fields under *Basic Information* and then **click** *Drop here to upload or browse*.
   - Business Network: `hlfv1-first-blockchain`
   - Description: "My first Blockchain network deployed to hlfv1"
   - Network Admin Card: `admin@hlfv1-first-blockchain`

![](https://github.com/titogarrido/Lab-Composer-Integrated/raw/master/images/comp14.png)

7. Navigate to where you saved your my-first-blockchain.bna. **Select** blockchain-journey.bna from its directory and **click** *Open*.
8. ![](https://github.com/titogarrido/Lab-Composer-Integrated/raw/master/images/comp15.png)
9. Scroll to the bottom of the page and complete the following:
   - **Select** *ID and Secret*.
   - **Create** an *Enrollment ID* of `admin`.
   - **Create** an *Enrollment Secret* of `adminpw`.
   - Note: If you create a different *Enrollment Id* and *Enrollment Secret* then you will need to create and import a network card for that ID. See [Hyperledger Composer documentation for more information.](https://hyperledger.github.io/composer//reference/composer.card.create)
10. [![Create the credentials for the ID card.](https://github.com/IBM/hyperledger-fabric-on-linux-one/raw/master/images/IDCardCreds.png)](https://github.com/IBM/hyperledger-fabric-on-linux-one/blob/master/images/IDCardCreds.png)
11. Scroll up to the top and **click** *Deploy* on the right side.
12. ![](https://github.com/titogarrido/Lab-Composer-Integrated/raw/master/images/comp16.png)
13. Under *Connection: hlfv1*, find your newly deployed network *hlfv1-first-blockchain*. **Click** *Connect now*.

![](https://github.com/titogarrido/Lab-Composer-Integrated/raw/master/images/comp17.png)

14. Back in your terminal, enter `docker ps -a` . You can see there is now a new container running where Composer Playground has deployed code to the Hyperledger Fabric.

15. ```bash
    linux1@blockchain:~/fabric-tools> docker ps -a
    CONTAINER ID        IMAGE                                                                                                                               COMMAND                  CREATED             STATUS              PORTS                                            NAMES
    c199f00e673a        dev-peer0.org1.example.com-hlfv1-first-blockchain-0.0.2-deploy.4-af7df2f3b3f3d60f111f11521e9a4063d587b60e35e8eeecb00a6828a68c3b9a   "/bin/sh -c 'cd /u..."   6 minutes ago       Up 6 minutes                                                         dev-peer0.org1.example.com-hlfv1-first-blockchain-0.0.2-deploy.4
    6e36dd961d13        hyperledger/fabric-peer:s390x-1.1.0                                                                                                 "peer node start"        13 minutes ago      Up 13 minutes       0.0.0.0:7051->7051/tcp, 0.0.0.0:7053->7053/tcp   peer0.org1.example.com
    e3259b948d7a        hyperledger/fabric-couchdb:s390x-0.4.6                                                                                              "tini -- /docker-e..."   13 minutes ago      Up 13 minutes       4369/tcp, 9100/tcp, 0.0.0.0:5984->5984/tcp       couchdb
    44466079c7ab        hyperledger/fabric-orderer:s390x-1.1.0                                                                                              "orderer"                13 minutes ago      Up 13 minutes       0.0.0.0:7050->7050/tcp                           orderer.example.com
    e10585435c5d        hyperledger/fabric-ca:s390x-1.1.0                                                                                                   "sh -c 'fabric-ca-..."   13 minutes ago      Up 13 minutes       0.0.0.0:7054->7054/tcp                           ca.org1.example.com
    ```

16. Congratulations! You've deployed your first blockchain application to Hyperledger Fabric. 

## Generating the API



1. In your terminal, issue the following commands to start the API rest server:

   ```
   nohup composer-rest-server -c admin@hlfv1-first-blockchain -n never -w true > ~/playground/rest.stdout 2> ~/playground/rest.stderr & disown
   ```

2. Result:

   ```
   linux1@blockchain:~/playground> nohup composer-rest-server -c admin@hlfv1-first-blockchain -n never -w true > ~/playground/rest.stdout 2> ~/playground/rest.stderr & disown
   [1] 39879
   ```

3. Verify the rest server process is running. `ps -ef|grep rest`

4. ```
   linux1@blockchain:~/playground> ps -ef|grep rest
   linux1   39879 29910  3 17:41 pts/0    00:00:04 node /home/linux1/.nvm/versions/node/v8.11.4/bin/composer-rest-server -c admin@hlfv1-first-blockchain -n never -w true
   linux1   39904 29910  0 17:43 pts/0    00:00:00 grep --color=auto rest
   ```

5. To see your API, go back to your browser and open a new tab or window. In the address bar, enter `http://xxx.xxx.x.x:3000/explorer` where the x's are the IP address for your Linux guest. You should see a page like the one shown.

   ![](https://github.com/titogarrido/Lab-Composer-Integrated/raw/master/images/rest1.png)

6. Expand the different methods to see the various calls and parameters you can make through REST API. You can also test the API in this browser to learn how to form the API and see the responses.

7. ![](https://github.com/titogarrido/Lab-Composer-Integrated/raw/master/images/rest2.png)

8. Congratulations! You now have a working blockchain application and have created APIs to call your blockchain application.

# Part 3 — Interacting with Blockchain from an Application

## Running our sample application

Inside our github there is a sample app written in Python that we will use to illustrate the integration between a user interface and the blockchain API.

1. Go to your home directory `cd ~`

2. Clone our repository that has our sample app

3. ```bash
   linux1@blockchain:~> git clone https://github.com/titogarrido/Lab-Composer-Integrated.git
   Cloning into 'Lab-Composer-Integrated'...
   remote: Counting objects: 100, done.
   remote: Compressing objects: 100% (83/83), done.
   remote: Total 100 (delta 20), reused 90 (delta 10), pack-reused 0
   Receiving objects: 100% (100/100), 2.79 MiB | 0 bytes/s, done.
   Resolving deltas: 100% (20/20), done.
   ```

4. Enter in our app directory `cd ~/Lab-Composer-Integrated/app`

5. Download the lib requirements from pip:

6. `linux1@blockchain:~/Lab-Composer-Integrated/app> sudo pip install -r requirements.txt`

    

7. ```bash
   linux1@blockchain:~/Lab-Composer-Integrated/app> sudo pip install -r requirements.txt
   /usr/lib/python2.7/site-packages/pip-18.0-py2.7.egg/pip/_vendor/requests/__init__.py:83: RequestsDependencyWarning: Old version of cryptography ([1, 3, 1]) may cause slowdown.
     warnings.warn(warning, RequestsDependencyWarning)
   Collecting bottle==0.12.13 (from -r requirements.txt (line 1))
     Downloading https://files.pythonhosted.org/packages/bd/99/04dc59ced52a8261ee0f965a8968717a255ea84a36013e527944dbf3468c/bottle-0.12.13.tar.gz (70kB)
       100% |████████████████████████████████| 71kB 3.2MB/s
   Collecting certifi==2018.8.13 (from -r requirements.txt (line 2))
     Downloading https://files.pythonhosted.org/packages/16/1f/50d729c104b21c1042aa51560da6141d1cab476ba7015d92b2111c8db841/certifi-2018.8.13-py2.py3-none-any.whl (146kB)
       100% |████████████████████████████████| 153kB 5.8MB/s
   Collecting chardet==3.0.4 (from -r requirements.txt (line 3))
     Downloading https://files.pythonhosted.org/packages/bc/a9/01ffebfb562e4274b6487b4bb1ddec7ca55ec7510b22e4c51f14098443b8/chardet-3.0.4-py2.py3-none-any.whl (133kB)
       100% |████████████████████████████████| 143kB 6.4MB/s
   Collecting idna==2.7 (from -r requirements.txt (line 4))
     Downloading https://files.pythonhosted.org/packages/4b/2a/0276479a4b3caeb8a8c1af2f8e4355746a97fab05a372e4a2c6a6b876165/idna-2.7-py2.py3-none-any.whl (58kB)
       100% |████████████████████████████████| 61kB 5.7MB/s
   Collecting requests==2.19.1 (from -r requirements.txt (line 5))
     Downloading https://files.pythonhosted.org/packages/65/47/7e02164a2a3db50ed6d8a6ab1d6d60b69c4c3fdf57a284257925dfc12bda/requests-2.19.1-py2.py3-none-any.whl (91kB)
       100% |████████████████████████████████| 92kB 8.0MB/s
   Collecting urllib3==1.23 (from -r requirements.txt (line 6))
     Downloading https://files.pythonhosted.org/packages/bd/c9/6fdd990019071a4a32a5e7cb78a1d92c53851ef4f56f62a3486e6a7d8ffb/urllib3-1.23-py2.py3-none-any.whl (133kB)
       100% |████████████████████████████████| 143kB 6.7MB/s
   docker-compose 1.13.0 has requirement requests!=2.11.0,<2.12,>=2.6.1, but you'll have requests 2.19.1 which is incompatible.
   Installing collected packages: bottle, certifi, chardet, idna, urllib3, requests
     Running setup.py install for bottle ... done
     Found existing installation: idna 2.0
       Uninstalling idna-2.0:
         Successfully uninstalled idna-2.0
     Found existing installation: requests 2.9.0
       Uninstalling requests-2.9.0:
         Successfully uninstalled requests-2.9.0
   Successfully installed bottle-0.12.13 certifi-2018.8.13 chardet-3.0.4 idna-2.7 requests-2.19.1 urllib3-1.23
   ```

8. Execute our app:

9. ```bash
   linux1@blockchain:~/Lab-Composer-Integrated/app> python main.py
   /usr/lib/python2.7/site-packages/requests/__init__.py:83: RequestsDependencyWarning: Old version of cryptography ([1, 3, 1]) may cause slowdown.
     warnings.warn(warning, RequestsDependencyWarning)
   /usr/lib/python2.7/site-packages/requests/__init__.py:83: RequestsDependencyWarning: Old version of cryptography ([1, 3, 1]) may cause slowdown.
     warnings.warn(warning, RequestsDependencyWarning)
   Bottle v0.12.13 server starting up (using WSGIRefServer())...
   Listening on http://0.0.0.0:8081/
   Hit Ctrl-C to quit.
   ```

10. Enter `http://xxx.xxx.x.x:8081` in the address bar where the x's correspond to your Linux guest IP address.

11. ![](https://github.com/titogarrido/Lab-Composer-Integrated/raw/master/images/app1.png)

     

## Test the sample app

1. Set some temperatures for your cargo

2. For contract CON_001 any temperature below 2 degrees and above 10 degrees will apply a penalty to the farmer

3. Set some temperatures like:

   - 5
   - 7
   - 11
   - 1

4. Then press the "Cargo Arrived" button to see the contract being executed.

   ![](https://github.com/titogarrido/Lab-Composer-Integrated/raw/master/images/app2.png)

5. When the cargo has arrive you are going to see that a new button will apper: *"Details"*:

   ![](https://github.com/titogarrido/Lab-Composer-Integrated/raw/master/images/app3.png)

6. Press the "Details" button and you will see some information about your cargo:

   ![](https://github.com/titogarrido/Lab-Composer-Integrated/raw/master/images/app4.png)

7. Take some time to play with the app and the rest server to see both working.

8. **Congratulations! You've completed this Lab!**