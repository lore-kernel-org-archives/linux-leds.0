From: Luigi Baldoni <aloisio@gmx.com>
Subject: [PATCH 0/3]: Add PCEngines APU1/APU2 drivers
Date: Thu, 4 May 2017 12:59:35 +0200
Message-ID: <59f28507-c11e-039c-7138-56f1d7a5c1dc@gmx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.20]:49306 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751799AbdEDK7j (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 4 May 2017 06:59:39 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org

This patch adds support for the PCEngines APU1 and APU2 LEDs.

Signed-off-by: Christian Herzog <daduke@daduke.org>

---
  drivers/leds/Kconfig     |   22 ++++
  drivers/leds/Makefile    |    2
  drivers/leds/leds-apu.c  |  213 +++++++++++++++++++++++++++++++++++++++++
  drivers/leds/leds-apu2.c |  243 
+++++++++++++++++++++++++++++++++++++++++++++++
  4 files changed, 480 insertions(+)
