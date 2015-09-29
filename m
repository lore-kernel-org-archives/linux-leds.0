From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: leds: inconsistent use of EXPORT_SYMBOL_* macros
Date: Tue, 29 Sep 2015 15:35:44 +0200
Message-ID: <560A93B0.3070605@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:41496 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965003AbbI2Nfr (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 29 Sep 2015 09:35:47 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

Hi Linus,

In drivers/leds/led-core.c some symbols are exported with
EXPORT_SYMBOL and other with EXPORT_SYMBOL_GPL macros.

It seems that this mess wasn't introduced intentionally, but rather
carelessly, as in case of led_blink_set() and led_stop_software_blink()
functions, where the former, which enables blinking, is exported with
EXPORT_SYMBOL, and the latter, which disables blinking, with
EXPORT_SYMBOL_GPL.

It is also worth of noting that all symbols in drivers/led/led-class.c
are exported with EXPORT_SYMBOL_GPL, which implies that it is not
possible to register LED class device with non-GPL API, which in
turn rather eliminates non-GPL users of led-core API.

I'd like just confirm that in this case we are permitted to
switch to using EXPORT_SYMBOL_GPL consequently in the LED core.

-- 
Best Regards,
Jacek Anaszewski
