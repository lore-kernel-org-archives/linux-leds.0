From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: make ledtrig-gpio useable with GPIO drivers requiring threaded irqs
Date: Tue,  9 Sep 2014 09:40:31 +0200
Message-ID: <1410248433-24005-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail.karo-electronics.de ([81.173.242.67]:56881 "EHLO
	mail.karo-electronics.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932089AbaIIHkl (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 9 Sep 2014 03:40:41 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Bryan Wu <cooloney@gmail.com>

These patches make it possible to use the ledtrig-gpio driver with
GPIO drivers that require threaded IRQs (like the PCA953x I2C driver).
It has been tested with a PCA9554 chip on an i.MX28 module.
