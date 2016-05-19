From: Tony Makkiel <tony.makkiel@daqri.com>
Subject: Hardware blink and brightness
Date: Thu, 19 May 2016 16:57:28 +0100
Message-ID: <573DE268.3060900@daqri.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:38810 "EHLO
	mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754667AbcESP5d (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 19 May 2016 11:57:33 -0400
Received: by mail-wm0-f54.google.com with SMTP id n129so42678605wmn.1
        for <linux-leds@vger.kernel.org>; Thu, 19 May 2016 08:57:32 -0700 (PDT)
Received: from [192.168.1.25] ([81.139.40.162])
        by smtp.gmail.com with ESMTPSA id lf9sm15082596wjc.44.2016.05.19.08.57.31
        for <linux-leds@vger.kernel.org>
        (version=TLSv1/SSLv3 cipher=OTHER);
        Thu, 19 May 2016 08:57:31 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org

Hi,
	Is there any particular reason to stipulate, (hardware) blink should be turned off, when brightness is set to 0? Following is copied from "Documentation/leds/leds-class.txt"

"Setting the brightness to zero with brightness_set() callback function
should completely turn off the LED and cancel the previously programmed
hardware blinking function, if any."

The chip driver could also use other methods for the same, keeping brightness independent of blink.

For example,  delay_on/off 
 delay_off=0 ==> blink off, led on.
 delay_on=0  ==> blink off, led off.

Or am I overlooking something?

Many Thanks,
Tony
