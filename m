From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 0/3] leds: avoid module usage in non-modular code
Date: Sun, 13 Dec 2015 16:45:48 -0500
Message-ID: <1450043151-30820-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail5.windriver.com ([192.103.53.11]:39578 "EHLO mail5.wrs.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751057AbbLMVqU (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Sun, 13 Dec 2015 16:46:20 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Bryan Wu <cooloney@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Jacek Anaszewski <j.anaszewski@samsung.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org

This series of commits is a part of a larger project to ensure
people don't reference modular support functions in non-modular
code.  Overall there was roughly 5k lines of dead code in the
kernel due to this.  So far we've fixed several areas, like tty,
x86, net, ... and we continue to work on other areas.

There are several reasons to not use module support for code that
can never be built as a module, but the big ones are:

 (1) it is easy to accidentally code up unused module_exit and remove code
 (2) it can be misleading when reading the source, thinking it can be
      modular when the Makefile and/or Kconfig prohibit it
 (3) it requires the include of the module.h header file which in turn
     includes nearly everything else.

For the LED subsystem, there are just three commits.  Two are basically
trivial remapping to the appropriate non-modular counterparts.  The
third also has a change to block driver unbinding since that doesn't
make any sense and it allows us to delete the .remove code.  We've
already made similar unbind changes like this in drivers/tty.

Patches created on linux-next and build tested for ARM allmodconfig.

Paul.
---

Cc: Bryan Wu <cooloney@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Richard Purdie <rpurdie@rpsys.net>
Cc: linux-leds@vger.kernel.org

Paul Gortmaker (3):
  drivers/leds: make trigger/ledtrig-cpu.c driver explicitly non-modular
  drivers/leds: make trigger/ledtrig-ide-disk.c driver explicitly non-modular
  drivers/leds: make leds-syscon.c explicitly non-modular

 drivers/leds/leds-syscon.c              | 18 +++---------------
 drivers/leds/trigger/ledtrig-cpu.c      | 26 +-------------------------
 drivers/leds/trigger/ledtrig-ide-disk.c | 14 +-------------
 3 files changed, 5 insertions(+), 53 deletions(-)

-- 
2.6.1
