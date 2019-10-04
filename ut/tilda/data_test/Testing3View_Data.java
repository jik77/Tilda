/*
 Tilda V1.0 template application class.
*/

package tilda.data_test;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import tilda.db.Connection;

/**
This is the application class <B>Data_Testing3View</B> mapped to the table <B>TILDATEST.Testing3View</B>.
@see tilda.data_test._Tilda.TILDA__TESTING3VIEW
*/
public class Testing3View_Data extends tilda.data_test._Tilda.TILDA__TESTING3VIEW
 {
   protected static final Logger LOG = LogManager.getLogger(Testing3View_Data.class.getName());

   public Testing3View_Data() { }

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//   Implement your customizations, if any, below.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


   @Override
   protected boolean afterRead(Connection C) throws Exception
     {
       // Do things after an object has just been read form the data store, for example, take care of AUTO fields.
       return true;
     }

 }
