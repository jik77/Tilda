/*
 Tilda V1.0 template application class.
*/

package tilda.data_test;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import tilda.db.*;

/**
This is the application class <B>Data_Testing4Realized</B> mapped to the table <B>TILDATEST.Testing4Realized</B>.
@see tilda.data_test._Tilda.TILDA__TESTING4REALIZED
*/
public class Testing4Realized_Factory extends tilda.data_test._Tilda.TILDA__TESTING4REALIZED_Factory
 {
   protected static final Logger LOG = LogManager.getLogger(Testing4Realized_Factory.class.getName());

   protected Testing4Realized_Factory() { }

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//   Implement your customizations, if any, below.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


   public static void init(Connection C) throws Exception
    {
      // Add logic to initialize your object, for example, caching some values, or validating some things.
    }

 }
