From: Bryan Wu <cooloney@gmail.com>
Subject: [GIT PULL] leds fixes for 3.13-rc2
Date: Mon, 2 Dec 2013 12:03:01 -0800
Message-ID: <CAK5ve-Jf=rEBaS0MDfk9DCXEeRa16ddKtF1fseW=c_8q7tm0Vg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>, lkml <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>
List-Id: linux-leds@vger.kernel.org

Hi Linus,

Please consider the following bug fix since commit
dc1ccc48159d63eca5089e507c82c7d22ef60839:

  Linux 3.13-rc2 (2013-11-29 12:57:14 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/cooloney/linux-leds.git
leds-fixes-for-3.13

for you to fetch changes up to aa1a6d6d74fff31060e08f6007037e6d807c8130:

  leds: pwm: Fix for deferred probe in DT booted mode (2013-12-02
11:53:17 -0800)

----------------------------------------------------------------
Peter Ujfalusi (1):
      leds: pwm: Fix for deferred probe in DT booted mode

 drivers/leds/leds-pwm.c | 53 ++++++++++++++++++++++++-------------------------
 1 file changed, 26 insertions(+), 27 deletions(-)
