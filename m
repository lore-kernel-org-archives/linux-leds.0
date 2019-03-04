From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [GIT PULL] LED updates for 5.1-rc1
Date: Mon,  4 Mar 2019 21:11:10 +0100
Message-ID: <20190304201110.3969-1-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, krzk@kernel.org, michal@plume.com
List-Id: linux-leds@vger.kernel.org

Hi Linus,

Please pull LED updates for 5.1-rc1.

We finalize previously announced support for initialization of pattern triggers
from Device Tree.

Beside that there is a single fix for null deref on firmware load failure
in leds-lp55xx-common.c.

The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/leds-for-5.1-rc1

for you to fetch changes up to 5ddb0869bfc1bca6cfc592c74c64a026f936638c:

  leds: lp55xx: fix null deref on firmware load failure (2019-02-14 22:03:44 +0100)

Thanks,
Jacek Anaszewski

----------------------------------------------------------------
LED updates for 5.1-rc1
----------------------------------------------------------------
Krzysztof Kozlowski (5):
      dt-bindings: leds: Add pattern initialization from Device Tree
      leds: Add helper for getting default pattern from Device Tree
      leds: trigger: pattern: Add pattern initialization from Device Tree
      leds: trigger: oneshot: Add initialization from Device Tree
      leds: trigger: timer: Add initialization from Device Tree

Michal Kazior (1):
      leds: lp55xx: fix null deref on firmware load failure

 .../ABI/testing/sysfs-class-led-trigger-pattern    | 51 +----------
 Documentation/devicetree/bindings/leds/common.txt  | 12 +++
 .../bindings/leds/leds-trigger-pattern.txt         | 49 +++++++++++
 drivers/leds/led-core.c                            | 30 +++++++
 drivers/leds/leds-lp55xx-common.c                  |  4 +-
 drivers/leds/trigger/ledtrig-oneshot.c             | 38 ++++++++-
 drivers/leds/trigger/ledtrig-pattern.c             | 99 +++++++++++++++++-----
 drivers/leds/trigger/ledtrig-timer.c               | 34 ++++++++
 include/linux/leds.h                               | 13 +++
 9 files changed, 259 insertions(+), 71 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-trigger-pattern.txt
