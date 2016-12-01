From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [bug report] leds: pca955x: Add ACPI support
Date: Thu, 1 Dec 2016 23:12:12 +0300
Message-ID: <20161201201212.GA4015@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:28044 "EHLO
        aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757491AbcLAUM1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 1 Dec 2016 15:12:27 -0500
Content-Disposition: inline
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: tnhuynh@apm.com
Cc: linux-leds@vger.kernel.org

Hello Tin Huynh,

This is a semi-automatic email about new static checker warnings.

The patch f00662b45979: "leds: pca955x: Add ACPI support" from Nov 
30, 2016, leads to the following Smatch complaint:

drivers/leds/leds-pca955x.c:284 pca955x_probe()
	 error: we previously assumed 'id' could be null (see line 263)

drivers/leds/leds-pca955x.c
   262	
   263		if (id) {
                   ^^^^
We added a new NULL check.

   264			chip = &pca955x_chipdefs[id->driver_data];
   265		} else {
   266			const struct acpi_device_id *acpi_id;
   267	
   268			acpi_id = acpi_match_device(pca955x_acpi_ids, &client->dev);
   269			if (!acpi_id)
   270				return -ENODEV;
   271			chip = &pca955x_chipdefs[acpi_id->driver_data];
   272		}
   273		adapter = to_i2c_adapter(client->dev.parent);
   274		pdata = dev_get_platdata(&client->dev);
   275	
   276		/* Make sure the slave address / chip type combo given is possible */
   277		if ((client->addr & ~((1 << chip->slv_addr_shift) - 1)) !=
   278		    chip->slv_addr) {
   279			dev_err(&client->dev, "invalid slave address %02x\n",
   280					client->addr);
   281			return -ENODEV;
   282		}
   283	
   284		dev_info(&client->dev, "leds-pca955x: Using %s %d-bit LED driver at "
   285				"slave address 0x%02x\n",
   286				id->name, chip->bits, client->addr);
                                ^^^^^^^^^
But the old code assumed "id" was non-NULL.

regards,
dan carpenter
