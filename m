From: Matt Ranostay <mranostay@gmail.com>
Subject: [PATCH v6 0/2] cap11xx: add LED support
Date: Tue, 23 Jun 2015 23:50:52 -0700
Message-ID: <1435128654-19454-1-git-send-email-mranostay@gmail.com>
Return-path: <linux-input-owner@vger.kernel.org>
Sender: linux-input-owner@vger.kernel.org
To: zonque@gmail.com, dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Matt Ranostay <mranostay@gmail.com>
List-Id: linux-leds@vger.kernel.org

changes from v5:
* Dropped linux,led-brightness DT property
* Removed several ifdefs to LED CLASS
* Added cap11xx_init_leds stub

Matt Ranostay (2):
  dt: add cap11xx LED documentation
  cap11xx: add LED support

 .../devicetree/bindings/input/cap11xx.txt          |  19 +++
 drivers/input/keyboard/cap11xx.c                   | 140 ++++++++++++++++++++-
 2 files changed, 156 insertions(+), 3 deletions(-)

-- 
1.9.1

