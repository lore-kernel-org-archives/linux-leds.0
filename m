From: Raul Piper <raulpblooper@gmail.com>
Subject: devm_gpiod_get usage to get the gpio num
Date: Tue, 16 Aug 2016 15:58:53 +0530
Message-ID: <CAEwN+MDkyOGCGrnWiPqSjxA1meSxJduGc1DCyH2dzOA=w4hLTQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:36039 "EHLO
	mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752223AbcHPK2z (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 16 Aug 2016 06:28:55 -0400
Received: by mail-it0-f68.google.com with SMTP id j124so4998708ith.3
        for <linux-leds@vger.kernel.org>; Tue, 16 Aug 2016 03:28:55 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, kernelnewbies <kernelnewbies@kernelnewbies.org>

Hi,
 devm_gpiod_get method takes 3 params after kernel 3.16 .

struct gpio_desc *gpiod;

gpiod = devm_gpiod_get(dev, "data-pin",GPIOD_OUT_HIGH)

where data-pin defintion in the device tree is :

data-pin = <&gpio2 51 GPIO_ACTIVE_HIGH>;

But this on inserting ht module givees "failed to parse DT (-2)

GPIOD_OUT_HIGH is one of the gpiod flags :

  enum gpiod_flags {
         GPIOD_ASIS      = 0,
          GPIOD_IN        = GPIOD_FLAGS_BIT_DIR_SET,
        GPIOD_OUT_LOW   = GPIOD_FLAGS_BIT_DIR_SET |
GPIOD_FLAGS_BIT_DIR_OUT,
          GPIOD_OUT_HIGH  = GPIOD_FLAGS_BIT_DIR_SET | GPIOD_FLAGS_BIT_DIR_OUT |
                           GPIOD_FLAGS_BIT_DIR_VAL,
 };

what is wrong here?I just want to extract the gpio number for the dt parser.

Thanks and Rgds,
Rp
