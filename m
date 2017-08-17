From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [bug report] leds: Add support for Philips PCA955x I2C LED drivers
Date: Thu, 17 Aug 2017 13:28:47 +0300
Message-ID: <20170817102847.n4h5ez6zlfclkcjs@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:25380 "EHLO
        userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751090AbdHQK3B (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Aug 2017 06:29:01 -0400
Content-Disposition: inline
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: ncase@xes-inc.com
Cc: linux-leds@vger.kernel.org

Hello Nate Case,

The patch f46e9203d9a1: "leds: Add support for Philips PCA955x I2C
LED drivers" from Jul 16, 2008, leads to the following static checker
warning:

	drivers/leds/leds-pca955x.c:476 pca955x_probe()
	warn: this array is probably non-NULL. 'pdata->leds + i->name'

drivers/leds/leds-pca955x.c
   465                  switch (pca955x_led->type) {
   466                  case PCA955X_TYPE_NONE:
   467                          break;
   468                  case PCA955X_TYPE_GPIO:
   469                          ngpios++;
   470                          break;
   471                  case PCA955X_TYPE_LED:
   472                          /*
   473                           * Platform data can specify LED names and
   474                           * default triggers
   475                           */
   476                          if (pdata->leds[i].name)
                                    ^^^^^^^^^^^^^^^^^^^
The comment implies that we should be testing pdata->leds[i].name[0] to
see if any string has been set?

   477                                  snprintf(pca955x_led->name,
   478                                          sizeof(pca955x_led->name), "pca955x:%s",
   479                                          pdata->leds[i].name);
   480                          if (pdata->leds[i].default_trigger)
   481                                  pca955x_led->led_cdev.default_trigger =
   482                                          pdata->leds[i].default_trigger;
   483  
   484                          pca955x_led->led_cdev.name = pca955x_led->name;
   485                          pca955x_led->led_cdev.brightness_set_blocking =
   486                                  pca955x_led_set;
   487  
   488                          err = devm_led_classdev_register(&client->dev,
   489                                                          &pca955x_led->led_cdev);
   490                          if (err)
   491                                  return err;
   492  
   493                          /* Turn off LED */
   494                          pca955x_led_set(&pca955x_led->led_cdev, LED_OFF);

regards,
dan carpenter
