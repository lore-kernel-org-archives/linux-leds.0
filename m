From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [GIT PULL] LED subsystem updates for 4.5
Date: Mon, 11 Jan 2016 21:56:45 +0100
Message-ID: <1452545805-2383-1-git-send-email-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, j.anaszewski@samsung.com, rpurdie@rpsys.net, noltari@gmail.com, andrew@lunn.ch, hkallweit1@gmail.com, ingi2.kim@samsung.com, markus.hofstaetter@ait.ac.at, milo.kim@ti.com, paul.gortmaker@windriver.com, robh@kernel.org, saurabh.truth@gmail.com, simon@fire.lp0.eu, treding@nvidia.com, u.kleine-koenig@pengutronix.de, vegard.nossum@oracle.com
List-Id: linux-leds@vger.kernel.org

Hi Linus,

Besides regular driver updates, we introduce a portion of LED core impr=
ovements,
that allow to avoid the need for using work queues in the LED class dri=
vers,
that set brightness in a blocking way. Affected LED class drivers are b=
eing
optimized accordingly.

Please note that in case of drivers/leds/leds-pca9532.c a conflict can =
occur
due to the patch [1], if GPIO updates are applied before LED updates.
In the opposite case the patch applies correctly with 3way merge.

The following changes since commit 168309855a7d1e16db751e9c647119fe2d2d=
c878:

  Linux 4.4-rc8 (2016-01-03 15:15:37 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds=
=2Egit tags/leds-for-4.5

for you to fetch changes up to 522f17e1214cf112e62cff56150964d8b68b94b2=
:

  leds: add HAS_IOMEM dependency to LEDS_BCM6328/LEDS_BCM6358 (2016-01-=
04 09:57:41 +0100)

[1] https://patches.linaro.org/58284/

Best Regards,
Jacek Anaszewski

----------------------------------------------------------------
- LED core improvements:
        - use EXPORT_SYMBOL_GPL consistently,
        - add two new LED_BLINK_ flags,
        - rename brightness_set_sync op to brightness_set_blocking,
        - add led_set_brightness_nosleep{nopm} functions,
        - use set_brightness_work for the blocking op,
        - drivers shouldn't enforce SYNC/ASYNC brightness setting,
        - turn off the LED and wait for completion on unregistering LED
          class device,
        - add managed version of led_trigger_register,
        - add description of brightness setting API to the LED class do=
c.

- Remove work queues from drivers: leds-tlc591xx, leds-88pm860x, leds-a=
dp5520,
        leds-bd2802, leds-blinkm, leds-lm3533, leds-lm3642, leds-pca953=
2,
        leds-lp3944, leds-lp55xx, leds-lp8788, leds-lp8860, leds-pca955=
x,
        leds-pca963x, leds-wm831x, leds-da903x, leds-da9052, leds-dac12=
4d085,
        leds-lt3593, leds-max8997, leds-mc13783, leds-regulator, leds-w=
m8350,
        leds-max77693, leds-aat1290, leds-ktd2692, leds-gpio, leds-pwm,
        leds-lm355x, leds-ns2.

- Replace brightness_set op with a new brightness_set_blocking op to ma=
ke the
  drivers compatible with led triggers: leds-ipaq-micro, leds-powernv.

- Add missing of_node_put: leds-ktd2692, leds-aat1290, leds-max77693.

- Make the driver explicitly non-modular: ledtrig-cpu, ledtrig-ide-disk=
,
        leds-syscon.

- Improvements to leds-bcm6328:
        - reuse bcm6328_led_set() instead of copying its functionality,
        - swap LED ON and OFF definitions,
        - improve blink support,
        - simplify duplicated unlock in bcm6328_blink_set,
        - add little endian support,
        - remove unneded lock when checking initial LED status,
        - add HAS_IOMEM dependency,
        - code cleaning.

- Improvements to leds-bcm6358:
        - use bcm6358_led_set() in order to get rid of the lock,
        - merge bcm6358_led_mode and bcm6358_led_set,
        - add little endian support,
        - remove unneded lock when checking initial LED status,
        - add HAS_IOMEM dependency,
        - remove unneeded busy status check.

- Call led_pwm_set() in leds-pwm to enforce default LED_OFF.

- Fix duration to be msec instead of jiffies: ledtrig-transient.

- Removing NULL check: leds-powernv.

- Use platform_register/unregister_drivers(): leds-sunfire.

- Fix module license specification: ledtrig-oneshot.

- Fix driver description and make license match the header: leds-pwm.

- Remove checking for state < 1 in flash_strobe_store(): led-class-flas=
h.

- Use led_set_brightness_sync for torch brightness: v4l2-flash-led-clas=
s

----------------------------------------------------------------
Andrew Lunn (23):
      leds: tlc591xx: Remove work queue
      leds: 88pm860x: Remove work queue
      leds: adp5520: Remove work queue
      leds: bd2802: Remove work queue
      leds: blinkm: Remove work queue
      leds: lm3533: Remove work queue
      leds: lm3642: Remove work queue
      leds: pca9532: Remove work queue for LEDs.
      leds: lp3944: Remove work queue
      leds: lp55xx: Remove work queue
      leds: lp8788: Remove work queue
      leds: lp8860: Remove work queue
      leds: pca955x: Remove work queue
      leds: pca963x: Remove work queue
      leds: wm831x: Remove work queue
      leds: da903x: Remove work queue
      leds: da9052: Remove work queue
      leds: dac124d085: Remove work queue
      leds: lt3593: Remove work queue
      leds: max8997: Remove unneeded workqueue include
      leds: mc13783: Remove work queue
      leds: regulator: Remove work queue
      leds: wm8350: Remove work queue

Heiner Kallweit (1):
      leds: core: add managed version of led_trigger_register

Ingi Kim (1):
      leds: ktd2692: Add missing of_node_put

Jacek Anaszewski (20):
      leds: core: Use EXPORT_SYMBOL_GPL consistently
      leds: core: Add two new LED_BLINK_ flags
      leds: Rename brightness_set_sync op to brightness_set_blocking
      leds: core: Add led_set_brightness_nosleep{nopm} functions
      leds: core: Use set_brightness_work for the blocking op
      leds: core: Drivers shouldn't enforce SYNC/ASYNC brightness setti=
ng
      Documentation: leds: Add description of brightness setting API
      leds: max77693: Remove work queue
      leds: aat1290: Remove work queue
      leds: ktd2692: Remove work queue
      media: flash: use led_set_brightness_sync for torch brightness
      leds: gpio: Remove work queue
      leds: pwm: remove work queue
      leds: lm355x: Remove work queue
      leds: flash: Remove checking for state < 1 in flash_strobe_store(=
)
      leds: ns2: Remove work queue
      leds: ipaq-micro: Implement brightness_set_blocking op
      leds: powernv: Implement brightness_set_blocking op
      leds: aat1290: Add missing of_node_put
      leds: max77693: Add missing of_node_put

Markus Hofstaetter (1):
      leds: call led_pwm_set() in leds-pwm to enforce default LED_OFF

Milo Kim (1):
      leds: turn off the LED and wait for completion on unregistering L=
ED class device

Paul Gortmaker (3):
      leds: ledtrig-cpu: Make the driver explicitly non-modular
      leds: ledtrig-ide-disk: Make the driver explicitly non-modular
      leds: syscon: Make the driver explicitly non-modular

Rob Herring (1):
      leds: ledtrig-transient: fix duration to be msec instead of jiffi=
es

Saurabh Sengar (1):
      leds: powernv: removing NULL check

Simon Arlott (2):
      leds: bcm6328: Reuse bcm6328_led_set() instead of copying its fun=
ctionality
      leds: bcm6328: Swap LED ON and OFF definitions

Thierry Reding (1):
      leds: sunfire: Use platform_register/unregister_drivers()

Uwe Kleine-K=C3=B6nig (2):
      leds: triggers: oneshot: fix module license specification
      leds: pwm: fix driver description and make license match the head=
er

Vegard Nossum (1):
      leds: add HAS_IOMEM dependency to LEDS_BCM6328/LEDS_BCM6358

=C3=81lvaro Fern=C3=A1ndez Rojas (10):
      leds: bcm6328: code cleaning
      leds: bcm6328: remove unneded lock when checking initial LED
      leds: bcm6358: Use bcm6358_led_set() in order to get rid of the l=
ock
      leds: bcm6358: remove unneded lock when checking initial LED stat=
us
      leds: bcm6328: add little endian support
      leds: bcm6358: add little endian support
      leds: bcm6328: simplify duplicated unlock in bcm6328_blink_set
      leds: bcm6358: merge bcm6358_led_mode and bcm6358_led_set
      leds: bcm6328: improve blink support
      leds: bcm6358: remove unneeded busy status check

 Documentation/leds/leds-class.txt              |  13 +++
 drivers/leds/Kconfig                           |   2 +
 drivers/leds/led-class-flash.c                 |   8 +-
 drivers/leds/led-class.c                       |  11 ++-
 drivers/leds/led-core.c                        | 120 +++++++++++++++++=
+-------
 drivers/leds/led-triggers.c                    |  28 ++++++
 drivers/leds/leds-88pm860x.c                   |  23 ++---
 drivers/leds/leds-aat1290.c                    |  59 ++++--------
 drivers/leds/leds-adp5520.c                    |  26 ++----
 drivers/leds/leds-bcm6328.c                    |  63 +++++++------
 drivers/leds/leds-bcm6358.c                    |  37 ++++----
 drivers/leds/leds-bd2802.c                     |  39 +++-----
 drivers/leds/leds-blinkm.c                     |  87 ++++-------------=
-
 drivers/leds/leds-da903x.c                     |  46 ++++------
 drivers/leds/leds-da9052.c                     |  39 +++-----
 drivers/leds/leds-dac124s085.c                 |  38 +++-----
 drivers/leds/leds-gpio.c                       |  62 +++++--------
 drivers/leds/leds-ipaq-micro.c                 |   6 +-
 drivers/leds/leds-ktd2692.c                    |  50 +++--------
 drivers/leds/leds-lm3533.c                     |  30 ++-----
 drivers/leds/leds-lm355x.c                     |  85 ++++++-----------=
-
 drivers/leds/leds-lm3642.c                     |  73 +++++----------
 drivers/leds/leds-lp3944.c                     |  32 ++-----
 drivers/leds/leds-lp5521.c                     |  11 +--
 drivers/leds/leds-lp5523.c                     |  10 +--
 drivers/leds/leds-lp5562.c                     |  11 +--
 drivers/leds/leds-lp55xx-common.c              |  12 ++-
 drivers/leds/leds-lp55xx-common.h              |   6 +-
 drivers/leds/leds-lp8501.c                     |  11 +--
 drivers/leds/leds-lp8788.c                     |  48 +++++-----
 drivers/leds/leds-lp8860.c                     |  27 ++----
 drivers/leds/leds-lt3593.c                     |  33 +++----
 drivers/leds/leds-max77693.c                   |  58 +++---------
 drivers/leds/leds-max8997.c                    |   1 -
 drivers/leds/leds-mc13783.c                    |  35 ++------
 drivers/leds/leds-ns2.c                        |  31 +++----
 drivers/leds/leds-pca9532.c                    |  28 +++---
 drivers/leds/leds-pca955x.c                    |  39 ++------
 drivers/leds/leds-pca963x.c                    |  80 +++++------------
 drivers/leds/leds-powernv.c                    |  18 ++--
 drivers/leds/leds-pwm.c                        |  39 ++++----
 drivers/leds/leds-regulator.c                  |  46 +++-------
 drivers/leds/leds-sunfire.c                    |  23 ++---
 drivers/leds/leds-syscon.c                     |  18 +---
 drivers/leds/leds-tlc591xx.c                   |  31 ++-----
 drivers/leds/leds-wm831x-status.c              |  25 ++----
 drivers/leds/leds-wm8350.c                     |  64 ++++++-------
 drivers/leds/leds.h                            |  27 +-----
 drivers/leds/trigger/ledtrig-backlight.c       |   8 +-
 drivers/leds/trigger/ledtrig-cpu.c             |  26 +-----
 drivers/leds/trigger/ledtrig-default-on.c      |   2 +-
 drivers/leds/trigger/ledtrig-gpio.c            |   6 +-
 drivers/leds/trigger/ledtrig-heartbeat.c       |   4 +-
 drivers/leds/trigger/ledtrig-ide-disk.c        |  14 +--
 drivers/leds/trigger/ledtrig-oneshot.c         |   6 +-
 drivers/leds/trigger/ledtrig-transient.c       |  10 +--
 drivers/media/v4l2-core/v4l2-flash-led-class.c |   8 +-
 include/linux/leds.h                           |  29 ++++--
 include/linux/mfd/wm8350/pmic.h                |   1 -
 59 files changed, 677 insertions(+), 1146 deletions(-)
