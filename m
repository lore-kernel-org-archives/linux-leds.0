From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [GIT PULL] LED fix for 4.12-rc3
Date: Fri, 26 May 2017 21:52:39 +0200
Message-ID: <1495828359-3307-1-git-send-email-jacek.anaszewski@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36542 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933961AbdEZTxh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 26 May 2017 15:53:37 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, tnhuynh@apm.com

Hi Linus,

Please pull single LED fix for 4.12-rc3.

leds-pca955x driver uses only i2c_smbus API and thus it should pass
I2C_FUNC_SMBUS_BYTE_DATA flag to i2c_check_functionality().

The following changes since commit 2ea659a9ef488125eb46da6eb571de5eae5c43f6:

  Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/led_fixes_for_4-12-rc3

for you to fetch changes up to aace34c0bb8ea3c8bdcec865b6a4be4db0a68e33:

  leds: pca955x: Correct I2C Functionality (2017-05-22 21:12:44 +0200)

Best regards,
Jacek Anaszewski

Tin Huynh (1):
      leds: pca955x: Correct I2C Functionality

 drivers/leds/leds-pca955x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
