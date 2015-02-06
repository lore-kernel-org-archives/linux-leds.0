From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [RFC] multi led support
Date: Fri,  6 Feb 2015 19:18:47 +0100
Message-ID: <1423246729-4932-1-git-send-email-bigeasy@linutronix.de>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:38457 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757988AbbBFSTJ (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 6 Feb 2015 13:19:09 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-leds@vger.kernel.org, linux-pwm@vger.kernel.org

Patch #2 introduces the multi LED support. It is based on the "single"
led-pwm support. Since it is RFC only I haven't introduced DT-binding
documentation.
I assumed to it to be "little" but due to the way the LED layer stores
things it got a little larger than expected. Hints how to accomplish this
in a different / shorter way are greatly welcome, this is however what I use
right now.

Sebastian
