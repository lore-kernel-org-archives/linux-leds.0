From: Muhammad Falak R Wani <falakreyaz@gmail.com>
Subject: [PATCH v2 0/2] leds: leds-ipaq-micro: Use resource managed functions and fix coding style.
Date: Mon,  7 Sep 2015 19:43:22 +0530
Message-ID: <1441635204-3634-1-git-send-email-falakreyaz@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:34986 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752175AbbIGOJY (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 7 Sep 2015 10:09:24 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Muhammad Falak R Wani <falakreyaz@gmail.com>

Hi,
Based on the suggestion from Jaeck, the orginal patch is split into
two, one patch fixes the coding style issues, and the other
uses resource managed function, devm_led_classdev_register.

Muhammad Falak R Wani (2):
  leds: leds-ipaq-micro: Use devm_led_classdev_register
  leds: leds-ipaq-micro: Fix coding style issues

 drivers/leds/leds-ipaq-micro.c | 47 ++++++++++++++++++------------------------
 1 file changed, 20 insertions(+), 27 deletions(-)

-- 
1.9.1
