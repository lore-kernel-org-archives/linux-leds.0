From: kbuild test robot <fengguang.wu@intel.com>
Subject: [next:master 11893/11947] drivers/leds/leds-aat1290.c:397:21:
 sparse: symbol 'aat1290_intensity_to_brightness' was not declared. Should it
 be static?
Date: Wed, 17 Jun 2015 14:56:39 +0800
Message-ID: <201506171403.akc8Fj4R%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:4451 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752605AbbFQG53 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Wed, 17 Jun 2015 02:57:29 -0400
Content-Disposition: inline
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: kbuild-all@01.org, Michael Ellerman <mpe@ellerman.id.au>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ca3cfaa9e7db530b14e4a2d98a9310130152fdb8
commit: 1da60a5e7198c716990ac6fa508e45e27e7067c0 [11893/11947] Merge remote-tracking branch 'leds/for-next'
reproduce:
  # apt-get install sparse
  git checkout 1da60a5e7198c716990ac6fa508e45e27e7067c0
  make ARCH=x86_64 allmodconfig
  make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)

   drivers/leds/leds-aat1290.c:334:5: sparse: symbol 'init_mm_current_scale' was not declared. Should it be static?
>> drivers/leds/leds-aat1290.c:397:21: sparse: symbol 'aat1290_intensity_to_brightness' was not declared. Should it be static?
>> drivers/leds/leds-aat1290.c:412:5: sparse: symbol 'aat1290_brightness_to_intensity' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
