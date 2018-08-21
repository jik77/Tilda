/*
 Tilda V1.0 template application class.
*/

package tilda.data;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import tilda.db.*;

/**
This is the application class <B>Data_DateDim</B> mapped to the table <B>TILDA.DateDim</B>.
@see tilda.data._Tilda.TILDA__DATEDIM
*/
public class DateDim_Factory extends tilda.data._Tilda.TILDA__DATEDIM_Factory
 {
   protected static final Logger LOG = LogManager.getLogger(DateDim_Factory.class.getName());

   protected DateDim_Factory() { }

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//   Implement your customizations, if any, below.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


   public static void init(Connection C) throws Exception
    {
      // Add logic to initialize your object, for example, caching some values, or validating some things.
    }

 }
