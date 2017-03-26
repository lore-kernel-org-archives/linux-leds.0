From: Jacek Anaszewski <anjack@poczta.onet.pl>
Subject: Stable branch dell-laptop-changes-for-4.12
Date: Sun, 26 Mar 2017 10:18:45 +0200
Message-ID: <992db922-efe5-ed64-2af0-7f3f7d7a4ec9@poczta.onet.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi Andy, Darren,

I've created stable branch dell-laptop-changes-for-4.12

in the repository

git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git

for you to merge due to the conflict in linux-next:

Today's linux-next merge of the leds tree got a conflict in:

  drivers/platform/x86/dell-laptop.c

between commit:

  573eedacfba3 ("platform/x86: dell-*: Call new led hw_changed API on
kbd brightness change")

from the drivers-x86 tree and commit:

  44319ab7e0ed ("platform/x86: dell-laptop: import
dell_micmute_led_set() from drivers/leds/dell-led.c")

from the leds tree.

Thanks,
Jacek Anaszewski
